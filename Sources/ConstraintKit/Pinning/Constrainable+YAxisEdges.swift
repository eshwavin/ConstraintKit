//
//  Constrainable+YEdges.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - Top
public extension Constrainable {

    /// Pins the receiver's top anchor to the safe area top anchor of `view`.
    /// - Parameters:
    ///   - view: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinTopToSafeArea(of view: SafeAreaConstrainable? = nil, withSpacing spacing: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaTop(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view, shouldActivate: shouldActivate)
    }

    /// Pins the receiver's top anchor to `constrainable`'s top anchor.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinTop(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let edge: Edge = .top(spacing: spacing)
        return pinEdge(edge, to: constrainable, shouldActivate: shouldActivate)
    }

}

// MARK: - Bottom
public extension Constrainable {

    /// Pins the receiver's bottom anchor to the safe area bottom anchor of `view`.
    /// - Parameters:
    ///   - view: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinBottomToSafeArea(of view: SafeAreaConstrainable? = nil, withSpacing spacing: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaBottom(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view, shouldActivate: shouldActivate)
    }

    /// Pins the receiver's bottom anchor to `constrainable`'s bottom anchor.
    /// - Parameters:
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - spacing: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinBottom(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let edge: Edge = .bottom(spacing: spacing)
        return pinEdge(edge, to: constrainable, shouldActivate: shouldActivate)
    }

}

// MARK: - Other Vertical
public extension Constrainable {

    /// Pins the receiver's top anchor to `constrainable`'s bottom anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - spacing: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinTopToBottom(of constrainable: Constrainable, withSpacing spacing: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: constrainable.bottomAnchor, constant: spacing)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Pins the receiver's top anchor to `constrainable`'s bottom anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - inset: Positive value places the receiver below `constrainable` by that amount.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinTopToBottom(of constrainable: Constrainable, withInset inset: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: constrainable.bottomAnchor, constant: inset)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Pins the receiver's bottom anchor to `constrainable`'s top anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - spacing: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinBottomToTop(of constrainable: Constrainable, withSpacing spacing: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: constrainable.topAnchor, constant: spacing)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Pins the receiver's bottom anchor to `constrainable`'s top anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - inset: Positive value places the receiver above `constrainable` by that amount.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinBottomToTop(of constrainable: Constrainable, withInset inset: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: constrainable.topAnchor, constant: -inset)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Pins the receiver's top anchor to `constrainable`'s center Y anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - offset: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinTopToCenterY(of constrainable: Constrainable, withOffset offset: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: constrainable.centerYAnchor, constant: offset)
        constraint.isActive = shouldActivate
        return constraint
    }

    /// Pins the receiver's bottom anchor to `constrainable`'s center Y anchor.
    /// - Parameters:
    ///   - constrainable: The anchor source.
    ///   - offset: The Auto Layout constant; passed through directly.
    ///   - shouldActivate: If `true`, activates the constraint immediately. Defaults to `true`.
    /// - Returns: The constraint.
    @discardableResult
    func pinBottomToCenterY(of constrainable: Constrainable, withOffset offset: CGFloat, shouldActivate: Bool = true) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: constrainable.centerYAnchor, constant: offset)
        constraint.isActive = shouldActivate
        return constraint
    }

}
