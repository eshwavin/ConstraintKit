//
//  Constrainable+Extensions.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - All Edges
public extension Constrainable {
    /// Pins a mixed array of `Edge` and `SafeAreaEdge` values in a single call.
    /// - Parameters:
    ///   - constrainableEdges: Any combination of `Edge` and `SafeAreaEdge` cases.
    ///   - safeAreaConstrainable: The target. Defaults to the receiver's superview.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A merged dictionary of constraints keyed by `Edge.Keys` and `SafeAreaEdge.Keys` values.
    @discardableResult
    func pin(constrainableEdges: [ConstrainableEdge], to safeAreaConstrainable: SafeAreaConstrainable? = nil, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        var edges: [Edge] = []
        var safeAreaEdges: [SafeAreaEdge] = []

        for constrainableEdge in constrainableEdges {
            if let edge = constrainableEdge as? Edge {
                edges.append(edge)
            }
            else if let safeAreaEdge = constrainableEdge as? SafeAreaEdge {
                safeAreaEdges.append(safeAreaEdge)
            }
        }

        let safeAreaConstraintsDictionary = pin(safeAreaEdges: safeAreaEdges, to: safeAreaConstrainable, shouldActivate: shouldActivate)
        let constraintsDictionary = pin(edges: edges, to: safeAreaConstrainable, shouldActivate: shouldActivate)

        return safeAreaConstraintsDictionary.merging(constraintsDictionary) { firstConstraint, _ in
            return firstConstraint
        }
    }

    /// Pins any combination of `Edge` and `SafeAreaEdge` values in a single call.
    /// - Parameters:
    ///   - constrainableEdges: Any combination of `Edge` and `SafeAreaEdge` cases.
    ///   - safeAreaConstrainable: The target. Defaults to the receiver's superview.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A merged dictionary of constraints keyed by `Edge.Keys` and `SafeAreaEdge.Keys` values.
    @discardableResult
    func pin(constrainableEdges: ConstrainableEdge..., to safeAreaConstrainable: SafeAreaConstrainable? = nil, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        return pin(constrainableEdges: constrainableEdges, to: safeAreaConstrainable, shouldActivate: shouldActivate)
    }
}

// MARK: - Safe Area Edges
public extension Constrainable {

    /// Pins the given safe-area edges to `safeAreaConstrainable`.
    /// - Parameters:
    ///   - safeAreaEdges: One or more `SafeAreaEdge` cases, each carrying a spacing constant.
    ///   - safeAreaConstrainable: The target. Defaults to the receiver's superview.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A dictionary of constraints keyed by `SafeAreaEdge.Keys`.
    @discardableResult
    func pin(safeAreaEdges: SafeAreaEdge..., to safeAreaConstrainable: SafeAreaConstrainable? = nil, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        return pin(safeAreaEdges: safeAreaEdges, to: safeAreaConstrainable, shouldActivate: shouldActivate)
    }

    /// Pins the given safe-area edges to `safeAreaConstrainable`.
    /// - Parameters:
    ///   - safeAreaEdges: An array of `SafeAreaEdge` cases, each carrying a spacing constant.
    ///   - safeAreaConstrainable: The target. Defaults to the receiver's superview.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A dictionary of constraints keyed by `SafeAreaEdge.Keys`.
    @discardableResult
    func pin(safeAreaEdges: [SafeAreaEdge], to safeAreaConstrainable: SafeAreaConstrainable? = nil, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        var constraints = [String: NSLayoutConstraint]()
        let constraintToConstrainable: SafeAreaConstrainable = getConstrainable(for: safeAreaConstrainable)

        for edge in safeAreaEdges {

            let constraint: NSLayoutConstraint

            switch edge {
            case .safeAreaTop(let spacing):
                constraint = topAnchor.constraint(
                    equalTo: constraintToConstrainable.safeAreaLayoutGuide.topAnchor,
                    constant: spacing
                )
            case .safeAreaBottom(let spacing):
                constraint = bottomAnchor.constraint(
                    equalTo: constraintToConstrainable.safeAreaLayoutGuide.bottomAnchor,
                    constant: spacing
                )
            case .safeAreaLeading(let spacing):
                constraint = leadingAnchor.constraint(
                    equalTo: constraintToConstrainable.safeAreaLayoutGuide.leadingAnchor,
                    constant: spacing
                )
            case .safeAreaTrailing(let spacing):
                constraint = trailingAnchor.constraint(
                    equalTo: constraintToConstrainable.safeAreaLayoutGuide.trailingAnchor,
                    constant: spacing
                )
            case .safeAreaLeft(let spacing):
                constraint = leftAnchor.constraint(
                    equalTo: constraintToConstrainable.safeAreaLayoutGuide.leftAnchor,
                    constant: spacing
                )
            case .safeAreaRight(let spacing):
                constraint = rightAnchor.constraint(
                    equalTo: constraintToConstrainable.safeAreaLayoutGuide.rightAnchor,
                    constant: spacing
                )
            case .greaterThanSafeAreaTop(let spacing):
                constraint = topAnchor.constraint(
                    greaterThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.topAnchor,
                    constant: spacing
                )
            case .lessThanSafeAreaBottom(let spacing):
                constraint = bottomAnchor.constraint(
                    lessThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.bottomAnchor,
                    constant: spacing
                )
            case .greaterThanSafeAreaLeading(let spacing):
                constraint = leadingAnchor.constraint(
                    greaterThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.leadingAnchor,
                    constant: spacing
                )
            case .lessThanSafeAreaTrailing(let spacing):
                constraint = trailingAnchor.constraint(
                    lessThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.trailingAnchor,
                    constant: spacing
                )
            }

            constraint.isActive = shouldActivate
            constraints[edge.rawValue] = constraint
        }

        return constraints
    }

}

