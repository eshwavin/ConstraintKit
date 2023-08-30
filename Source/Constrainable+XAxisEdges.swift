//
//  Constrainable+XEdges.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - Leading
public extension Constrainable {
    
    @discardableResult func pinLeadingToSafeArea(of view: UIView? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaLeading(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    @discardableResult func pinLeading(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .leading(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
}

// MARK: - Trailing
public extension Constrainable {
    
    @discardableResult func pinTrailingToSafeArea(of view: UIView? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaTrailing(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    @discardableResult func pinTrailing(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .trailing(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
}

// MARK: - Other Horizontal
public extension Constrainable {
    
    @discardableResult func pinLeadingToTrailing(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = leadingAnchor.constraint(equalTo: constrainable.trailingAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func pinTrailingToLeading(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = trailingAnchor.constraint(equalTo: constrainable.leadingAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func pinLeadingToCenterX(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = leadingAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func pinTrailingToCenterX(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = trailingAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
}
