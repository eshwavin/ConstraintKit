# ConstraintKit

ConstraintKit is a lightweight Swift package that wraps UIKit's Auto Layout API with a fluent, declarative interface. It provides extensions on both `UIView` and `UILayoutGuide` through the `Constrainable` protocol, keeping layout code readable and close to natural language.

## Requirements

- iOS 14+
- Swift 5.10+

## Installation

### Swift Package Manager

Add the dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/eshwavin/ConstraintKit.git", from: "1.0.0")
]
```

Or add it in Xcode via **File → Add Package Dependencies** and enter the repository URL.

## Setup

Call `preparedForAutoLayout()` on a view before adding any constraints to it. This sets `translatesAutoresizingMaskIntoConstraints` to `false` and returns `self` for chaining.

```swift
let childView = UIView().preparedForAutoLayout()
parentView.addSubview(childView)
```

> ConstraintKit does **not** call `preparedForAutoLayout()` on your behalf, so you keep full control over which views participate in Auto Layout.

## Usage

### Pinning to a superview (default target)

When no target is provided, methods fall back to the receiver's superview. A `fatalError` is raised if the view has no superview at call time.

```swift
childView.pinTop(withSpacing: 8)
childView.pinLeading(withSpacing: 16)
childView.pinTrailing(withSpacing: -16)
childView.pinBottom(withSpacing: -8)
```

### Pinning to an explicit target

```swift
childView.pinLeading(to: containerView, withSpacing: 16)
childView.pinTop(to: containerView, withSpacing: 8)
```

### Pinning all edges at once

`withInset` always treats a positive value as inward — trailing and bottom constants are negated internally.

```swift
// Pin flush to superview
childView.pinAllEdges()

// Pin with a uniform inset
childView.pinAllEdges(to: containerView, withInset: 16)

// Pin to the safe area with a uniform inset
childView.pinAllEdgesSafely(to: containerView, withInset: 16)
```

### Pinning multiple edges with individual spacing

```swift
childView.pin(edges: .top(spacing: 8), .leading(spacing: 16), .trailing(spacing: -16), .bottom(spacing: -8), to: containerView)
```

### Safe area pinning

```swift
childView.pinTopToSafeArea(of: containerView, withSpacing: 8)
childView.pinBottomToSafeArea(of: containerView, withSpacing: -8)
childView.pinLeadingToSafeArea(of: containerView, withSpacing: 16)
childView.pinTrailingToSafeArea(of: containerView, withSpacing: -16)

// Or pin multiple safe-area edges at once
childView.pin(safeAreaEdges: .safeAreaTop(spacing: 8), .safeAreaLeading(spacing: 16), to: containerView)
```

### Cross-edge pinning

Use `withSpacing` for a raw Auto Layout constant, or `withInset` where a positive value always means a gap.

```swift
// Place B directly below A with a gap
viewB.pinTopToBottom(of: viewA, withInset: 8)

// Place B to the right of A with a gap
viewB.pinLeadingToTrailing(of: viewA, withInset: 8)

// Place B above A with a gap
viewB.pinBottomToTop(of: viewA, withInset: 8)

// Place B to the left of A with a gap
viewB.pinTrailingToLeading(of: viewA, withInset: 8)
```

### Inequality constraints

```swift
childView.pin(edges: .greaterThanTop(spacing: 8), .lessThanBottom(spacing: -8), to: containerView)
```

### Centering

```swift
// Center in superview
someView.centerX()
someView.centerY()
someView.center()

// Center relative to another view
someView.center(to: otherView)

// Center with an offset
someView.center(to: otherView, withOffset: Offset(x: 10, y: -5))
```

### Dimensions

```swift
someView.constrainWidth(equalToConstant: 100)
someView.constrainHeight(equalToConstant: 50)

someView.constrainWidth(greaterThanEqualToConstant: 80)
someView.constrainHeight(lessThanEqualToConstant: 120)

someView.constrainWidth(toConstrainable: otherView, multiplier: 0.5)
someView.constrainWidthToSuperview(multiplier: 0.8)

someView.setAspectRatio(to: 16 / 9)
```

### Accessing returned constraints

Every `pin` method returns the activated `NSLayoutConstraint` or a `[String: NSLayoutConstraint]` dictionary. Use `Edge.Keys` or `SafeAreaEdge.Keys` to look up values without constructing an enum case.

```swift
let constraints = childView.pin(edges: .top(spacing: 8), .leading(spacing: 16), to: containerView)

let topConstraint = constraints[Edge.Keys.top]
let leadingConstraint = constraints[Edge.Keys.leading]
```

```swift
let safeConstraints = childView.pin(safeAreaEdges: .safeAreaTop(spacing: 8), to: containerView)

let topConstraint = safeConstraints[SafeAreaEdge.Keys.safeAreaTop]
```

```swift
let centerConstraints = someView.center(to: containerView)

let centerXConstraint = centerConstraints[CenterConstraintKeys.centerX]
```

### UIView and UILayoutGuide share the same API

`UILayoutGuide` conforms to `Constrainable` and supports all non-safe-area methods.

```swift
someView.pin(edges: .top(spacing: 0), .bottom(spacing: -8), to: containerView)
someLayoutGuide.pin(edges: .top(spacing: 0), .bottom(spacing: -8), to: containerView)
```

### Adding views and layout guides uniformly

```swift
containerView.addConstrainable(someView)
containerView.addConstrainable(someLayoutGuide)
```

## Protocols

| Protocol | Conformers | Description |
|---|---|---|
| `Constrainable` | `UIView`, `UILayoutGuide` | Exposes layout anchors and a fallback `container` view |
| `SafeAreaConstrainable` | `UIView` | Extends `Constrainable` with `safeAreaLayoutGuide` |

## License

This project is licensed under the MIT License. See the LICENSE file for more information.

## Contribution

Contributions are welcome! Feel free to open issues or submit pull requests for enhancements, bug fixes, or documentation improvements.
