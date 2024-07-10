//
//  LoginViewControllerFlowUITests.swift
//  TestCasesUnderstandingUITests
//
//  Created by Honey Maheshwari TaskHuman on 10/07/24.
//

import XCTest

final class LoginViewControllerFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginViewController_whenViewLoaded_requiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Accessing UI elements directly
        /*
        // When No placeholder or text provided to UITextField
        let emailTestField = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        
        let passwordTextField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .secureTextField).element
        
        let loginButton = app.buttons["Login"]
        */
        
                
        // Accessing UI elements with text/placeholder property
        /*
        let emailTestField = app.textFields["Email"]
        let passwordTextField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        */
        
        // Accessing UI elements with Accessibility Identifiers
        let emailTestField = app.textFields["emailTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        let loginButton = app.buttons["loginButton"]
        /*
        let orLabel = app.staticTexts["orLabel"]
         */
        let signUpButton = app.buttons["signUpButton"]
        
    
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(emailTestField.isEnabled, "The email text field is not enabled for user interaction.")
        XCTAssertTrue(passwordTextField.isEnabled, "The password text field is not enabled for user interaction.")
        XCTAssertTrue(loginButton.isEnabled, "The login button is not enabled for user interaction.")
        XCTAssertTrue(signUpButton.isEnabled, "The sign-up button is not enabled for user interaction.")
    }

    func testLoginViewController_whenSignUpbuttonIsTapped_navigateUserToSignUpViewController() throws {
        let app = XCUIApplication()
        app.launch()
        
        let signUpButton = app.buttons["signUpButton"]
        signUpButton.tap()
        
        XCTAssertTrue(app.otherElements["signUpViewController"].waitForExistence(timeout: 1), "The user has not been navigated to SignUpViewController when tapped on SignUp button.")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
