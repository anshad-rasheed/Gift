//
//  ViewController.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var collectionDataSource = ItemsCollectionDataSource()
    @IBOutlet var headerView: HomeHeaderContainerView!
    @IBOutlet var collectionView: UICollectionView!
    var brands: [Brands]?
    let viewModel = HomeViewModel()
    var selectedCategory: Categories? {
        didSet {
            guard let categoryId = selectedCategory?.id else {
                return
            }
            loadData(categoryId: categoryId)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        loadData()
    }
    
    func configureView() {
        let titleView = UIImageView(image: UIImage(systemName: "gift.fill"))
        titleView.tintColor = #colorLiteral(red: 0.7766886353, green: 0, blue: 0.6682695746, alpha: 1)
        self.navigationItem.titleView = titleView
        collectionView.dataSource = collectionDataSource
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ItemsCollectionDataSource.itemCellIdentifier)
        headerView.catgorySelectionCallBack = {  category in
            // TODO: Update the bottom collectionview
        }
    }
    func loadData(categoryId: Int? = nil) {
        viewModel.fetchDetails { [weak self] result in
            switch result {
            case .success(let homeModel):
                self?.brands = homeModel.brands
                self?.headerView.categories = homeModel.categories
                self?.collectionDataSource.brands = homeModel.brands
                self?.collectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: 250)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let brand = self.brands?[indexPath.item], let detailsViewController = self.storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else {
            return
        }
        detailsViewController.giftId = brand.id
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
