//
//  SignUpViewController.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 06/07/24.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var presenter: SignUpPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkIfPresenterIsNilThenUpdateItsValue()
    }
    
    func checkIfPresenterIsNilThenUpdateItsValue() {
        if presenter == nil {
            let validator = SignUpInputDataValidator()
            let webService = SignUpWebService(urlString: SignUpConstants.signUpURLString)
            presenter = SignUpPresenter(validator: validator, webService: webService, delegate: self)
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let signUpForm = SignUpFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "")
        presenter?.processUserSignUp(with: signUpForm)
    }
    
}

extension SignUpViewController: SignUpViewDelegateProtocol {
    
    func successFullSignUp() {
        // TODO:
    }
    
    func errorHandler(error: SignUpError) {
        // TODO: 
    }
    
}
