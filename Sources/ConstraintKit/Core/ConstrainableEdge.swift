//
//  Edge.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 24/08/23.
//

import CoreGraphics

public protocol ConstrainableEdge {
    var rawValue: String { get }
}

public enum Edge: ConstrainableEdge {
    case top(spacing: CGFloat)
    case bottom(spacing: CGFloat)
    case leading(spacing: CGFloat)
    case trailing(spacing: CGFloat)

    case left(spacing: CGFloat)
    case right(spacing: CGFloat)

    case greaterThanTop(spacing: CGFloat)
    case lessThanBottom(spacing: CGFloat)
    case greaterThanLeading(spacing: CGFloat)
    case lessThanTrailing(spacing: CGFloat)

    public enum Keys {
        public static let top = "top"
        public static let bottom = "bottom"
        public static let leading = "leading"
        public static let trailing = "trailing"
        public static let left = "left"
        public static let right = "right"
        public static let greaterThanTop = "greaterThanTop"
        public static let lessThanBottom = "lessThanBottom"
        public static let greaterThanLeading = "greaterThanLeading"
        public static let lessThanTrailing = "lessThanTrailing"
    }

    public var rawValue: String {
        switch self {
        case .top:
            return Keys.top
        case .bottom:
            return Keys.bottom
        case .leading:
            return Keys.leading
        case .trailing:
            return Keys.trailing
        case .left:
            return Keys.left
        case .right:
            return Keys.right
        case .greaterThanTop:
            return Keys.greaterThanTop
        case .lessThanBottom:
            return Keys.lessThanBottom
        case .greaterThanLeading:
            return Keys.greaterThanLeading
        case .lessThanTrailing:
            return Keys.lessThanTrailing
        }
    }
}

public enum SafeAreaEdge: ConstrainableEdge {
    case safeAreaTop(spacing: CGFloat)
    case safeAreaBottom(spacing: CGFloat)
    case safeAreaLeading(spacing: CGFloat)
    case safeAreaTrailing(spacing: CGFloat)

    case safeAreaLeft(spacing: CGFloat)
    case safeAreaRight(spacing: CGFloat)

    case greaterThanSafeAreaTop(spacing: CGFloat)
    case lessThanSafeAreaBottom(spacing: CGFloat)
    case greaterThanSafeAreaLeading(spacing: CGFloat)
    case lessThanSafeAreaTrailing(spacing: CGFloat)

    public enum Keys {
        public static let safeAreaTop = "safeAreaTop"
        public static let safeAreaBottom = "safeAreaBottom"
        public static let safeAreaLeading = "safeAreaLeading"
        public static let safeAreaTrailing = "safeAreaTrailing"
        public static let safeAreaLeft = "safeAreaLeft"
        public static let safeAreaRight = "safeAreaRight"
        public static let greaterThanSafeAreaTop = "greaterThanSafeAreaTop"
        public static let lessThanSafeAreaBottom = "lessThanSafeAreaBottom"
        public static let greaterThanSafeAreaLeading = "greaterThanSafeAreaLeading"
        public static let lessThanSafeAreaTrailing = "lessThanSafeAreaTrailing"
    }

    public var rawValue: String {
        switch self {
        case .safeAreaTop:
            return Keys.safeAreaTop
        case .safeAreaBottom:
            return Keys.safeAreaBottom
        case .safeAreaLeading:
            return Keys.safeAreaLeading
        case .safeAreaTrailing:
            return Keys.safeAreaTrailing
        case .safeAreaLeft:
            return Keys.safeAreaLeft
        case .safeAreaRight:
            return Keys.safeAreaRight
        case .greaterThanSafeAreaTop:
            return Keys.greaterThanSafeAreaTop
        case .lessThanSafeAreaBottom:
            return Keys.lessThanSafeAreaBottom
        case .greaterThanSafeAreaLeading:
            return Keys.greaterThanSafeAreaLeading
        case .lessThanSafeAreaTrailing:
            return Keys.lessThanSafeAreaTrailing
        }
    }
}
