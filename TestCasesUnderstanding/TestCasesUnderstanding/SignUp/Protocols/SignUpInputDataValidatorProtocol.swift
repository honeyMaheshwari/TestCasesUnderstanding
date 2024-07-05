//
//  SignUpInputDataValidatorProtocol.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import Foundation

protocol SignUpInputDataValidatorProtocol {
    func isValidFirstName(_ name: String) -> Bool
    func isValidLastName(_ name: String) -> Bool
    func isValidEmail(_ email: String) -> Bool
    func isValidPassword(_ password: String) -> Bool
    func doesPasswordMatch(password: String, confirmPassword: String) -> Bool
}
