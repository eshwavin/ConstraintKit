//
//  SafeAreaConstrainable.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 28/08/23.
//

import UIKit

/// A `Constrainable` that also exposes a `safeAreaLayoutGuide` for safe-area pinning.
///
/// Only `UIView` conforms. `UILayoutGuide` cannot be used with safe-area methods.
public protocol SafeAreaConstrainable: Constrainable {
    var safeAreaLayoutGuide: UILayoutGuide { get }
}
