//
//  UICollectionView+Extension.swift
//  Gift
//
//  Created by Anshad R on 19/02/21.
//

import UIKit

extension UICollectionView {
    func reloadDataWithCompletion(block: @escaping ()-> ()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(block)
        reloadData()
        CATransaction.commit()
    }
}