// MARK: - Non-Safe Area Edges
public extension Constrainable {

    /// Pins the given edges to `constrainable`, using the spacing value embedded in each case.
    /// - Parameters:
    ///   - edges: One or more `Edge` cases, each carrying a spacing constant.
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A dictionary of constraints keyed by `Edge.Keys`.
    @discardableResult
    func pin(edges: Edge..., to constrainable: Constrainable? = nil, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        return pin(edges: edges, to: constrainable, shouldActivate: shouldActivate)
    }

    /// Pins the given edges to `constrainable`, using the spacing value embedded in each case.
    /// - Parameters:
    ///   - edges: An array of `Edge` cases, each carrying a spacing constant.
    ///   - constrainable: The target. Defaults to the receiver's superview.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A dictionary of constraints keyed by `Edge.Keys`.
    @discardableResult
    func pin(edges: [Edge], to constrainable: Constrainable? = nil, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        var constraints = [String: NSLayoutConstraint]()
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)

        for edge in edges {

            let constraint: NSLayoutConstraint

            switch edge {
            case .top(let spacing):
                constraint = topAnchor.constraint(
                    equalTo: constraintToConstrainable.topAnchor,
                    constant: spacing
                )
            case .bottom(let spacing):
                constraint = bottomAnchor.constraint(
                    equalTo: constraintToConstrainable.bottomAnchor,
                    constant: spacing
                )
            case .leading(let spacing):
                constraint = leadingAnchor.constraint(
                    equalTo: constraintToConstrainable.leadingAnchor,
                    constant: spacing
                )
            case .trailing(let spacing):
                constraint = trailingAnchor.constraint(
                    equalTo: constraintToConstrainable.trailingAnchor,
                    constant: spacing
                )
            case .left(let spacing):
                constraint = leftAnchor.constraint(
                    equalTo: constraintToConstrainable.leftAnchor,
                    constant: spacing
                )
            case .right(let spacing):
                constraint = rightAnchor.constraint(
                    equalTo: constraintToConstrainable.rightAnchor,
                    constant: spacing
                )
            case .greaterThanTop(let spacing):
                constraint = topAnchor.constraint(
                    greaterThanOrEqualTo: constraintToConstrainable.topAnchor,
                    constant: spacing
                )
            case .lessThanBottom(let spacing):
                constraint = bottomAnchor.constraint(
                    lessThanOrEqualTo: constraintToConstrainable.bottomAnchor,
                    constant: spacing
                )
            case .greaterThanLeading(let spacing):
                constraint = leadingAnchor.constraint(
                    greaterThanOrEqualTo: constraintToConstrainable.leadingAnchor,
                    constant: spacing
                )
            case .lessThanTrailing(let spacing):
                constraint = trailingAnchor.constraint(
                    lessThanOrEqualTo: constraintToConstrainable.trailingAnchor,
                    constant: spacing
                )
            }

            constraint.isActive = shouldActivate
            constraints[edge.rawValue] = constraint
        }

        return constraints
    }

}

// MARK: - All 4 Edges
public extension Constrainable {

    /// Pins all four edges to the safe area of `view` with a uniform inset.
    ///
    /// Trailing and bottom constants are negated internally, so a positive `inset`
    /// always shrinks the receiver inward from all sides.
    /// - Parameters:
    ///   - view: The target. Defaults to the receiver's superview.
    ///   - inset: Positive value insets the receiver on all sides. Defaults to `0`.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A dictionary of constraints keyed by `SafeAreaEdge.Keys`.
    @discardableResult
    func pinAllEdgesSafely(to view: SafeAreaConstrainable? = nil, withInset inset: CGFloat = 0, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        return pin(safeAreaEdges: .safeAreaTop(spacing: inset), .safeAreaLeading(spacing: inset), .safeAreaTrailing(spacing: -inset), .safeAreaBottom(spacing: -inset), to: view, shouldActivate: shouldActivate)
    }

    /// Pins all four edges to `view` with a uniform inset.
    ///
    /// Trailing and bottom constants are negated internally, so a positive `inset`
    /// always shrinks the receiver inward from all sides.
    /// - Parameters:
    ///   - view: The target. Defaults to the receiver's superview.
    ///   - inset: Positive value insets the receiver on all sides. Defaults to `0`.
    ///   - shouldActivate: If `true`, activates each constraint immediately. Defaults to `true`.
    /// - Returns: A dictionary of constraints keyed by `Edge.Keys`.
    @discardableResult
    func pinAllEdges(to view: Constrainable? = nil, withInset inset: CGFloat = 0, shouldActivate: Bool = true) -> [String: NSLayoutConstraint] {
        return pin(edges: .top(spacing: inset), .leading(spacing: inset), .trailing(spacing: -inset), .bottom(spacing: -inset), to: view, shouldActivate: shouldActivate)
    }

}
