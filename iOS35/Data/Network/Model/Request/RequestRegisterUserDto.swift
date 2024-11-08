//
//  RequestRegisterUserDto.swift
//  iOS35
//
//  Created by 우상욱 on 11/2/24.
//

import Foundation

struct RequestRegisterUserDto: Codable {
    let username: String
    let password: String
    let hobby: String
}
