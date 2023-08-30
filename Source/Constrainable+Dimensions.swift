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
    
    @discardableResult func constrainHeight(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func constrainHeightToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainHeight(toConstrainable: constraintToConstrainable, multiplier: multiplier, constant: constant)
    }
    
    @discardableResult func constrainHeight(toConstrainable constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        
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
    
    @discardableResult func constrainWidth(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
        setTranslatesAutoresizingMaskIntoConstraintsToFalse()
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func constrainWidthToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraintToConstrainable: Constrainable = getConstrainable(for: nil)
        return constrainWidth(toConstrainable: constraintToConstrainable, multiplier: multiplier, constant: constant)
    }
    
    @discardableResult func constrainWidth(toConstrainable constrainable: Constrainable, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        
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

