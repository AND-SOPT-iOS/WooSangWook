//
//  Environment.swift
//  iOS35
//
//  Created by 우상욱 on 11/2/24.
//

import Foundation

enum Environment {
    static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
