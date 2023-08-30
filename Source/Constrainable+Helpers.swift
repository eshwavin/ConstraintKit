//
//  Constrainable+Helpers.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 29/08/23.
//

import UIKit

internal extension Constrainable {
    
    @inlinable func pinEdge(_ edge: Edge, to constrainable: Constrainable? = nil) -> NSLayoutConstraint {
        return pin(edges: edge, to: constrainable)[edge.rawValue]!
    }
    
    @inlinable func pinEdge(_ safeAreaEdge: SafeAreaEdge, to safeAreaConstrainable: SafeAreaConstrainable? = nil) -> NSLayoutConstraint {
        return pin(safeAreaEdges: safeAreaEdge, to: safeAreaConstrainable)[safeAreaEdge.rawValue]!
    }
    
}

internal extension Constrainable {
    
    func getConstrainable(for targetConstrainable: Constrainable?) -> Constrainable {
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
    
    func setTranslatesAutoresizingMaskIntoConstraintsToFalse() {
        if let view = self as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}


