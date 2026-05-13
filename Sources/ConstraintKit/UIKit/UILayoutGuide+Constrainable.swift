//
//  UILayoutGuide+Constrainable.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 28/08/23.
//

import UIKit

extension UILayoutGuide: Constrainable {
    public var container: UIView? {
        return owningView
    }
}
