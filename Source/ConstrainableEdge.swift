//
//  Edge.swift
//  ConstraintKit
//
//  Created by Srivinayak Chaitanya Eshwa on 24/08/23.
//

import Foundation

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
    
    public var rawValue: String {
        switch self {
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .leading:
            return "leading"
        case .trailing:
            return "trailing"
            
        case .left:
            return "left"
        case .right:
            return "right"
            
        case .greaterThanTop:
            return "greaterThanTop"
        case .lessThanBottom:
            return "lessThanBottom"
        case .greaterThanLeading:
            return "greaterThanLeading"
        case .lessThanTrailing:
            return "lessThanTrailing"
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
    
    public var rawValue: String {
        switch self {
        case .safeAreaTop:
            return "safeAreaTop"
        case .safeAreaBottom:
            return "safeAreaBottom"
        case .safeAreaLeading:
            return "safeAreaLeading"
        case .safeAreaTrailing:
            return "safeAreaTrailing"
            
        case .safeAreaLeft:
            return "safeAreaLeft"
        case .safeAreaRight:
            return "safeAreaRight"
            
        case .greaterThanSafeAreaTop:
            return "greaterThanSafeAreaTop"
        case .lessThanSafeAreaBottom:
            return "lessThanSafeAreaBottom"
        case .greaterThanSafeAreaLeading:
            return "greaterThanSafeAreaLeading"
        case .lessThanSafeAreaTrailing:
            return "lessThanSafeAreaTrailing"
        }
    }
}
