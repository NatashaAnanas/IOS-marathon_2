//
//  Extension+UIView.swift
//  IOS-marathon_2
//
//  Created by Наталья Коновалова on 04.02.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
