//
//  HomeDataSource.swift
//  Gift
//
//  Created by Anshad R on 17/02/21.
//

import Foundation
//Supporting classes and protocols for pagination details
protocol PaginationDelegate: class {
    func resultsFetched(for brands: [Brands]?, error: Error?)
    func initialresultsFetched(for homeModel: HomeModel?, error: Error?)
}

public class Pagination {
    weak var delegate: PaginationDelegate?
    var fetchedResults = [Brands]()
    
    func fetchData(pageIndex: Int) {
        NetworkManager.shared.exicute(request: .getCategoryDetails(pageIndex: pageIndex)) { [weak self] result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let homeModel = try decoder.decode(HomeModel.self, from: data)
                    if pageIndex == 1 {
                        self?.delegate?.initialresultsFetched(for: homeModel, error: nil)
                    } else {
                        self?.delegate?.resultsFetched(for: homeModel.brands, error: nil)
                    }
                    
                } catch let error {
                    self?.delegate?.resultsFetched(for: nil, error: error)
                }
            case .failure(let error):
                self?.delegate?.resultsFetched(for: nil, error: error)
                
            }
        }
    }
    
}


public protocol PaginatedListDelegate: class {
    func fetchPerformed()
    func resultsFetched(requestError: Error?, pageInt: Int, initialResults: Bool)
}

public enum PaginationStatus {
    case notReady, ready
}

public class PaginatedList {
    public weak var delegate: PaginatedListDelegate?
    
}
