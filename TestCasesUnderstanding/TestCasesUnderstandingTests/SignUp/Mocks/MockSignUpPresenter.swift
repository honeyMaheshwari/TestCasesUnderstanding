//
//  MockSignUpPresenter.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 06/07/24.
//

import Foundation
@testable import TestCasesUnderstanding

class MockSignUpPresenter: SignUpPresenterProtocol {
    
    var isProcessUserSignUpMethodCalled: Bool = false
    
    required init(validator: SignUpInputDataValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol) {
//        self.validator = validator
//        self.webService = webService
//        self.delegate = delegate
    }
    
    func processUserSignUp(with form: SignUpFormModel) {
        isProcessUserSignUpMethodCalled = true
    }
    
    
}
