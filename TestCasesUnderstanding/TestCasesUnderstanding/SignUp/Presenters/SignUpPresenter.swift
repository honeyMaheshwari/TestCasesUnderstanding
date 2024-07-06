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
            return
        }
        
        if !validator.isValidLastName(form.lastName) {
            return
        }
        
        if !validator.isValidEmail(form.email) {
            return
        }
        
        if !validator.isValidPassword(form.password) {
            return
        }
        
        if !validator.doesPasswordMatch(password: form.password, confirmPassword: form.confirmPassword) {
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
