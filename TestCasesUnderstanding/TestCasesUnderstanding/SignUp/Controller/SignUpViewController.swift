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

        #if DEBUG
            if CommandLine.arguments.contains("-skipSurvey") {
                print("Skip Survey")
            }
            
            // To get the value of launch argument we can use both CommandLine or ProcessInfo
        
            let processInfo = ProcessInfo.processInfo
            if processInfo.arguments.contains("-skipSurvey") {
                print("Skip Survey")
            }

            if let signUpURL = processInfo.environment["signUpURL"] {
                print("processInfo.environment signUpURL -> \(signUpURL)")
            }
        #endif
        
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
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "segueSignUpToDashboard", sender: nil)
        }
    }
    
    func errorHandler(error: SignUpError) {
        let alertController = UIAlertController(title: "Error", message: error.errorDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        DispatchQueue.main.async {
            alertController.view.accessibilityIdentifier = "errorAlertController"
            self.present(alertController, animated: true)
        }
    }
    
}
