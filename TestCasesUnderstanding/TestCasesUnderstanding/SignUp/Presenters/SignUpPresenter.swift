//
//  c.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import Foundation

class SignUpPresenter: SignUpPresenterProtocol {
    
    private let validator: SignUpInputDataValidatorProtocol
    private let webService: SignUpWebServiceProtocol
    private weak var delegate: SignUpViewDelegateProtocol?
    
    required init(validator: SignUpInputDataValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol) {
        self.validator = validator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignUp(with form: SignUpFormModel) {
        
        if !validator.isValidFirstName(form.firstName) {
            delegate?.errorHandler(error: .invalidFirstName)
            return
        }
        
        if !validator.isValidLastName(form.lastName) {
            delegate?.errorHandler(error: .invalidLastName)
            return
        }
        
        if !validator.isValidEmail(form.email) {
            delegate?.errorHandler(error: .invalidEmail)
            return
        }
        
        if !validator.isValidPassword(form.password) {
            delegate?.errorHandler(error: .invalidPassword)
            return
        }
        
        if !validator.doesPasswordMatch(password: form.password, confirmPassword: form.confirmPassword) {
            delegate?.errorHandler(error: .invalidConfirmPassword)
            return
        }
        
        let request = SignUpRequest(form: form)
        webService.signUp(with: request) { [weak self] response, error in
            if response != nil {
                self?.delegate?.successFullSignUp()
                return
            } else if let error = error {
                self?.delegate?.errorHandler(error: error)
            }
        }
    }
    
}
