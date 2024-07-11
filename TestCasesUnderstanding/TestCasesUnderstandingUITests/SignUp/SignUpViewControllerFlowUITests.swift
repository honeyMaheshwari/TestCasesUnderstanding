//
//  SignUpViewControllerFlowUITests.swift
//  TestCasesUnderstandingUITests
//
//  Created by Honey Maheshwari TaskHuman on 10/07/24.
//

import XCTest

final class SignUpViewControllerFlowUITests: XCTestCase {

    private var app: XCUIApplication!
    private var firstNameTextField: XCUIElement!
    private var lastNameTextField: XCUIElement!
    private var emailTextField: XCUIElement!
    private var passwordTextField: XCUIElement!
    private var confirmPasswordTextField: XCUIElement!
    private var signUpButton: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        // move to SignUp View Controller
        app.staticTexts["SignUp"].tap()
        
        firstNameTextField = app.textFields["firstNameTextField"]
        lastNameTextField = app.textFields["lastNameTextField"]
        emailTextField = app.textFields["emailTextField"]
        passwordTextField = app.secureTextFields["passwordTextField"]
        confirmPasswordTextField = app.secureTextFields["confirmPasswordTextField"]
        signUpButton = app.buttons["SignUp"]
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        firstNameTextField = nil
        lastNameTextField = nil
        emailTextField = nil
        passwordTextField = nil
        confirmPasswordTextField = nil
        signUpButton = nil
        app = nil
        
        try super.tearDownWithError()
    }

    func testSignUpViewController_whenViewLoaded_requiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(firstNameTextField.isEnabled, "The first name text field is not enabled for user interaction.")
        XCTAssertTrue(lastNameTextField.isEnabled, "The last name text field is not enabled for user interaction.")
        XCTAssertTrue(emailTextField.isEnabled, "The email text field is not enabled for user interaction.")
        XCTAssertTrue(passwordTextField.isEnabled, "The password text field is not enabled for user interaction.")
        XCTAssertTrue(confirmPasswordTextField.isEnabled, "The confirm password text field is not enabled for user interaction.")
        XCTAssertTrue(signUpButton.isEnabled, "The sign-up button is not enabled for user interaction.")
    }

    func testSignUpViewController_whenInvalidDetailsSubmitted_presentsAlertWithError() throws {
        // Arrange
        firstNameTextField.tap()
        firstNameTextField.typeText("Honey")
        
        lastNameTextField.tap()
        lastNameTextField.typeText("Maheshwari")
        
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("123")
        
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("123")
        
        // Act
        signUpButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertController"].waitForExistence(timeout: 1), "An error alert was not presented when invalid input is provided.")
    }
    
    func testSignUpViewController_whenValidDetailsSubmitted_navigateToDashboard() throws {
        // Arrange
        firstNameTextField.tap()
        firstNameTextField.typeText("Honey")
        
        lastNameTextField.tap()
        lastNameTextField.typeText("Maheshwari")
        
        emailTextField.tap()
        emailTextField.typeText("test@test.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("12345678")
        
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText("12345678")
        
        // Act
        signUpButton.tap()
        
        // Take screenshot of single emlement
        /*
        let emailTextFieldScreenShot = emailTextField.screenshot()
        let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenShot)
        emailTextFieldAttachment.name = "ScreenShot of SignUp Email Text Field"
        emailTextFieldAttachment.lifetime = .deleteOnSuccess // or we can use .keepAlways
        add(emailTextFieldAttachment)
        */
        
        // Take screenshot of full screen - using XCUIApplication object
        /*
        let currentAppWindowScreenShot = app.screenshot()
        let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindowScreenShot)
         currentAppWindowAttachment.name = "ScreenShot of SignUp View Controller"
         currentAppWindowAttachment.lifetime = .deleteOnSuccess
         add(currentAppWindowAttachment)
         */
        
        // Take screenshot of full screen - using XCUIScreen object
        /*
        let currentAppWindowUIScreen = XCUIScreen.main.screenshot()
        let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindowUIScreen)
        currentAppWindowAttachment.name = "ScreenShot of SignUp View Controller"
        currentAppWindowAttachment.lifetime = .deleteOnSuccess
        add(currentAppWindowAttachment)
         */
        
        // Assert
        XCTAssertTrue(app.otherElements["dashboardViewController"].waitForExistence(timeout: 5), "The user has not been navigated to Dashboard when tapped on SignUp button.")
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
