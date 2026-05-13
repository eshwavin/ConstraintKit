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
        if let targetConstrainable { return targetConstrainable }
        guard let container else {
            fatalError("No target constrainable was provided and the view has no superview. Add the view to a hierarchy before calling pin methods, or pass an explicit target.")
        }
        return container
    }

    func getConstrainable(for targetConstrainable: SafeAreaConstrainable?) -> SafeAreaConstrainable {
        if let targetConstrainable { return targetConstrainable }
        guard let container else {
            fatalError("No target constrainable was provided and the view has no superview. Add the view to a hierarchy before calling pin methods, or pass an explicit target.")
        }
        return container
    }
    
}


