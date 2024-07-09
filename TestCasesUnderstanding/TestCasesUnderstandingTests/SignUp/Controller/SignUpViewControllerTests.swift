//
//  SignUpViewControllerTests.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 06/07/24.
//

import XCTest
@testable import TestCasesUnderstanding

final class SignUpViewControllerTests: XCTestCase {

    var sutSignUpViewController: SignUpViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sutSignUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        sutSignUpViewController.loadViewIfNeeded()
    }

    override func tearDown() {
        sutSignUpViewController = nil
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignUpViewController_whenCreated_hasRequiredTextFieldsEmpty() throws {
        // Arrange: in setUp() method
        let firstNameTextField = try XCTUnwrap(sutSignUpViewController.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet and found nil.")
        let lastNameTextField = try XCTUnwrap(sutSignUpViewController.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet and found nil.")
        let emailTextField = try XCTUnwrap(sutSignUpViewController.emailTextField, "The emailTextField is not connected to an IBOutlet and found nil.")
        let passwordTextField = try XCTUnwrap(sutSignUpViewController.passwordTextField, "The passwordTextField is not connected to an IBOutlet and found nil.")
        let confirmPasswordTextField = try XCTUnwrap(sutSignUpViewController.confirmPasswordTextField, "The confirmPasswordTextField is not connected to an IBOutlet and found nil.")
        
        // Act: in setUp() method
        // Assert:
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when sign-up view controller initially loaded.")
        XCTAssertEqual(lastNameTextField.text, "", "Last name text field was not empty when sign-up view controller initially loaded.")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when sign-up view controller initially loaded.")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when sign-up view controller initially loaded.")
        XCTAssertEqual(confirmPasswordTextField.text, "", "Confirm password text field was not empty when sign-up view controller initially loaded.")
    }
    
    func testSignUpViewController_whenCreated_hasSignUpButtonAndItsAction() throws {
        // Arrange: in setUp() method
        let signUpButton = try XCTUnwrap(sutSignUpViewController.signUpButton, "The signUpButton is not connected to an IBOutlet and found nil.")
        
        // Act: in setUp() method
        let signUpButtonActions = try XCTUnwrap(signUpButton.actions(forTarget: sutSignUpViewController, forControlEvent: .touchUpInside), "The sign-up button does not have any actions assigned to it.")
        
        // Assert:
        // Check if the buuton has action assign to it
        XCTAssertEqual(signUpButtonActions.count, 1, "The sign-up button does not have any actions assigned to it.")
        // Check the action/function name assigned to this button
        XCTAssertTrue(signUpButtonActions.contains("signUpButtonTapped:"), "There is no action with the name signUpButtonTapped assigned to sign-up button.")
        // or
        XCTAssertEqual(signUpButtonActions.first, "signUpButtonTapped:", "There is no action with the name signUpButtonTapped assigned to sign-up button.")
    }
    
    func testSignUpViewController_whenSignUpButtonTapped_invokesSignUpProcess() {
        // Arrange: in setUp() method
        let mockSignUpInputValidator = MockSignUpInputDataValidator()
        let mockSignUpWebService = MockSignUpWebService()
        let mockSignUpViewDelegate = MockSignUpViewDelegate()
        let mockSignUpPresenter: MockSignUpPresenter = MockSignUpPresenter(validator: mockSignUpInputValidator, webService: mockSignUpWebService, delegate: mockSignUpViewDelegate)
        sutSignUpViewController.presenter = mockSignUpPresenter
        
        // Act: in setUp() method
        sutSignUpViewController.signUpButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignUpPresenter.isProcessUserSignUpMethodCalled, "The processUserSignUp() method was not called on SignUpPresenter when the sign-up button is tapped in SignUpViewController")
    }
    
    func testSignUpViewControllerEmailTextField_whenCreated_hasCorrectInputTrailsSet() throws {
        let emailTextField = try XCTUnwrap(sutSignUpViewController.emailTextField, "The emailTextField is not connected to an IBOutlet and found nil.")
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "Email address text field does not have UITextContentType set to emailAddress")
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "Email address text field does not have UIKeyboardType set to emailAddress")
    }
    
    func testSignUpViewControllerPasswordTextField_whenCreated_hasCorrectInputTrailsSet() throws {
        let passwordTextField = try XCTUnwrap(sutSignUpViewController.passwordTextField, "The passwordTextField is not connected to an IBOutlet and found nil.")
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password text field is not a secured text entery field")
    }
    
    func testSignUpViewControllerConfirmPasswordTextField_whenCreated_hasCorrectInputTrailsSet() throws {
        let confirmPasswordTextField = try XCTUnwrap(sutSignUpViewController.confirmPasswordTextField, "The confirmPasswordTextField is not connected to an IBOutlet and found nil.")
        XCTAssertTrue(confirmPasswordTextField.isSecureTextEntry, "Confirm Password text field is not a secured text entery field")
    }
    
}
