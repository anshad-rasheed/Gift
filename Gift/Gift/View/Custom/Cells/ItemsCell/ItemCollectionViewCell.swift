//
//  ItemCollectionViewCell.swift
//  Gift
//
//  Created by Anshad R on 19/02/21.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var categoryView: UIView!
    
    var brand: Brands? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryView.roundCorners(cornerRadius: 8)
        categoryView.drawBorder(borderColor: #colorLiteral(red: 0.7766886353, green: 0, blue: 0.6682695746, alpha: 1))
        containerView.roundCorners(cornerRadius: 5)
        containerView.drawBorder(borderColor: .lightGray)
    }

    func updateView() {
        guard let brand = self.brand else {
            return
        }
        titleLabel.text = brand.name
        if let imageUrl = brand.productImage {
            imageView.setImageUrl(urlString: imageUrl)
        }
        descriptionLabel.text = brand.shortTagline
        currencyLabel.text = brand.currency
        categoryView.isHidden = brand.redemptionTag?.isEmpty ?? true
        categoryLabel.text = brand.redemptionTag
    }
}
