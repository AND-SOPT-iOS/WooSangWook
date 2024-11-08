//
//  MyPageState.swift
//  iOS35
//
//  Created by 우상욱 on 11/8/24.
//

import Foundation

struct MyPageState {
    let hobby: String
    
    init(hobby: String = "") {
        self.hobby = hobby
    }
    
    func copy(hobby: String? = nil) -> MyPageState {
        return MyPageState(hobby: hobby ?? self.hobby)
    }
}
