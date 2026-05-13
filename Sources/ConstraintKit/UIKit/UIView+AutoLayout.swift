//
//  UIView+AutoLayout.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 13/05/26.
//

import UIKit

public extension UIView {
    @discardableResult func prepareForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
