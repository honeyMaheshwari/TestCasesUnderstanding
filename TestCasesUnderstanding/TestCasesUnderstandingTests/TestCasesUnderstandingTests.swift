//
//  TestCasesUnderstandingTests.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 26/06/24.
//

import XCTest
@testable import TestCasesUnderstanding

final class TestCasesUnderstandingTests: XCTestCase {

    override class func setUp() {
        print("\n\n\n\n\n")
        print("- class setUp() method is called")
    }
    
    override func setUp() {
        print("- instance setUp() method is called")
    }
    
    override class func tearDown() {
        print("- class tearDown() method is called")
    }
    
    override func tearDown() {
        print("- instance tearDown() method is called")
        print("\n\n\n\n\n")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("- instance setUpWithError() method is called")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("- instance tearDownWithError() method is called")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("- instance testExample() method is called")
        
        addTeardownBlock {
            print("- addTeardownBlock is called for testExample() method")
        }
    }

}
