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
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPassword
    case invalidConfirmPassword
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponse:
            return "Invalid Response"
        case .invalidURL:
            return "Invalid URL"
        case .invalidFirstName:
            return "Invalid first name provided."
        case .invalidLastName:
            return "Invalid last name provided."
        case .invalidEmail:
            return "Invalid email provided."
        case .invalidPassword:
            return "Invalid password provided."
        case .invalidConfirmPassword:
            return "Password and Confirm Password does not match."
            
        }
    }
}
