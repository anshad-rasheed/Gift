//
//  CategoryCollectionDataSource.swift
//  Gift
//
//  Created by Anshad R on 17/02/21.
//

import Foundation
import UIKit
final class CategoryCollectionDataSource: NSObject, UICollectionViewDataSource {
    static let categoryCellIdentifier: String = "CategoryCellIdentifier"
    var categories: [Categories]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let category = self.categories?[indexPath.item] else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionDataSource.categoryCellIdentifier, for: indexPath) as! CategoryCollectionViewCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionDataSource.categoryCellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.category = category
        return cell
    }
    
    
}
