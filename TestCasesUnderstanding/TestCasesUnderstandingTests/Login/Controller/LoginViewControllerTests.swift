//
//  LoginViewControllerTests.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 09/07/24.
//

import XCTest
@testable import TestCasesUnderstanding

final class LoginViewControllerTests: XCTestCase {

    var sutLoginViewController: LoginViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sutLoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        sutLoginViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sutLoginViewController = nil
    }

    func testLoginViewControllerSignUpButton_whenTapped_pushedToSignUpViewController_V1() throws {
        let signUpButton = try XCTUnwrap(sutLoginViewController.signUpButton, "The signUpButton is not connected to an IBOutlet and found nil.")
        let navigationController = UINavigationController(rootViewController: sutLoginViewController)
        let predicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SignUpViewController
        }
     
        expectation(for: predicate, evaluatedWith: navigationController)
        
        signUpButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 1.5)
    }
    
    func testLoginViewControllerSignUpButton_whenTapped_pushedToSignUpViewController_V2() throws {
        let signUpButton = try XCTUnwrap(sutLoginViewController.signUpButton, "The signUpButton is not connected to an IBOutlet and found nil.")
        let navigationController = UINavigationController(rootViewController: sutLoginViewController)
        
        signUpButton.sendActions(for: .touchUpInside)
        
        RunLoop.current.run(until: Date())
        
        guard let _ = navigationController.topViewController as? SignUpViewController else {
            XCTFail("After tapping on SignUp button the top view controller should be SignUpViewController")
            return
        }
    }
    
    // Test Doubles
    func testLoginViewControllerSignUpButton_whenTapped_pushedToSignUpViewController_V3() throws {
        let signUpButton = try XCTUnwrap(sutLoginViewController.signUpButton, "The signUpButton is not connected to an IBOutlet and found nil.")
        let navigationController = SpyNavigationController(rootViewController: sutLoginViewController)
        
        signUpButton.sendActions(for: .touchUpInside)
        
        guard let _ = navigationController.pushedViewController as? SignUpViewController else {
            XCTFail("After tapping on SignUp button the top view controller should be SignUpViewController")
            return
        }
    }

}
