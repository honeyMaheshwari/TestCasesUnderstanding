//
//  SignUpFormModelValidator.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 26/06/24.
//

import Foundation

struct SignUpFormValidator {
    
    func isValidFirstName(_ name: String) -> Bool {
        var result = true
        let n = name.trimmingCharacters(in: .whitespaces)
        let count = n.count
        if count < SignUpConstants.firstNameMinimumLenght || count > SignUpConstants.firstNameMaximumLenght {
            result = false
        }
        return result
    }
    
    func isValidLastName(_ name: String) -> Bool {
        var result = true
        let n = name.trimmingCharacters(in: .whitespaces)
        let count = n.count
        if count < SignUpConstants.lastNameMinimumLenght || count > SignUpConstants.lastNameMaximumLenght {
            result = false
        }
        return result
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let e = email.trimmingCharacters(in: .whitespaces)
        guard !e.isEmpty else {
            return false
        }
        let result = validateEmail(e)
        return result
    }
    
    private func validateEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        var result = true
        let p = password.trimmingCharacters(in: .whitespaces)
        let count = p.count
        if count < SignUpConstants.passwordMinimumLenght || count > SignUpConstants.passwordMaximumLenght {
            result = false
        }
        return result
    }
    
    func doesPasswordMatch(password: String, confirmPassword: String) -> Bool {
        let result = password == confirmPassword
        return result
    }
    
}

struct SignUpConstants {
    static let firstNameMinimumLenght: Int = 2
    static let firstNameMaximumLenght: Int = 15
    static let lastNameMinimumLenght: Int = 2
    static let lastNameMaximumLenght: Int = 20
    static let passwordMinimumLenght: Int = 8
    static let passwordMaximumLenght: Int = 20
    static let signUpURLString: String = "http://localhost:3001/users/mockSignUp"
}
