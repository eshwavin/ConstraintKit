//
//  Constrainable+Extensions.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import Foundation

// MARK: - All Edges
public extension Constrainable {
    @discardableResult func pin(constrainableEdges: [ConstrainableEdge], to safeAreaConstrainable: SafeAreaConstrainable? = nil) -> [String: NSLayoutConstraint] {
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
        
        let safeAreaConstraintsDictionary = pin(safeAreaEdges: safeAreaEdges, to: safeAreaConstrainable)
        let constraintsDictionary = pin(edges: edges, to: safeAreaConstrainable)
        
        return safeAreaConstraintsDictionary.merging(constraintsDictionary) { firstConstraint, _ in
            return firstConstraint
        }
        
    }
    
    @discardableResult func pin(constrainableEdges: ConstrainableEdge..., to safeAreaConstrainable: SafeAreaConstrainable? = nil) -> [String: NSLayoutConstraint] {
        return pin(constrainableEdges: constrainableEdges, to: safeAreaConstrainable)
    }
}

// MARK: - Safe Area Edges
public extension Constrainable {
    
    @discardableResult func pin(safeAreaEdges: SafeAreaEdge..., to safeAreaConstrainable: SafeAreaConstrainable? = nil) -> [String: NSLayoutConstraint] {
        return pin(safeAreaEdges: safeAreaEdges, to: safeAreaConstrainable)
    }
    
    @discardableResult func pin(safeAreaEdges: [SafeAreaEdge], to safeAreaConstrainable: SafeAreaConstrainable? = nil) -> [String: NSLayoutConstraint] {
        var constraints = [String: NSLayoutConstraint]()
        let constraintToConstrainable: SafeAreaConstrainable = getConstrainable(for: safeAreaConstrainable) as! SafeAreaConstrainable
        
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        
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
            
            constraint.isActive = true
            constraints[edge.rawValue] = constraint
        }
        
        return constraints
    }
    
}

// MARK: - Non-Safe Area Edges
public extension Constrainable {
    
    @discardableResult func pin(edges: Edge..., to constrainable: Constrainable? = nil) -> [String: NSLayoutConstraint] {
        return pin(edges: edges, to: constrainable)
    }
    
    @discardableResult func pin(edges: [Edge], to constrainable: Constrainable? = nil) -> [String: NSLayoutConstraint] {
        
        var constraints = [String: NSLayoutConstraint]()
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        
        for edge in edges {
            
            let constraint: NSLayoutConstraint
            
            switch edge {
                
                // absolute: top
            case .top(let spacing):
                constraint = topAnchor.constraint(
                    equalTo: constraintToConstrainable.topAnchor,
                    constant: spacing
                )
                
                // absolute: bottom
            case .bottom(let spacing):
                constraint = bottomAnchor.constraint(
                    equalTo: constraintToConstrainable.bottomAnchor,
                    constant: spacing
                )
                
                // absolute: leading
            case .leading(let spacing):
                constraint = leadingAnchor.constraint(
                    equalTo: constraintToConstrainable.leadingAnchor,
                    constant: spacing
                )
                
                // absolute: trailing
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
                
                // relative: top
            case .greaterThanTop(let spacing):
                constraint = topAnchor.constraint(
                    greaterThanOrEqualTo: constraintToConstrainable.topAnchor,
                    constant: spacing
                )
                
                // relative: bottom
            case .lessThanBottom(let spacing):
                constraint = bottomAnchor.constraint(
                    lessThanOrEqualTo: constraintToConstrainable.bottomAnchor,
                    constant: spacing
                )
                
                
                // relative: leading
            case .greaterThanLeading(let spacing):
                constraint = leadingAnchor.constraint(
                    greaterThanOrEqualTo: constraintToConstrainable.leadingAnchor,
                    constant: spacing
                )
                
                // relative: trailing
            case .lessThanTrailing(let spacing):
                constraint = trailingAnchor.constraint(
                    lessThanOrEqualTo: constraintToConstrainable.trailingAnchor,
                    constant: spacing
                )
            }
            
            constraint.isActive = true
            constraints[edge.rawValue] = constraint
            
        }
        
        return constraints
    }
    
}

// MARK: - All 4 Edges
public extension Constrainable {
    
    @discardableResult func pinAllEdgesSafely(to view: SafeAreaConstrainable? = nil, withSpacing spacing: CGFloat = 0) -> [String: NSLayoutConstraint] {
        return pin(safeAreaEdges: .safeAreaTop(spacing: spacing), .safeAreaLeading(spacing: spacing), .safeAreaTrailing(spacing: -spacing), .safeAreaBottom(spacing: -spacing), to: view)
    }
    
    @discardableResult func pinAllEdges(to view: Constrainable? = nil, withSpacing spacing: CGFloat = 0) -> [String: NSLayoutConstraint] {
        return pin(edges: .top(spacing: spacing), .leading(spacing: spacing), .trailing(spacing: -spacing), .bottom(spacing: -spacing), to: view)
    }
    
}
