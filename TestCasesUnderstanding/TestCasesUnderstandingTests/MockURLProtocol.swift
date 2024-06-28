//
//  MockURLProtocol.swift
//  TestCasesUnderstandingTests
//
//  Created by Honey Maheshwari TaskHuman on 28/06/24.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        print("canInit")
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        print("canonicalRequest")
        return request
    }
    
    override func startLoading() {
        print("startLoading")
        
        if let error = MockURLProtocol.error {
            let nsError = NSError(domain: "", code: -99, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
            self.client?.urlProtocol(self, didFailWithError: nsError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        print("stopLoading")
    }
    
}
