//
//  Constrainable+XEdges.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - Leading + Left
public extension Constrainable {
    
    @discardableResult
    func pinLeadingToSafeArea(of view: UIView? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaLeading(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    @discardableResult 
    func pinLeading(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .leading(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
    @discardableResult
    func pinLeft(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .left(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
}

// MARK: - Trailing + Right
public extension Constrainable {
    
    @discardableResult 
    func pinTrailingToSafeArea(of view: UIView? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaTrailing(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    @discardableResult 
    func pinTrailing(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .trailing(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
    @discardableResult
    func pinRight(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .right(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
}

// MARK: - Other Horizontal Leading + Left
public extension Constrainable {
    
    @discardableResult
    func pinLeadingToTrailing(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = leadingAnchor.constraint(equalTo: constrainable.trailingAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinLeadingToCenterX(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = leadingAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinLeftToRight(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = leftAnchor.constraint(equalTo: constrainable.rightAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
}

// MARK: - Other Horizontal Trailing + Right
public extension Constrainable {
    
    @discardableResult
    func pinTrailingToLeading(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = trailingAnchor.constraint(equalTo: constrainable.leadingAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult 
    func pinTrailingToCenterX(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = trailingAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinRightToLeft(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = rightAnchor.constraint(equalTo: constrainable.leftAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
}
