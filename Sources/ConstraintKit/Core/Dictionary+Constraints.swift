//
//  Dictionary+Constraints.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 15/05/26.
//

import UIKit

public extension Dictionary where Key == String, Value == NSLayoutConstraint {
    /// Returns the constraint values as an array, discarding the string keys.
    var asConstraintsArray: [NSLayoutConstraint] {
        Array(values)
    }
}
