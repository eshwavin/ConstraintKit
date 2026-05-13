# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build
swift build

# Run tests
swift test

# Run a single test
swift test --filter ConstraintKitTests/<TestMethodName>
```

## Architecture

ConstraintKit is a Swift Package that wraps UIKit's Auto Layout API with a fluent, declarative interface. It targets UIKit only — there is no SwiftUI component.

### Protocol hierarchy

- `Constrainable` — the base protocol. Exposes all layout anchors (`leadingAnchor`, `topAnchor`, etc.) and a `container: UIView?` property (used as the fallback target when no explicit view is passed to a constraint method). `UIView` and `UILayoutGuide` both conform to this.
- `SafeAreaConstrainable: Constrainable` — adds `safeAreaLayoutGuide`. Only `UIView` conforms; `UILayoutGuide` does **not** and cannot use safe-area pinning methods.

### Edge enums

- `Edge` — standard constraints (exact, `greaterThan`, `lessThan` variants for top/bottom/leading/trailing/left/right).
- `SafeAreaEdge` — mirrors `Edge` but targets the `safeAreaLayoutGuide`. Both conform to `ConstrainableEdge`.
- `rawValue: String` on each case is the dictionary key returned by all `pin` methods.

### Extension files

All public API is implemented as extensions on `Constrainable` or `SafeAreaConstrainable`:

| File | Responsibility |
|---|---|
| `Constrainable+Edges.swift` | `pin(edges:)`, `pin(safeAreaEdges:)`, `pin(constrainableEdges:)`, `pinAllEdges()`, `pinAllEdgesSafely()` |
| `Constrainable+XAxisEdges.swift` | Individual X-axis pinning helpers |
| `Constrainable+YAxisEdges.swift` | Individual Y-axis pinning helpers |
| `Constrainable+Center.swift` | `centerX()`, `centerY()`, `center()` — returns dict keyed by `CenterConstraintKeys` |
| `Constrainable+Dimensions.swift` | `constrainHeight/Width` variants, `setAspectRatio()` |
| `Constrainable+Helpers.swift` | Internal helpers: `getConstrainable(for:)` (resolves nil → `container`), `setTranslatesAutoresizingMaskIntoConstraintsToFalse()` |

### Return values

Every `pin` / `constrain` method returns the activated `NSLayoutConstraint` or a `[String: NSLayoutConstraint]` dictionary keyed by `ConstrainableEdge.rawValue` (or `CenterConstraintKeys` for centering). Methods are `@discardableResult`.

### Spacing sign convention

`pinAllEdges` and `pinAllEdgesSafely` negate the spacing for trailing and bottom edges internally (`-spacing`), so callers always pass a positive inset value.

### `addConstrainable(_:)`

Convenience on `UIView` that accepts any `Constrainable` and calls `addSubview` or `addLayoutGuide` as appropriate, keeping call sites type-agnostic.
