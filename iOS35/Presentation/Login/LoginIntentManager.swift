//
//  LoginObservable.swift
//  iOS35
//
//  Created by 우상욱 on 11/2/24.
//

import Foundation
import Combine

class LoginIntentManager {
    @Published var state: LoginState = LoginState()
    let sideEffect = PassthroughSubject<LoginSideEffect, Never>()
    var userService: UserService?
    var tokenManager: TokenManager?
    
    init() {
        self.userService = UserService.shared
        self.tokenManager = TokenManager.shared
    }
    
    func login(){
        userService?.login(username: state.id, password: state.pw){ [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let token) :
                    self.tokenManager?.create(value: token)
                    self.state = self.state.copy(errorMessage: "성공 입니다.")
                    self.sendNavigateToMain()
                case let .failure(error): self.state = self.state.copy(errorMessage: error.errorMessage)
                }
            }
        }
    }
    
    func checkAutoLogin(){
        if let token = tokenManager?.read() {
            print("토큰 있음 \(token)")
            sendNavigateToMain()
        } else {
            return
        }
    }
    
    private func sendNavigateToMain() {
        sideEffect.send(.NavigateToMain)
    }
    
    func sendNavigateToSignUp() {
        sideEffect.send(.NavigateToSignUp)
    }
    
    func updateId(id: String){
        state = state.copy(id: id)
    }
    
    func updatePw(pw: String){
        state = state.copy(pw: pw)
    }
}
