//
//  UIView+Extension.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import UIKit

enum Corner {
    case top, left, right, bottom, all
}
extension UIView {
    
    func applyShadowAndRoundCorners(cornerRadius: CGFloat = 6,
                                    shadowColor: CGColor = UIColor.gray.cgColor,
                                    shadowoffset: CGSize = CGSize(width: .zero, height: 3),
                                    shadowOpacity: Float = 0.5) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowoffset
        layer.shadowRadius = cornerRadius
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
    
    /// Pin a view to its superview
    func anchorToSuperview() {
        guard let parent = superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
        ])
    }
    
    func roundCorners(corner: Corner = .all, cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        guard corner != .all else {
            return
        }
        var cornersMask =  CACornerMask()
        switch corner {
        case .top:
            cornersMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .left:
            cornersMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .right:
            cornersMask = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .bottom:
            cornersMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .all:
            break
        }
        layer.maskedCorners = cornersMask
    }
    
    func drawBorder(borderColor: UIColor = .gray, borderWidth: CGFloat = 1) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
