# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build
swift build

# Run all tests (requires iOS simulator — run from Xcode or xcodebuild)
swift test

# Run a single test class
swift test --filter ConstraintKitTests/<TestClassName>
```

## Architecture

ConstraintKit is a Swift Package (iOS 14+) that wraps UIKit's Auto Layout API with a fluent, declarative interface. UIKit only — no SwiftUI component.

### Protocol hierarchy

- `Constrainable` — the base protocol. Exposes all layout anchors and a `container: UIView?` property used as the fallback target when no explicit view is passed. `UIView` and `UILayoutGuide` both conform.
- `SafeAreaConstrainable: Constrainable` — adds `safeAreaLayoutGuide`. Only `UIView` conforms; `UILayoutGuide` cannot use safe-area methods.

### Source folder structure

```
Sources/ConstraintKit/
  Core/       — Protocols, types, and extensions on standard library types
  Pinning/    — All public constraint-building extensions on Constrainable
  Internal/   — Internal helpers (not public API)
  UIKit/      — UIView and UILayoutGuide conformances
```

| File | Responsibility |
|---|---|
| `Core/Constrainable.swift` | `Constrainable` protocol |
| `Core/SafeAreaConstrainable.swift` | `SafeAreaConstrainable` protocol |
| `Core/ConstrainableEdge.swift` | `Edge`, `SafeAreaEdge` enums with nested `Keys` |
| `Core/Offset.swift` | `Offset` struct (x/y, `.zero`) used by centering methods |
| `Core/Constants.swift` | `CenterConstraintKeys` |
| `Core/Dictionary+Constraints.swift` | `asConstraintsArray` on `[String: NSLayoutConstraint]` |
| `Internal/Constrainable+Helpers.swift` | `getConstrainable(for:)`, internal `pinEdge` helpers |
| `Pinning/Constrainable+Edges.swift` | `pin(edges:)`, `pin(safeAreaEdges:)`, `pin(constrainableEdges:)`, `pinAllEdges()`, `pinAllEdgesSafely()` |
| `Pinning/Constrainable+XAxisEdges.swift` | Individual X-axis pinning helpers |
| `Pinning/Constrainable+YAxisEdges.swift` | Individual Y-axis pinning helpers |
| `Pinning/Constrainable+Center.swift` | `centerX()`, `centerY()`, `center()` |
| `Pinning/Constrainable+Dimensions.swift` | `constrainHeight/Width` variants, `setAspectRatio()` |
| `UIKit/UIView+AutoLayout.swift` | `preparedForAutoLayout()` |
| `UIKit/UIView+Constrainable.swift` | `SafeAreaConstrainable` conformance, `addConstrainable(_:)` |
| `UIKit/UILayoutGuide+Constrainable.swift` | `Constrainable` conformance |

### Edge enums and dictionary keys

`Edge` and `SafeAreaEdge` each have a nested `public enum Keys` with static string constants. Use these to subscript constraint dictionaries without constructing an enum case:

```swift
let constraints = view.pinAllEdges(to: parent)
let top = constraints[Edge.Keys.top]
let safeTop = view.pin(safeAreaEdges: .safeAreaTop(spacing: 8))[SafeAreaEdge.Keys.safeAreaTop]
let cx = view.center(to: parent)[CenterConstraintKeys.centerX]
```

### Return values

Every `pin` / `constrain` / `center` method returns the `NSLayoutConstraint` or a `[String: NSLayoutConstraint]` dictionary. All methods are `@discardableResult`. Call `.asConstraintsArray` on a dictionary to get a flat `[NSLayoutConstraint]`.

### `shouldActivate` parameter

Every public method accepts `shouldActivate: Bool = true`. When `false`, the constraint is created but not activated — useful for setting up constraint groups to swap on trait changes.

### Spacing sign convention

- `pinAllEdges` / `pinAllEdgesSafely` use `withInset:` — positive value always insets inward; trailing and bottom are negated internally.
- Individual same-edge helpers (`pinLeading`, `pinTop`, etc.) use `withSpacing:` — passed through directly as the Auto Layout constant.
- Cross-edge helpers offer both `withSpacing:` (raw constant) and `withInset:` (positive = gap, negated internally where the direction requires it).

### `preparedForAutoLayout()`

Convenience on `UIView` that sets `translatesAutoresizingMaskIntoConstraints = false` and returns `self`. ConstraintKit never calls this automatically — callers opt in explicitly.

### `addConstrainable(_:)`

Convenience on `UIView` that accepts any `Constrainable` and calls `addSubview` or `addLayoutGuide` as appropriate.

### Test structure

Tests mirror the source folder layout under `Tests/ConstraintKitTests/`:

```
Core/     — PrepareForAutoLayoutTests, FallbackTests
Pinning/  — SameEdgeTests, CrossEdgeTests, SafeAreaTests, PinAllEdgesTests, CenterTests, DimensionsTests
```

Both `UIView` and `UILayoutGuide` flows are covered within each test file.
