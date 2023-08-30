//
//  Constrainable+YEdges.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

// MARK: - Top
public extension Constrainable {
    
    @discardableResult func pinTopToSafeArea(of view: UIView? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaTop(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    @discardableResult func pinTop(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .top(spacing: spacing)
        return pinEdge(edge, to: constrainable)
        
    }
    
}

// MARK: - Bottom
public extension Constrainable {
    
    @discardableResult func pinBottomToSafeArea(of view: UIView? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let safeAreaEdge: SafeAreaEdge = .safeAreaBottom(spacing: spacing)
        return pinEdge(safeAreaEdge, to: view)
    }
    
    @discardableResult func pinBottom(to constrainable: Constrainable? = nil, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        let edge: Edge = .bottom(spacing: spacing)
        return pinEdge(edge, to: constrainable)
    }
    
}

// MARK: - Other Vertical
public extension Constrainable {
    
    @discardableResult func pinTopToBottom(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = topAnchor.constraint(equalTo: constrainable.bottomAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func pinBottomToTop(of constrainable: Constrainable, withSpacing spacing: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = bottomAnchor.constraint(equalTo: constrainable.topAnchor, constant: spacing)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func pinTopToCenterY(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = topAnchor.constraint(equalTo: constrainable.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func pinBottomToCenterY(of constrainable: Constrainable, withOffset offset: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = bottomAnchor.constraint(equalTo: constrainable.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    
}
