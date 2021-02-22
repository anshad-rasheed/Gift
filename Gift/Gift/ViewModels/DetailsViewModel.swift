//
//  DetailsViewModel.swift
//  Gift
//
//  Created by Anshad R on 22/02/21.
//

import Foundation
class DetailsViewModel {
    private let giftId: Int
    init(id: Int) {
        giftId = id
    }
    func fetchDetails(completion: @escaping (Result<Gift, NetworkError>) -> Void) {
        NetworkManager.shared.exicute(request: .getGiftDetails(giftId: giftId), completionHandler: { result in
            switch result {
            case .success(let data):
                
                let decoder = JSONDecoder()
                do {
                    let giftModel = try decoder.decode(    Gift.self, from: data)
                    completion(.success(giftModel))
                } catch {
                    completion(.failure(NetworkError.parsingError))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
