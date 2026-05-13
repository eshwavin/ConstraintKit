//
//  SafeAreaConstrainable.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 28/08/23.
//

import UIKit

public protocol SafeAreaConstrainable: Constrainable {
    var safeAreaLayoutGuide: UILayoutGuide { get }
}
