//
//  Constrainable+XEdges.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - Leading + Left
public extension Constrainable {
    
    /// Pins the receiver's leading anchor to the safe area leading anchor of `view`.
    /// - Parameters:
    ///   - view: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeadingToSafeArea(of view: SafeAreaConstrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaLeading(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    /// Pins the receiver's leading anchor to `constrainable`'s leading anchor.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeading(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .leading(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
    /// Pins the receiver's left anchor to `constrainable`'s left anchor.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeft(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .left(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
}

// MARK: - Trailing + Right
public extension Constrainable {
    
    /// Pins the receiver's trailing anchor to the safe area trailing anchor of `view`.
    /// - Parameters:
    ///   - view: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinTrailingToSafeArea(of view: SafeAreaConstrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaTrailing(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    /// Pins the receiver's trailing anchor to `constrainable`'s trailing anchor.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinTrailing(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .trailing(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
    /// Pins the receiver's right anchor to `constrainable`'s right anchor.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinRight(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .right(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
}

// MARK: - Other Horizontal Leading + Left
public extension Constrainable {
    
    /// Pins the receiver's leading anchor to `constrainable`'s trailing anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeadingToTrailing(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(equalTo: constrainable.trailingAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }

    /// Pins the receiver's leading anchor to `constrainable`'s trailing anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - inset: Positive value places the receiver to the right of `constrainable` by that amount.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeadingToTrailing(of constrainable: Constrainable, withInset inset: CGFloat) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(equalTo: constrainable.trailingAnchor, constant: inset)
        constraint.isActive = true
        return constraint
    }
    
    /// Pins the receiver's leading anchor to `constrainable`'s center X anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - offset: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeadingToCenterX(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    /// Pins the receiver's left anchor to `constrainable`'s right anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeftToRight(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: constrainable.rightAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }

    /// Pins the receiver's left anchor to `constrainable`'s right anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - inset: Positive value places the receiver to the right of `constrainable` by that amount.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinLeftToRight(of constrainable: Constrainable, withInset inset: CGFloat) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: constrainable.rightAnchor, constant: inset)
        constraint.isActive = true
        return constraint
    }
    
}

// MARK: - Other Horizontal Trailing + Right
public extension Constrainable {
    
    /// Pins the receiver's trailing anchor to `constrainable`'s leading anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinTrailingToLeading(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(equalTo: constrainable.leadingAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }

    /// Pins the receiver's trailing anchor to `constrainable`'s leading anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - inset: Positive value places the receiver to the left of `constrainable` by that amount.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinTrailingToLeading(of constrainable: Constrainable, withInset inset: CGFloat) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(equalTo: constrainable.leadingAnchor, constant: -inset)
        constraint.isActive = true
        return constraint
    }
    
    /// Pins the receiver's trailing anchor to `constrainable`'s center X anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - offset: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinTrailingToCenterX(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    /// Pins the receiver's right anchor to `constrainable`'s left anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - spacing: The Auto Layout constant; passed through directly.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinRightToLeft(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: constrainable.leftAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }

    /// Pins the receiver's right anchor to `constrainable`'s left anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - inset: Positive value places the receiver to the left of `constrainable` by that amount.
    /// - Returns: The activated constraint.
    @discardableResult
    func pinRightToLeft(of constrainable: Constrainable, withInset inset: CGFloat) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: constrainable.leftAnchor, constant: -inset)
        constraint.isActive = true
        return constraint
    }
    
}
