//
//  Constrainable+Center.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

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
    
    @discardableResult func center(to view: Constrainable? = nil) -> [String: NSLayoutConstraint] {
        let centerXConstraint = centerX(to: view)
        let centerYConstraint = centerY(to: view)
        
        return [
            CenterConstraintKeys.centerX: centerXConstraint,
            CenterConstraintKeys.centerY: centerYConstraint
        ]
    }
}

