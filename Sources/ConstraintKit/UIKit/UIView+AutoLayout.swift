//
//  UIView+AutoLayout.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 13/05/26.
//

import UIKit

public extension UIView {
    /// Sets `translatesAutoresizingMaskIntoConstraints` to `false` and returns `self`.
    ///
    /// Call `preparedForAutoLayout()` on a view before adding any Auto Layout constraints to it.
    /// - Returns: `self`, enabling chaining directly into constraint calls.
    @discardableResult
    func preparedForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
