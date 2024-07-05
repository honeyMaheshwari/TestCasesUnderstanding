//
//  SignUpPresenterTests.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 05/07/24.
//

import XCTest
@testable import TestCasesUnderstanding

final class SignUpPresenterTests: XCTestCase {

    var signUpFormModel: SignUpFormModel!
    var mockSignUpInputValidator: MockSignUpInputDataValidator!
    var mockSignUpWebService: MockSignUpWebService!
    var sutSignUpPresenter: SignUpPresenter!
    var mockSignUpViewDelegate: MockSignUpViewDelegate!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func setUp() {
        signUpFormModel = SignUpFormModel(firstName: "Honey", lastName: "Maheshwari", email: "test@test.com", password: "12345678", confirmPassword: "12345678")
        mockSignUpInputValidator = MockSignUpInputDataValidator()
        mockSignUpWebService = MockSignUpWebService()
        mockSignUpViewDelegate = MockSignUpViewDelegate()
        sutSignUpPresenter = SignUpPresenter(validator: mockSignUpInputValidator, webService: mockSignUpWebService, delegate: mockSignUpViewDelegate)
    }

    override func tearDown() {
        signUpFormModel = nil
        mockSignUpInputValidator = nil
        mockSignUpWebService = nil
        mockSignUpViewDelegate = nil
        sutSignUpPresenter = nil
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignUpPresenter_whenInformationIsProvided_willValidateEachProperty() {
        // Arrange: In setUp() method
        
        // Act
        sutSignUpPresenter.processUserSignUp(with: signUpFormModel)
        
        // Assert
        XCTAssertTrue(mockSignUpInputValidator.isValidFirstName, "First name was not validated.")
        XCTAssertTrue(mockSignUpInputValidator.isValidLastName, "Last name was not validated.")
        XCTAssertTrue(mockSignUpInputValidator.isValidEmail, "Email was not validated.")
        XCTAssertTrue(mockSignUpInputValidator.isValidPassword, "Password was not validated.")
        XCTAssertTrue(mockSignUpInputValidator.isValidConfirmPassword, "Confirm Password was not validated.")
    }
    
    func testSignUpPresenter_whenGivenValidSignUpInput_shouldCallSignUpMethod() {
        // Arrange: In setUp() method
        
        // Act
        sutSignUpPresenter.processUserSignUp(with: signUpFormModel)
        
        // Assert
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled, "The signup() method was not called in the signup web service class.")
    }
    
    func testSignUpPresenter_whenSignUpOperationSuccessful_callSuccessOnViewDelegate() {
        // Arrange
        let expectation = expectation(description: "Expected the successFullSignUp() method to be called or successful.")
        mockSignUpViewDelegate.expectation = expectation
        
        // Act
        sutSignUpPresenter.processUserSignUp(with: signUpFormModel)
        self.wait(for: [expectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignUpViewDelegate.successFullSignUpCounter, 1, "The successFullSignUp() method was called more then 1 time.")
        XCTAssertEqual(mockSignUpViewDelegate.errorHandlerCounter, 0, "The errorHandler() method should not get called.")
    }
    
    func testSignUpPresenter_whenSignUpOperationFailed_callErrorHandlerOnViewDelegate() {
        // Arrange
        let expectation = expectation(description: "Expected the errorHandler() method to be called or error.")
        mockSignUpWebService.signUpError = SignUpError.failedRequest(description: "SignUp request was not successfull.")
        mockSignUpViewDelegate.expectation = expectation
        
        // Act
        sutSignUpPresenter.processUserSignUp(with: signUpFormModel)
        self.wait(for: [expectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignUpViewDelegate.successFullSignUpCounter, 0, "The successFullSignUp() method should not get called")
        XCTAssertEqual(mockSignUpViewDelegate.errorHandlerCounter, 1, "The errorHandler() method was called more then 1 time.")
        XCTAssertNotNil(mockSignUpViewDelegate.signUpError, "The signUpError can not be nil.")
    }

}
