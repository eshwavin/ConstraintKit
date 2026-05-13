//
//  Constrainable+Center.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - Center
public extension Constrainable {
    
    /// Centers the receiver horizontally relative to `constrainable`.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - offset: Horizontal offset in points; positive moves the receiver to the right. Defaults to `0`.
    /// - Returns: The activated `centerX` constraint.
    @discardableResult
    func centerX(to constrainable: Constrainable? = nil, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        
        constraint = centerXAnchor.constraint(equalTo: constraintToConstrainable.centerXAnchor, constant: offset)
        
        constraint.isActive = true
        return constraint
        
    }
    
    /// Centers the receiver vertically relative to `constrainable`.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - offset: Vertical offset in points; positive moves the receiver down. Defaults to `0`.
    /// - Returns: The activated `centerY` constraint.
    @discardableResult
    func centerY(to constrainable: Constrainable? = nil, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        
        constraint = centerYAnchor.constraint(equalTo: constraintToConstrainable.centerYAnchor, constant: offset)
        
        constraint.isActive = true
        return constraint
        
    }
    
    /// Centers the receiver both horizontally and vertically relative to `view`.
    /// - Parameters:
    ///   - view: The target. Defaults to the receiver's superview.
    ///   - offset: X and Y offsets in points. Defaults to `.zero`.
    /// - Returns: A dictionary of activated constraints keyed by `CenterConstraintKeys.centerX` and `CenterConstraintKeys.centerY`.
    @discardableResult
    func center(to view: Constrainable? = nil, withOffset offset: Offset = .zero) -> [String: NSLayoutConstraint] {
        let centerXConstraint = centerX(to: view, withOffset: offset.x)
        let centerYConstraint = centerY(to: view, withOffset: offset.y)

        return [
            CenterConstraintKeys.centerX: centerXConstraint,
            CenterConstraintKeys.centerY: centerYConstraint
        ]
    }
}

