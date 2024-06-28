//
//  SignUpFormModelValidatorTests.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 26/06/24.
//

import XCTest
@testable import TestCasesUnderstanding

final class SignUpValidatorTests: XCTestCase {

    var sutSignUpValidator: SignUpFormValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sutSignUpValidator = SignUpFormValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sutSignUpValidator = nil
    }

    // MARK: - First Name Validation
    
    func testSignUpFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue() {
        // Arrange
        //Act
        let isValid = sutSignUpValidator.isValidFirstName("Honey")
        
        // Assert
        XCTAssertTrue(isValid, "The isValidFirstName() should return TRUE for a valid first name but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidFirstName("H")
        // Assert
        XCTAssertFalse(isValid, "The isValidFirstName() should return FALSE for a first name shorter then \(SignUpConstants.firstNameMinimumLenght) characters but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenLongFirstNameProvided_ShouldReturnFalse() {
        //Arrange
        //Act
        let isValid = sutSignUpValidator.isValidFirstName("HoneyHoneyHoneyH")
        // Assert
        XCTAssertFalse(isValid, "The isValidFirstName() should return FALSE for a first name longer then \(SignUpConstants.firstNameMaximumLenght) characters but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenFirstNameLengthIsEqualsToMinimimProvidedLenght_ShouldReturnTrue() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidFirstName("Ho")
        // Assert
        XCTAssertTrue(isValid, "The isValidFirstName() should return TRUE for a first name having \(SignUpConstants.firstNameMinimumLenght) characters but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenFirstNameLengthIsEqualsToMaximimProvidedLenght_ShouldReturnTrue() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidFirstName("HoneyHoneyHoney")
        // Assert
        XCTAssertTrue(isValid, "The isValidFirstName() should return TRUE for a first name having \(SignUpConstants.firstNameMaximumLenght) characters but returned FALSE.")
    }
    
    // MARK: - Last Name Validation
    
    func testSignUpFormModelValidator_whenValidLastNameProvided_shouldReturnTrue() {
        // Arrange
        //Act
        let isValid = sutSignUpValidator.isValidLastName("Maheshwari")
        
        // Assert
        XCTAssertTrue(isValid, "The isValidLastName() should return TRUE for a valid last name but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenShortLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidLastName("M")
        // Assert
        XCTAssertFalse(isValid, "The isValidLastName() should return FALSE for a last name shorter then \(SignUpConstants.lastNameMinimumLenght) characters but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenLongLastNameProvided_ShouldReturnFalse() {
        //Arrange
        //Act
        let isValid = sutSignUpValidator.isValidLastName("MaheshwariMaheshwariM")
        // Assert
        XCTAssertFalse(isValid, "The isValidLastName() should return FALSE for a last name longer then \(SignUpConstants.lastNameMaximumLenght) characters but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenLastNameLengthIsEqualsToMinimimProvidedLenght_ShouldReturnTrue() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidLastName("Ma")
        // Assert
        XCTAssertTrue(isValid, "The isValidLastName() should return TRUE for a last name having \(SignUpConstants.lastNameMinimumLenght) characters but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenLastNameLengthIsEqualsToMaximimProvidedLenght_ShouldReturnTrue() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidLastName("MaheshwariMaheshwari")
        // Assert
        XCTAssertTrue(isValid, "The isValidLastName() should return TRUE for a last name having \(SignUpConstants.lastNameMaximumLenght) characters but returned FALSE.")
    }

    // MARK: - Email Validation
    
    func testSignUpFormModelValidator_whenEmptyEmailProvided_shouldReturnFalse() {
        //Arrange
        //Act
        let isValid = sutSignUpValidator.isValidEmail("")
        //Assert
        XCTAssertFalse(isValid, "The isValidEmail() should return FALSE for a empty email but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenValidEmailProvided_shouldReturnTrue() {
        //Arrange
        //Act
        let isValid = sutSignUpValidator.isValidEmail("honeymaheshwari23@gmail.com")
        //Assert
        XCTAssertTrue(isValid, "The isValidEmail() should return TRUE for a valid email but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenEmailWithOnlySingleCharacterProvided_shouldReturnFalse() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidEmail("h")
        // Assert
        XCTAssertFalse(isValid, "The isValidEmail() should return FALSE when a single character is provided in email but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenEmailWithDomainNameLessThen2CharacterProvided_shouldReturnFalse() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidEmail("h@h.h")
        // Assert
        XCTAssertFalse(isValid, "The isValidEmail() should return FALSE when a single character is provided the domain name of email but returned TRUE.")
    }
    
    // MARK: - Password Validation
    
    func testSignUpFormModelValidator_whenEmptyPasswordProvided_shouldReturnFalse() {
        //Arrange
        //Act
        let isValid = sutSignUpValidator.isValidPassword("")
        //Assert
        XCTAssertFalse(isValid, "The isValidPassword() should return FALSE for a empty password but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenValidPasswordProvided_shouldReturnTrue() {
        //Arrange
        //Act
        let isValid = sutSignUpValidator.isValidPassword("123456789")
        //Assert
        XCTAssertTrue(isValid, "The isValidPassword() should return TRUE for a valid email but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenShortPasswordProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidPassword("1234567")
        // Assert
        XCTAssertFalse(isValid, "The isValidPassword() should return FALSE for a Password shorter then \(SignUpConstants.passwordMinimumLenght) characters but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenLongPasswordProvided_ShouldReturnFalse() {
        //Arrange
        //Act
        let isValid = sutSignUpValidator.isValidPassword("123456789012345678901")
        // Assert
        XCTAssertFalse(isValid, "The isValidPassword() should return FALSE for a Password longer then \(SignUpConstants.passwordMaximumLenght) characters but returned TRUE.")
    }
    
    func testSignUpFormModelValidator_whenPasswordLengthIsEqualsToMinimimProvidedLenght_ShouldReturnTrue() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidLastName("12345678")
        // Assert
        XCTAssertTrue(isValid, "The isValidPassword() should return TRUE for a Password having \(SignUpConstants.passwordMinimumLenght) characters but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenPasswordLengthIsEqualsToMaximimProvidedLenght_ShouldReturnTrue() {
        // Arrange
        // Act
        let isValid = sutSignUpValidator.isValidLastName("12345678901234567890")
        // Assert
        XCTAssertTrue(isValid, "The isValidLastPassword() should return TRUE for a Password having \(SignUpConstants.passwordMaximumLenght) characters but returned FALSE.")
    }
    
    func testSignUpFormModelValidator_whenPasswordAndConfirmPasswordMatch_ShouldReturnTrue() {
        // Arrange
        // Assert
        let doesPasswordMatch = sutSignUpValidator.doesPasswordMatch(password: "12345678", confirmPassword: "12345678")
        // Assert
        XCTAssertTrue(doesPasswordMatch, "The doesPasswordMatch() should return TRUE for a matching password but returned FALSE")
    }
    
    func testSignUpFormModelValidator_whenPasswordAndConfirmPasswordDoesNotMatch_ShouldReturnFalse() {
        // Arrange
        // Assert
        let doesPasswordMatch = sutSignUpValidator.doesPasswordMatch(password: "12345678", confirmPassword: "1234567")
        // Assert
        XCTAssertFalse(doesPasswordMatch, "The doesPasswordMatch() should return FALSE for a passwords that does not match but returned TRUE")
    }
}
