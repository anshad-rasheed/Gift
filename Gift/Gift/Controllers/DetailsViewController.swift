//
//  DetailsViewController.swift
//  Gift
//
//  Created by Anshad R on 22/02/21.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var currencyButton: UIButton!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    var giftId: Int?
    private var viewModel: DetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let giftId = self.giftId {
            viewModel = DetailsViewModel(id: giftId)
            loadData()
        }
    }
    
    func loadData() {
        viewModel?.fetchDetails(completion: {  [weak self] result in
            switch result {
            case .success(let gift):
                self?.updateView(with: gift)
            case .failure(let error):
                print(error)

            }
            
        })
    }
    
    private func updateView(with gift: Gift) {
        title = "Gift Details"
        titleLabel.text = gift.name
        if let imageUrl = gift.productImage {
            imageView.setImageUrl(urlString: imageUrl)
        }
        currencyButton.setTitle(gift.currency, for: .normal)
        if  let denomination = gift.denominations?.first?[gift.currency ?? ""] {
            priceLabel.text = String(denomination.min ?? 0)
        }
    }
}
