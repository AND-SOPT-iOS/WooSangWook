//
//  SignUpIntentManager.swift
//  iOS35
//
//  Created by 우상욱 on 11/8/24.
//

import Foundation
import Combine

class SignUpIntentManager {
    @Published var state: SignUpState = SignUpState()
    let sideEffect = PassthroughSubject<SignUpSideEffect, Never>()
    var userService: UserService?
    
    init() {
        self.userService = UserService.shared
    }
    
    func signUp(){
        userService?.register(username: state.id, password: state.pw, hobby: state.hobby){ [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success :
                    self.sendSignupSuccess()
                case let .failure(error): self.state = self.state.copy(errorMessage: error.errorMessage)
                }
            }
        }
    }
    
    private func sendSignupSuccess(){
        sideEffect.send(.SignUpSuccess)
    }
    
    func updateId(id: String){
        state = state.copy(id: id)
    }
    
    func updatePw(pw: String){
        state = state.copy(pw: pw)
    }
    
    func updateHobby(hobby: String){
        state = state.copy(hobby: hobby)
    }
}
