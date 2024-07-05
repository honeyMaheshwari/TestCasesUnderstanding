//
//  SignUpViewDelegateProtocol.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import Foundation

protocol SignUpViewDelegateProtocol: AnyObject {
    func successFullSignUp()
    func errorHandler(error: SignUpError)
}
