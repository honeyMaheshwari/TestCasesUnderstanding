//
//  SignUpRequest.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 28/06/24.
//

import Foundation

struct SignUpRequest: Encodable {
    let firstName, lastName, email, password: String
}

extension SignUpRequest {
    
    init(form: SignUpFormModel) {
        firstName = form.firstName
        lastName = form.lastName
        email = form.email
        password = form.password
    }
    
}
