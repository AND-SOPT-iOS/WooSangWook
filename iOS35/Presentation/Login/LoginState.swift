//
//  LoginState.swift
//  iOS35
//
//  Created by 우상욱 on 11/2/24.
//

import Foundation

struct LoginState {
    var id: String
    var pw: String
    var errorMessage: String
    
    init(id: String = "", pw: String = "", errorMessage: String = "") {
        self.id = id
        self.pw = pw
        self.errorMessage = errorMessage
    }
    
    func copy(id: String? = nil, pw: String? = nil, errorMessage: String? = nil) -> LoginState {
        return LoginState(
            id: id ?? self.id,
            pw: pw ?? self.pw,
            errorMessage: errorMessage ?? self.errorMessage
        )
    }
}
