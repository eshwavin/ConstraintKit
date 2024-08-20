//
//  UIView+Constrainable.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 28/08/23.
//

import UIKit

extension UIView: SafeAreaConstrainable {
    public var container: UIView? {
        return superview
    }
}

public extension UIView {
    func addConstrainable(_ constrainable: Constrainable) {
        if let view = constrainable as? UIView {
            addSubview(view)
        }
        else if let layoutGuide = constrainable as? UILayoutGuide {
            addLayoutGuide(layoutGuide)
        }
    }
}

