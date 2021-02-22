//
//  APIClient.swift
//  Gift
//
//  Created by Anshad R on 17/02/21.
//

import Foundation
public protocol APIClient {
    func exicute(_ request: URLRequest, completionHandler:  @escaping (Result<Data, NetworkError>) -> Void)
}

public extension APIClient {
    func exicute(_ request: URLRequest, completionHandler:  @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    completionHandler(.success(data))
                } else if error != nil {
                    completionHandler(.failure(.requestFailed))
                } else {
                    completionHandler(.failure(.unknown))
                }
            }
        }.resume()
    }
}
public enum NetworkError: Error {
    case badURL, requestFailed, unknown, parsingError
}
