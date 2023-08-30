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
                constraint = topAnchor.constraint(equalTo: constraintToConstrainable.safeAreaLayoutGuide.topAnchor, constant: spacing)
                
            case .safeAreaBottom(let spacing):
                constraint = bottomAnchor.constraint(equalTo: constraintToConstrainable.safeAreaLayoutGuide.bottomAnchor, constant: spacing)
                
            case .safeAreaLeading(let spacing):
                constraint = leadingAnchor.constraint(equalTo: constraintToConstrainable.safeAreaLayoutGuide.leadingAnchor, constant: spacing)
                
            case .safeAreaTrailing(let spacing):
                constraint = trailingAnchor.constraint(equalTo: constraintToConstrainable.safeAreaLayoutGuide.trailingAnchor, constant: spacing)

                
            case .greaterThanSafeAreaTop(let spacing):
                constraint = topAnchor.constraint(greaterThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.topAnchor, constant: spacing)
                
            case .lessThanSafeAreaBottom(let spacing):
                constraint = bottomAnchor.constraint(lessThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.bottomAnchor, constant: spacing)
                
            case .greaterThanSafeAreaLeading(let spacing):
                constraint = leadingAnchor.constraint(greaterThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.leadingAnchor, constant: spacing)
                
            case .lessThanSafeAreaTrailing(let spacing):
                constraint = trailingAnchor.constraint(lessThanOrEqualTo: constraintToConstrainable.safeAreaLayoutGuide.trailingAnchor, constant: spacing)
                
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
                constraint = topAnchor.constraint(equalTo: constraintToConstrainable.topAnchor, constant: spacing)
                
                // absolute: bottom
            case .bottom(let spacing):
                constraint = bottomAnchor.constraint(equalTo: constraintToConstrainable.bottomAnchor, constant: spacing)
                
                // absolute: leading
            case .leading(let spacing):
                constraint = leadingAnchor.constraint(equalTo: constraintToConstrainable.leadingAnchor, constant: spacing)
                
                // absolute: trailing
            case .trailing(let spacing):
                constraint = trailingAnchor.constraint(equalTo: constraintToConstrainable.trailingAnchor, constant: spacing)
                
                // relative: top
            case .greaterThanTop(let spacing):
                constraint = topAnchor.constraint(greaterThanOrEqualTo: constraintToConstrainable.topAnchor, constant: spacing)
                
                // relative: bottom
            case .lessThanBottom(let spacing):
                constraint = bottomAnchor.constraint(lessThanOrEqualTo: constraintToConstrainable.bottomAnchor, constant: spacing)
                
                
                // relative: leading
            case .greaterThanLeading(let spacing):
                constraint = leadingAnchor.constraint(greaterThanOrEqualTo: constraintToConstrainable.leadingAnchor, constant: spacing)
                
                // relative: trailing
            case .lessThanTrailing(let spacing):
                constraint = trailingAnchor.constraint(lessThanOrEqualTo: constraintToConstrainable.trailingAnchor, constant: spacing)
            }
            
            constraint.isActive = true
            constraints[edge.rawValue] = constraint
            
        }
        
        return constraints
    }
    
}

// MARK: - To All Edges
public extension Constrainable {
    
    @discardableResult func pinAllEdgesSafely(to view: SafeAreaConstrainable? = nil, withSpacing spacing: CGFloat = 0) -> [String: NSLayoutConstraint] {
        return pin(safeAreaEdges: .safeAreaTop(spacing: spacing), .safeAreaLeading(spacing: spacing), .safeAreaTrailing(spacing: -spacing), .safeAreaBottom(spacing: -spacing), to: view)
    }
    
    @discardableResult func pinAllEdges(to view: Constrainable? = nil, withSpacing spacing: CGFloat = 0) -> [String: NSLayoutConstraint] {
        return pin(edges: .top(spacing: spacing), .leading(spacing: spacing), .trailing(spacing: -spacing), .bottom(spacing: -spacing), to: view)
    }
    
}

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

// MARK: - Center
public extension Constrainable {
    
    @discardableResult func centerX(to constrainable: Constrainable? = nil, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        
        constraint = centerXAnchor.constraint(equalTo: constraintToConstrainable.centerXAnchor, constant: offset)
        
        constraint.isActive = true
        return constraint
        
    }
    
    @discardableResult func centerY(to constrainable: Constrainable? = nil, withOffset offset: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        
        constraint = centerYAnchor.constraint(equalTo: constraintToConstrainable.centerYAnchor, constant: offset)
        
        constraint.isActive = true
        return constraint
        
    }
    
    @discardableResult func center(to view: UIView? = nil) -> [String: NSLayoutConstraint] {
        let centerXConstraint = centerX(to: view)
        let centerYConstraint = centerY(to: view)
        
        return [
            "centerX": centerXConstraint,
            "centerY": centerYConstraint
        ]
    }
}

// MARK: - Dimensions
public extension Constrainable {
    
    // MARK: Height
    
    @discardableResult func constrainHeight(equalTo constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func constrainHeightToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainHeight(to: constraintToConstrainable, multiplier: multiplier, constant: constant)
    }
    
    @discardableResult func constrainHeight(to constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        
        constraint = heightAnchor.constraint(equalTo: constraintToConstrainable.heightAnchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        
        return constraint
        
    }
    
    @discardableResult func constrainHeight(greaterThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func constrainHeight(lessThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    // MARK: Width
    
    @discardableResult func constrainWidth(equalTo constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func constrainWidthToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainWidth(to: constraintToConstrainable, multiplier: multiplier, constant: constant)
    }
    
    @discardableResult func constrainWidth(to constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        let constraintToConstrainable: Constrainable = getConstrainable(for: constrainable)
        
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        
        constraint = widthAnchor.constraint(equalTo: constraintToConstrainable.widthAnchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        
        return constraint
        
    }
    
    @discardableResult func constrainWidth(greaterThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func constrainWidth(lessThanEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    // MARK: Aspect Ratio
    
    /// Sets aspect ratio of the view
    /// - Parameter ratio: ratio in width / height
    /// - Returns: The constraint created
    @discardableResult func setAspectRatio(to ratio: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio)
        constraint.isActive = true
        return constraint
    }
    
}

// MARK: - Helpers
public extension Constrainable {
    
    func pinEdge(_ edge: Edge, to constrainable: Constrainable? = nil) -> NSLayoutConstraint {
        return pin(edges: edge, to: constrainable)[edge.rawValue]!
    }
    
    func pinEdge(_ safeAreaEdge: SafeAreaEdge, to safeAreaConstrainable: SafeAreaConstrainable? = nil) -> NSLayoutConstraint {
        return pin(safeAreaEdges: safeAreaEdge, to: safeAreaConstrainable)[safeAreaEdge.rawValue]!
    }
    
}

extension Constrainable {
    
    private func getConstrainable(for targetConstrainable: Constrainable?) -> Constrainable {
        let constraintToConstrainable: Constrainable
        
        if let targetConstrainable {
            constraintToConstrainable = targetConstrainable
        } else {
            guard let container else {
                fatalError("Both targetConstrainable and container are nil")
            }
            constraintToConstrainable = container
        }
        
        return constraintToConstrainable
    }
    
    private func setTranslatesAutoresizingMaskIntoConstraintsToFalse() {
        if let view = self as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}


