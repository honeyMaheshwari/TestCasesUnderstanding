//
//  MockSignUpInputDataValidator.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import Foundation
@testable import TestCasesUnderstanding

class MockSignUpInputDataValidator: SignUpInputDataValidatorProtocol {
    
    var isValidFirstName: Bool = false
    var isValidLastName: Bool = false
    var isValidEmail: Bool = false
    var isValidPassword: Bool = false
    var isValidConfirmPassword: Bool = false
    
    func isValidFirstName(_ name: String) -> Bool {
        isValidFirstName = true
        return isValidFirstName
    }
    
    func isValidLastName(_ name: String) -> Bool {
        isValidLastName = true
        return isValidLastName
    }
    
    func isValidEmail(_ email: String) -> Bool  {
        isValidEmail = true
        return isValidEmail
    }
    
    func isValidPassword(_ password: String) -> Bool {
        isValidPassword = true
        return isValidPassword
    }
    
    func doesPasswordMatch(password: String, confirmPassword: String) -> Bool {
        isValidPassword = true
        isValidConfirmPassword = true
        return isValidConfirmPassword
    }
    
}
