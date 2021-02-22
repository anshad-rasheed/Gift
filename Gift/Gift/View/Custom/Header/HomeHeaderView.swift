//
//  HomeBannerView.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import UIKit
class HomeHeaderView: UIView {
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = label.font.withSize(16)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = label.font.withSize(14)
        return label
    }()
    
    private let imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    func configureView() {
        addSubview(imageView)
        imageView.anchorToSuperview()
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            contentStackView.topAnchor.constraint(equalTo: centerYAnchor),
            contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }
    
    public func updateView(category: Categories) {
        titleLabel.text = category.name
        descriptionLabel.text = category.caption
        if let imageUrl = category.imageLarge {
            imageView.setImageUrl(urlString: imageUrl)
        }
       
    }
}
