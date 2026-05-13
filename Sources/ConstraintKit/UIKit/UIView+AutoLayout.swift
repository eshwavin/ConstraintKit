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
    /// Call this on a view before adding any Auto Layout constraints to it.
    /// - Returns: `self`, enabling chaining directly into constraint calls.
    @discardableResult
    func prepareForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
