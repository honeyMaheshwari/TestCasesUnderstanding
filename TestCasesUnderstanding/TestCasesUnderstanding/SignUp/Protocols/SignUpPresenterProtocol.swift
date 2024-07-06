//
//  SignUpPresenterProtocol.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 06/07/24.
//

import Foundation

protocol SignUpPresenterProtocol: AnyObject {
    init(validator: SignUpInputDataValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol)
    func processUserSignUp(with form: SignUpFormModel)
}
