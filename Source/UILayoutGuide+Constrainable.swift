//
//  UILayoutGuide+Constrainable.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 28/08/23.
//

import UIKit

extension UILayoutGuide: Constrainable {
    public var container: Constrainable? {
        return owningView
    }
    
    public var translatesAutoresizingMaskIntoConstraints: Bool {
        get {
            return false
        }
        set {
            return
        }
    }
    
    public var optionalSafeAreaLayoutGuide: UILayoutGuide? {
        return nil
    }
}
