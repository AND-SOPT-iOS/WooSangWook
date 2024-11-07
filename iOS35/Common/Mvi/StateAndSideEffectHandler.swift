//
//  StateAndSideEffectHandler.swift
//  iOS35
//
//  Created by 우상욱 on 11/1/24.
//

import Foundation

protocol StateAndSideEffectHandler {
    func receiveState()
    func receiveSideEffect()
}
