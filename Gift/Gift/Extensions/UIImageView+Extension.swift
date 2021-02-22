//
//  UIImageView+Extension.swift
//  Gift
//
//  Created by Anshad R on 16/02/21.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImageUrl(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        sd_setImage(with: url)
    }
}
