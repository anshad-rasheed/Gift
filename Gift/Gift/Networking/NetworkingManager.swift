//
//  NetworkingManager.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import Foundation

class NetworkManager: APIClient {
    static let shared = NetworkManager()
    func exicute(request: GiftRequests, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        self.exicute(request.urlRequest(environement: .QA), completionHandler: completionHandler)
    }
}

struct APIEndPoint {
    static let baseURL = ""
}

public enum GiftRequests: UrlRequestConvertable {
    public func urlRequest(environement: Environment) -> URLRequest {
        let baseURL = environement.baseURL
        let path = URLBasePath + APIVersion
        var component = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        component.path += path + endPoint
        component.queryItems = queryItems
        let URL = component.url!
        let request = NSMutableURLRequest(url: URL)
        request.httpMethod = HTTPMethod
        return request as URLRequest
    }
    
    case getCategoryDetails(categoryId: Int? = nil, pageIndex: Int)
    case getGiftDetails(giftId: Int)
}

extension GiftRequests {
    fileprivate var endPoint: String {
        switch self {
        case .getCategoryDetails(_, _):
            return "/brands/featured/"
        case .getGiftDetails(let giftId):
            return "/brands/v5/\(giftId)/"
        }
    }

    fileprivate var URLBasePath: String {
        return "/uae/api/"
    }
    
    fileprivate var APIVersion: String {
        return "v3"
    }
    
    fileprivate var queryItems: [URLQueryItem] {
        var queryItems = [
            URLQueryItem(name: "api_key", value: "2vq1M9ye4eV6H1Mr"),
            URLQueryItem(name: "api_secret", value: "wnRY14QoA99B4Ae6wn2CU2y8")
        ]
        switch self {
        case let .getCategoryDetails(categoryId, pageIndex):
            if let categoryId = categoryId {
                queryItems.append(URLQueryItem(name: "category", value: String(categoryId)))
            }
            queryItems.append(URLQueryItem(name: "page", value: String(pageIndex)))
        case .getGiftDetails(giftId: _):
            break
            
        }
        return queryItems
    }
    
    fileprivate var HTTPMethod: String {
        switch self {
        case .getCategoryDetails(_ , _):
            return "GET"
        case .getGiftDetails(_):
            return "GET"
        }
    }
}

public enum Environment: CustomStringConvertible {
    case QA, Prod

    public var description: String {
        switch self {
        case .QA:
            return "QA"
        case .Prod:
            return "Production"
        }
    }
    
    public var baseURL: URL {
        switch self {
        case .QA:
            return URL(string: "https://emapi-sandbox.yougotagift.com")!
        case .Prod:
            //TODO: Use Prod url
            return URL(string: "https://emapi-sandbox.yougotagift.com")!
        }
    }
}

public protocol UrlRequestConvertable {
    func urlRequest(environement: Environment) -> URLRequest
}
