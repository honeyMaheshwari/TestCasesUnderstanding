//
//  SignUpWebServiceTests.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 28/06/24.
//

import XCTest
@testable import TestCasesUnderstanding

final class SignUpWebServiceTests: XCTestCase {

    var sutSignUpWebService: SignUpWebService!
    var sutSignUpRequest: SignUpRequest!
    
    override func setUp() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        
        sutSignUpWebService = SignUpWebService(urlString: SignUpConstants.signUpURLString, urlSession: urlSession)
        sutSignUpRequest = SignUpRequest(firstName: "Honey", lastName: "Maheshwari", email: "test@test.com", password: "12345678")
    }
    
    override func tearDown() {
        sutSignUpWebService = nil
        sutSignUpRequest = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpWebService_withValidRequestAndValidResponse_returnsSuccess() {
        // Arrange
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: String.Encoding.utf8)
        
        let expectation = self.expectation(description: "Sign Up Web Service Response Expectation")
        // Act
        sutSignUpWebService.signUp(with: sutSignUpRequest) { response, error in
            // Assert
            XCTAssertEqual(response?.status, "ok", "The response model for request containing an unexpected JSON response should have status with ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_withValidRequestAndDifferentJsonResponse_returnsError() {
        // Arrange
        let jsonString = "{\"path\": \"/users\", \"error\": \"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: String.Encoding.utf8)
        
        let expectation = self.expectation(description: "signup() expectation for a response that contains a different JSON structure.")
        // Act
        sutSignUpWebService.signUp(with: sutSignUpRequest) { response, error in
            // Assert
            XCTAssertNil(response, "The response model for request containing a known JSON response should have been nil.")
            XCTAssertEqual(error, SignUpError.invalidResponse, "The signup() method did not return expected error.")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_whenEmptyURLStringProvided_returnsError() {
        //Arrange
        sutSignUpWebService = SignUpWebService(urlString: "")
        let expectation = self.expectation(description: "An empty request URL string expectation")
        //Act
        sutSignUpWebService.signUp(with: sutSignUpRequest) { response, error in
            //Assert
            XCTAssertNil(response, "The response model for request containing a known JSON response should have been nil.")
            XCTAssertEqual(error, SignUpError.invalidURL, "The signup() did not return expected error for an invalid URL string.")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }

    func testSignUpWebService_whenURLRequestFails_returnError() {
        // Arrange
        let errorDescription = "The localized description of an error."
        MockURLProtocol.error = SignUpError.failedRequest(description: errorDescription)
        // Alternatively: MockURLProtocol.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])
        let expectation = self.expectation(description: "A failed request expectation.")
        // Act
        sutSignUpWebService.signUp(with: sutSignUpRequest) { response, error in
            // Assert
            XCTAssertNil(response, "The response model for request containing a known JSON response should have been nil.")
            XCTAssertEqual(error, SignUpError.failedRequest(description: errorDescription), "The signup method did not return an expected error for the failed request error.")
            XCTAssertEqual(error?.localizedDescription, errorDescription, "The signup method did not return an expected error for the failed request error.")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    
}
