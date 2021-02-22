//
//  HomeViewModel.swift
//  Gift
//
//  Created by Anshad R on 17/02/21.
//
import Foundation

class HomeViewModel {
    //TODO: Implement pagination
    func fetchDetails(catrgoryId: Int? = nil, completion: @escaping (Result<HomeModel, NetworkError>) -> Void) {
        NetworkManager.shared.exicute(request: .getCategoryDetails(categoryId: catrgoryId, pageIndex: 1), completionHandler: { result in
            switch result {
            case .success(let data):
                
                let decoder = JSONDecoder()
                do {
                    let homeModel = try decoder.decode(HomeModel.self, from: data)
                    completion(.success(homeModel))
                } catch {
                    completion(.failure(NetworkError.parsingError))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
