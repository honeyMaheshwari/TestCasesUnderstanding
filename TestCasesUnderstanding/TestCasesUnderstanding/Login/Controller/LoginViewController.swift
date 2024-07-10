//
//  LoginViewController.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 09/07/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // segueLoginToDashboard
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "segueLoginToSignUp", sender: nil)
    }

}
