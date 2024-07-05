//
//  MockSignUpViewDelegate.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import Foundation
import XCTest
@testable import TestCasesUnderstanding

class MockSignUpViewDelegate: SignUpViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var signUpError: SignUpError?
    var successFullSignUpCounter = 0
    var errorHandlerCounter = 0
    
    func successFullSignUp() {
        successFullSignUpCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignUpError) {
        signUpError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
}
