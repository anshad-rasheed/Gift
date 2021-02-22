//
//  GiftItemCollectionViewCell.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import UIKit

//class GiftItemCollectionViewCell: UICollectionViewCell {
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.numberOfLines = 3
//        label.textAlignment = .center
//        label.font = label.font.withSize(16)
//        return label
//    }()
//    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.numberOfLines = 3
//        label.textAlignment = .center
//        label.font = label.font.withSize(16)
//        return label
//    }()
//    
//    private let descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.numberOfLines = 3
//        label.textAlignment = .center
//        label.font = label.font.withSize(16)
//        return label
//    }()
//    private let categoryLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.numberOfLines = 3
//        label.textAlignment = .center
//        label.font = label.font.withSize(16)
//        return label
//    }()
//    
//    private let currencyLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.numberOfLines = 3
//        label.textAlignment = .center
//        label.font = label.font.withSize(16)
//        return label
//    }()
//    let bgView = UIView()
//    private let imageView: UIImageView = UIImageView()
//    
//    var category: Categories? {
//        didSet {
//            updateView()
//        }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureView()
//        updateView()
//    }
//    func configureView() {
//        backgroundView?.backgroundColor = .white
//      
//        addSubview(bgView)
//        bgView.anchorToSuperview()
//        bgView.addSubview(imageView)
//        imageView.anchorToSuperview()
//        bgView.applyShadowAndRoundCorners()
//        imageView.applyShadowAndRoundCorners()
//        backgroundView?.applyShadowAndRoundCorners()
//        addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
//            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
//            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//    }
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        configureView()
//        updateView()
//        
//    }
//    
//    func updateView() {
//        guard let category = self.category else {
//            return
//        }
//        titleLabel.text = category.name
//        if let imageUrl = category.imageSmall {
//            imageView.setImageUrl(urlString: imageUrl)
//            bgView.alpha = 0.9
//            imageView.clipsToBounds = true
//        }
//        if let colorCode = category.colorCode {
//            bgView.backgroundColor = UIColor(hexString: colorCode)
//        }
//    }
//    func showImage() {
//        bgView.alpha = 0.9
//    }
//    
//    func hideImage() {
//        bgView.alpha = 0
//    }
//    
//}
