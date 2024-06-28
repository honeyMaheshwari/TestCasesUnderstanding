//
//  SignUpError.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 28/06/24.
//

import Foundation

enum SignUpError: LocalizedError, Equatable {
    case invalidResponse
    case invalidURL
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponse, .invalidURL:
            return ""
        }
    }
}
