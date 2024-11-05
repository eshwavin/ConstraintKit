# ConstraintKit

ConstraintKit is a lightweight and flexible library designed to simplify adding Auto Layout constraints in UIKit with a declarative approach. By providing a set of extensions for UIView and UILayoutGuide, ConstraintKit streamlines the process of creating and managing constraints, making your layout code cleaner, more readable, and closer to natural language.  

## Features

- **Simplified Constraint Creation**: Easily create constraints for pinning edges of views to other views or safe area layouts.
- **Flexible Edge Support**: Support for both safe area edges and standard edges, with custom spacing.
- **Readable Code**: Enhances the readability of layout code by abstracting the complexity of NSLayoutConstraint.
- **Support for Leading, Trailing, Top, and Bottom Edges**: Easily pin views using common layout patterns.
- **Abstraction of UIView and UILayoutGuide**: Both UIView and UILayoutGuide are abstracted using the `Constrainable` protocol, allowing for a unified approach to managing constraints across different layout elements.


## Installation

To integrate ConstraintKit into your project using Swift Package Manager, add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/eshwavin/ConstraintKit.git", from: "0.2.0")
]
```

Alternatively, you can add it to your Xcode project:

1. Open your project in Xcode.
2. Select your project in the Project Navigator.
3. Navigate to the **Package Dependencies** tab.
4. Click the **"+"** button to add a new package.
5. Enter the repository URL: `https://github.com/yourusername/ConstraintKit.git`.
6. Select the version range you want to use and click **Add Package**.

## Usage

### Importing

Make sure to import ConstraintKit module in your files where you want to use it.

```swift
import ConstraintKit
```

### Important to Note

All the functions that add constraints return the activated constraints in the form of a `Dictionary`. The keys are the `rawValues` of the `Egde` or `SafeAreaEdge` and the values are the **activated** `NSLayoutConstraint`.

### Pinning Edges

```swift
let containerView = UIView()
let childView = UIView()

containerView.addSubview(childView)

// Pin childView to the leading edge of containerView
childView.pinLeading(to: containerView, withSpacing: 16)

// Pin childView to the top edge of containerView
childView.pinTop(to: containerView, withSpacing: 8)

// Pin childView to the bottom edge of containerView with safe area consideration
childView.pinBottomToSafeArea(of: containerView, withSpacing: 20)

```

### Adding Multiple Constraints Together

```swift
// Pin all edges to superview
childView.pinAllEdges()

// When the view to constrain to is not provided, it automatically defaults to the superview. 
childView.pinAllEdges(to: containerView)

// Pin all edges to the safe area of superview
childView.pinAllEdgesSafely()

// Pin multiple edges to superview
childView.pin(edges: .leading(spacing: 5), .trailing(spacing: 5))

```

### Centering 

``` swift

// center in X direction to superview
someView.centerX()
// center in Y direction to superview
someView.centerY()

// center in both X and Y direction to superview
otherView.center()

// center to some other view with offset
someView.center(to: otherView, withOffset: 10)

```

### Use the same function for UIViews and UILayoutGuides

```swift

someView.pin(edges: .top(spacing: 0), .bottom(spacing: 5))

someLayoutGuide.pin(edges: .top(spacing: 0), .bottom(spacing: 5))

```

### More advanced usage

```
// Pinning a view to the top and at least some distance from the leading of another view
someView.pin(edges: .top(spacing: 5), .greaterThanLeading(spacing: 5), to: otherView))

```

### Accessing the activated constraints

```
let constraints = someView.pin(egdes: .top(spacing: 5), .leading(spacing: 5))

let topConstraint = constraints[Edge.top.rawValue]

```

### You cannot use SafeAreaEdges for UILayoutGuides

Since a `UILayoutGuide` does not have a safe area layout, you cannot use the functions that are designed to constrain to `safeAreaLayout`


## Protocols

### Constrainable
This protocol provides the basic functionalities required for objects that can have constraints applied to them.

### SafeAreaConstrainable
This protocol extends the Constrainable protocol for objects that can reference their safe area layout guides.

### Edge and SafeAreaEdge
These enums represent the various edges that can be used when pinning views. 

## License

This project is licensed under the MIT License. See the LICENSE file for more information.

## Contribution

Contributions are welcome! Feel free to open issues, submit pull requests for enhancements and bug fixes, or improve documentation.
