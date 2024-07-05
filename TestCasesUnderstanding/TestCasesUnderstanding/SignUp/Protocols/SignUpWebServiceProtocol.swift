//
//  SignUpWebServiceProtocol.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import Foundation

protocol SignUpWebServiceProtocol {
    func signUp(with request: SignUpRequest, completion: @escaping (SignUpResponse?, SignUpError?) -> Void)
}
