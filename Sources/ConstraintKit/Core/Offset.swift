//
//  Offset.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 13/05/26.
//

import CoreGraphics

public struct Offset {
    public let x: CGFloat
    public let y: CGFloat

    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }

    public static let zero = Offset(x: 0, y: 0)
}
