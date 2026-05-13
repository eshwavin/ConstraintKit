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
    /// Adds a view or layout guide to the receiver without requiring a type check at the call site.
    ///
    /// Calls `addSubview(_:)` for `UIView` instances and `addLayoutGuide(_:)` for `UILayoutGuide` instances.
    /// - Parameter constrainable: The view or layout guide to add.
    func addConstrainable(_ constrainable: Constrainable) {
        if let view = constrainable as? UIView {
            addSubview(view)
        }
        else if let layoutGuide = constrainable as? UILayoutGuide {
            addLayoutGuide(layoutGuide)
        }
    }

}

