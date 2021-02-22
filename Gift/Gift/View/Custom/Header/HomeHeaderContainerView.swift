//
//  HomeHeaderContainerView.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import UIKit

class HomeHeaderContainerView: UIView {
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    private var isIntialData: Bool = true
    var catgorySelectionCallBack: ((Categories) ->())?
    private let homeHeaderView: HomeHeaderView = HomeHeaderView()
    private var categoryCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collecionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 150, height: 70)
        collecionView.backgroundColor = .white
        return collecionView
        
    }()
    private var collectionDataSource = CategoryCollectionDataSource()
    
    var categories: [Categories]? {
        didSet {
            collectionDataSource.categories = categories
            categoryCollectionView.reloadDataWithCompletion { [weak self] in
                guard let self = self else {
                    return
                }
                self.selectInitialCategory()
            }
        }
    }
    
    public func selectInitialCategory() {
        DispatchQueue.main.async {
            self.isIntialData = true
            self.categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
            self.collectionView(self.categoryCollectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        updateView()
    }
    
    func configureView() {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionDataSource.categoryCellIdentifier)
        categoryCollectionView.dataSource = collectionDataSource
        categoryCollectionView.delegate = self
        addSubview(contentStackView)
        contentStackView.anchorToSuperview()
        contentStackView.addArrangedSubview(homeHeaderView)
        contentStackView.addArrangedSubview(categoryCollectionView)
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    public func updateView() {
        
    }

}


extension HomeHeaderContainerView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let category = categories?[indexPath.item], let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            cell.hideImage()
            homeHeaderView.updateView(category: category)
            if !isIntialData {
                catgorySelectionCallBack?(category)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.showImage()
            isIntialData = false
        }
    }
}
