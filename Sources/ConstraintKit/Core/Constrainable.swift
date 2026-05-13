//
//  Constrainable.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 24/08/23.
//

import UIKit

/// The base layout protocol adopted by both `UIView` and `UILayoutGuide`.
///
/// When a constraint method's target parameter is `nil`, the receiver's `container`
/// is used as the fallback — the superview for `UIView`, the owning view for `UILayoutGuide`.
/// A `fatalError` is raised if no target is provided and `container` is `nil`.
public protocol Constrainable: AnyObject {
    var container: UIView? { get }
    
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}
