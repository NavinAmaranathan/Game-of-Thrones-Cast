//
//  UIView+Extension.swift
//  LBGCodingTask
//
//  Created by Navi on 10/06/22.
//

import UIKit

extension UIView {

    func makeRoundCorners(byRadius radius: CGFloat = 20.0) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
