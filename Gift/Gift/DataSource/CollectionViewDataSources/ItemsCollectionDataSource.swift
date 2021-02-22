//
//  ItemsCollectionDataSource.swift
//  Gift
//
//  Created by Anshad R on 17/02/21.
//


import Foundation
import UIKit
final class ItemsCollectionDataSource: NSObject, UICollectionViewDataSource {
    static let itemCellIdentifier: String = "ItemsCellIdentifier"
    var brands: [Brands]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let brand = self.brands?[indexPath.item] else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionDataSource.categoryCellIdentifier, for: indexPath) as! ItemCollectionViewCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsCollectionDataSource.itemCellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.brand = brand
        return cell
    }
}
