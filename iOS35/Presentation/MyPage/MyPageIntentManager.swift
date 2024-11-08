//
//  MyPageIntentManager.swift
//  iOS35
//
//  Created by 우상욱 on 11/8/24.
//

import Foundation
import Combine

class MyPageIntentManager {
    @Published var state = MyPageState()
    let sideEffect = PassthroughSubject<MyPageSideEffect, Never>()
    var userService: UserService?
    var tokenManager: TokenManager?
    
    init() {
        userService = UserService.shared
        tokenManager = TokenManager.shared
        getUserHobby()
    }
    
    func getUserHobby() {
        userService?.getUserHobby(){ [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let hobby) :
                    self.state = self.state.copy(hobby: hobby)
                case let .failure(error):
                    print(error.errorMessage)
                    self.state = self.state.copy(hobby: error.errorMessage)
                }
            }
        }
    }
    
    func LogOut() {
        do {
            try tokenManager?.delete()
            sideEffect.send(.LogOutSuccess)
        } catch let error as KeychainError {
            switch error {
            case .deleteFailed(let message):
                print("토큰 삭제 실패: \(message)")
            default:
                print("알 수 없는 오류 발생")
            }
        } catch {
            print("예상치 못한 오류 발생: \(error)")
        }
    }
}
