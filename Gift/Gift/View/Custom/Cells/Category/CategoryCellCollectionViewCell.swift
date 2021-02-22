//
//  CategoryCellCollectionViewCell.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    let bgView = UIView()
    let selectedbgView = UIView()
    private let imageView: UIImageView = UIImageView()
    private let selectionIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrowtriangle.down.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var category: Categories? {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        updateView()
    }
    func configureView() {
        backgroundView?.backgroundColor = .white
        selectedbgView.backgroundColor = #colorLiteral(red: 0.2454423308, green: 0.07476786524, blue: 0.3833183348, alpha: 1)
        selectedbgView.addSubview(selectionIcon)
        selectedbgView.applyShadowAndRoundCorners()
        selectedBackgroundView = selectedbgView
        addSubview(bgView)
        bgView.anchorToSuperview()
        bgView.addSubview(imageView)
        imageView.anchorToSuperview()
        bgView.applyShadowAndRoundCorners()
        imageView.applyShadowAndRoundCorners()
        backgroundView?.applyShadowAndRoundCorners()
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        selectionIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectionIcon.topAnchor.constraint(equalTo: selectedbgView.topAnchor, constant: -10),
            selectionIcon.centerXAnchor.constraint(equalTo: selectedbgView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        updateView()
        
    }
    
    func updateView() {
        guard let category = self.category else {
            return
        }
        titleLabel.text = category.name
        if let imageUrl = category.imageSmall {
            imageView.setImageUrl(urlString: imageUrl)
            bgView.alpha = 0.9
            imageView.clipsToBounds = true
        }
        if let colorCode = category.colorCode {
            bgView.backgroundColor = UIColor(hexString: colorCode)
        }
    }
    func showImage() {
        bgView.alpha = 0.9
    }
    
    func hideImage() {
        bgView.alpha = 0
    }
    
}
