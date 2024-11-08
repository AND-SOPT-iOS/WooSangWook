//
//  SignUpState.swift
//  iOS35
//
//  Created by 우상욱 on 11/8/24.
//

import Foundation

struct SignUpState {
    let id: String
    let pw: String
    let hobby: String
    let errorMessage: String
    
    init(id: String = "", pw: String = "", hobby: String = "", errorMessage: String = "") {
        self.id = id
        self.pw = pw
        self.hobby = hobby
        self.errorMessage = errorMessage
    }
    
    func copy(id: String? = nil, pw: String? = nil, hobby: String? = nil, errorMessage: String? = nil) -> SignUpState {
        return SignUpState(
            id: id ?? self.id,
            pw: pw ?? self.pw,
            hobby: hobby ?? self.hobby,
            errorMessage: errorMessage ?? self.errorMessage
        )
    }
}
