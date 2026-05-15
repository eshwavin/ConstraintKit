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
    /// - Parameters:
    ///   - constant: The height in points.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainHeight(equalToConstant constant: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Constrains the receiver's height to a multiple of its superview's height.
    /// - Parameters:
    ///   - multiplier: Scale factor applied to the superview's height. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainHeightToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainHeight(toConstrainable: constraintToConstrainable, multiplier: multiplier, constant: constant, shouldActivate: shouldActivate)
    }

    /// Constrains the receiver's height to a multiple of `constrainable`'s height.
    /// - Parameters:
    ///   - constrainable: The reference view or layout guide.
    ///   - multiplier: Scale factor. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainHeight(toConstrainable constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        let constraint = heightAnchor.constraint(equalTo: constraintToConstrainable.heightAnchor, multiplier: multiplier, constant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Constrains the receiver's height to be greater than or equal to a constant.
    /// - Parameters:
    ///   - constant: The minimum height in points.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainHeight(greaterThanEqualToConstant constant: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Constrains the receiver's height to be less than or equal to a constant.
    /// - Parameters:
    ///   - constant: The maximum height in points.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainHeight(lessThanEqualToConstant constant: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    // MARK: Width

    /// Constrains the receiver's width to a fixed constant.
    /// - Parameters:
    ///   - constant: The width in points.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainWidth(equalToConstant constant: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Constrains the receiver's width to a multiple of its superview's width.
    /// - Parameters:
    ///   - multiplier: Scale factor applied to the superview's width. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainWidthToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainWidth(toConstrainable: constraintToConstrainable, multiplier: multiplier, constant: constant, shouldActivate: shouldActivate)
    }

    /// Constrains the receiver's width to a multiple of `constrainable`'s width.
    /// - Parameters:
    ///   - constrainable: The reference view or layout guide.
    ///   - multiplier: Scale factor. Defaults to `1`.
    ///   - constant: Additive offset in points. Defaults to `0`.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainWidth(toConstrainable constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        let constraint = widthAnchor.constraint(equalTo: constraintToConstrainable.widthAnchor, multiplier: multiplier, constant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Constrains the receiver's width to be greater than or equal to a constant.
    /// - Parameters:
    ///   - constant: The minimum width in points.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainWidth(greaterThanEqualToConstant constant: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Constrains the receiver's width to be less than or equal to a constant.
    /// - Parameters:
    ///   - constant: The maximum width in points.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func constrainWidth(lessThanEqualToConstant constant: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = shouldActivate
        return constraint
    }

    // MARK: Aspect Ratio

    /// Constrains the receiver's aspect ratio (width ÷ height).
    /// - Parameters:
    ///   - ratio: The desired width-to-height ratio.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func setAspectRatio(to ratio: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio)
        constraint.isActive = shouldActivate
        return constraint
    }

}
