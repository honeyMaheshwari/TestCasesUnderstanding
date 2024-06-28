//
//  SignUpWebService.swift
//  TestCasesUnderstanding
//
//  Created by Honey Maheshwari TaskHuman on 28/06/24.
//

import Foundation

class SignUpWebService {
    
    private let urlSession: URLSession
    private let urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp(with request: SignUpRequest, completion: @escaping (SignUpResponse?, SignUpError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, SignUpError.invalidURL)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch let error {
            print("Request Error: \(error)")
        }
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let data = data, data.count > 0 {
                do {
                    let signUpResponse = try JSONDecoder().decode(SignUpResponse.self, from: data)
                    completion(signUpResponse, nil)
                } catch let error {
                    print("sign up responseModelParsingError error -> \(String(describing: error))")
                    completion(nil, SignUpError.invalidResponse)
                }
            } else if let requestError = error {
                completion(nil, SignUpError.failedRequest(description: requestError.localizedDescription))
            }
        }
        dataTask.resume()
    }
    
}
