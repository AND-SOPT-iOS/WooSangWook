//
//  AuthInterceptor.swift
//  iOS35
//
//  Created by 우상욱 on 11/8/24.
//

import Foundation
import Alamofire

class AuthInterceptor : RequestInterceptor {
    private let retryLimit = 3
    private let retryDelay: TimeInterval = 1.0

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        if let token = TokenManager.shared.read() {
            request.setValue("\(token)", forHTTPHeaderField: "token")
        }
        completion(.success(request))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard request.retryCount < retryLimit else {
            completion(.doNotRetry)
            return
        }
        completion(.retryWithDelay(retryDelay))
    }
}
