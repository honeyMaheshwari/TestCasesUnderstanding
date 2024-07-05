//
//  MockSignUpWebService.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import Foundation
@testable import TestCasesUnderstanding

class MockSignUpWebService: SignUpWebServiceProtocol {
    
    var isSignUpMethodCalled: Bool = false
    var signUpError: SignUpError?
    
    func signUp(with request: SignUpRequest, completion: @escaping (SignUpResponse?, SignUpError?) -> Void) {
        isSignUpMethodCalled = true
        if let error = signUpError {
            completion(nil, error)
        } else {
            let response = SignUpResponse(status: "ok")
            completion(response, nil)
        }
    }
    
}
