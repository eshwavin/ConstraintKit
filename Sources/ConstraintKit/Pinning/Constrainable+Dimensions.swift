//
//  Constrainable+Dimensions.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - Dimensions
public extension Constrainable {
    
    // MARK: Height

    /// Constrains the receiver's height to a fixed constant.
    /// - Parameter constant: The height in points.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainHeight(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constrains the receiver's height to a multiple of its superview's height.
    /// - Parameters:
    ///   - multiplier: Scale factor applied to the superview's height. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainHeightToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainHeight(toConstrainable: constraintToConstrainable, multiplier: multiplier, constant: constant)
    }
    
    /// Constrains the receiver's height to a multiple of `constrainable`'s height.
    /// - Parameters:
    ///   - constrainable: The reference view or layout guide.
    ///   - multiplier: Scale factor. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainHeight(toConstrainable constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)

        constraint = heightAnchor.constraint(equalTo: constraintToConstrainable.heightAnchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        
        return constraint
        
    }
    
    /// Constrains the receiver's height to be greater than or equal to a constant.
    /// - Parameter constant: The minimum height in points.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainHeight(greaterThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constrains the receiver's height to be less than or equal to a constant.
    /// - Parameter constant: The maximum height in points.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainHeight(lessThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    // MARK: Width

    /// Constrains the receiver's width to a fixed constant.
    /// - Parameter constant: The width in points.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainWidth(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constrains the receiver's width to a multiple of its superview's width.
    /// - Parameters:
    ///   - multiplier: Scale factor applied to the superview's width. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainWidthToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainWidth(toConstrainable: constraintToConstrainable, multiplier: multiplier, constant: constant)
    }
    
    /// Constrains the receiver's width to a multiple of `constrainable`'s width.
    /// - Parameters:
    ///   - constrainable: The reference view or layout guide.
    ///   - multiplier: Scale factor. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainWidth(toConstrainable constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)

        constraint = widthAnchor.constraint(equalTo: constraintToConstrainable.widthAnchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        
        return constraint
        
    }
    
    /// Constrains the receiver's width to be greater than or equal to a constant.
    /// - Parameter constant: The minimum width in points.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainWidth(greaterThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    /// Constrains the receiver's width to be less than or equal to a constant.
    /// - Parameter constant: The maximum width in points.
    /// - Returns: The activated constraint.
    @discardableResult
    func constrainWidth(lessThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    // MARK: Aspect Ratio

    /// Constrains the receiver's aspect ratio (width ÷ height).
    /// - Parameter ratio: The desired width-to-height ratio.
    /// - Returns: The activated constraint.
    @discardableResult
    func setAspectRatio(to ratio: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio)
        constraint.isActive = true
        return constraint
    }
    
}

