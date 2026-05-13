# Existing Issues

## ~~1. Silent `translatesAutoresizingMaskIntoConstraints = false` on all callers~~ ✅ Resolved

Removed `setTranslatesAutoresizingMaskIntoConstraintsToFalse()` from all pin methods. Added `prepareForAutoLayout() -> Self` on `UIView` in `UIView+AutoLayout.swift` for callers to opt in explicitly.

---

## ~~2. Inconsistent spacing sign convention for trailing and bottom edges~~ ✅ Resolved

Renamed `withSpacing` → `withInset` in `pinAllEdges` and `pinAllEdgesSafely` to make the positive-inward convention self-documenting and visually distinct from the individual helpers, which pass the value directly as the Auto Layout constant.

---

## 3. Force cast `as! SafeAreaConstrainable` 

**File:** `Sources/ConstraintKit/Constrainable+Edges.swift:48`

```swift
let constraintToConstrainable: SafeAreaConstrainable = getConstrainable(for: safeAreaConstrainable) as! SafeAreaConstrainable
```

`getConstrainable` returns `Constrainable`. If `safeAreaConstrainable` is `nil` and the receiver's `container` is any type that conforms to `Constrainable` but not `SafeAreaConstrainable`, this crashes at runtime. The type system should enforce this at compile time.

---

## 4. `fatalError` with poor diagnostic in `getConstrainable`

**File:** `Sources/ConstraintKit/Constrainable+Helpers.swift:32`

```swift
fatalError("Both targetConstrainable and container are nil")
```

Crashes with no indication of which view or call site caused the problem. A view not yet added to a hierarchy is a common setup state, and hitting this gives no actionable debugging context.

---

## 5. `pinBottomToTop` sign is counter-intuitive

**File:** `Sources/ConstraintKit/Constrainable+YAxisEdges.swift:51`

`pinTopToBottom(of:withSpacing:8)` produces a gap (intuitive). `pinBottomToTop(of:withSpacing:8)` causes the view to overlap the target by 8pt (counter-intuitive). Both parameters are named `withSpacing`, implying identical behaviour.

---

## 6. No tests

**File:** `Tests/ConstraintKitTests/ConstraintKitTests.swift`

The test suite is completely empty. For a library whose sole purpose is producing correct `NSLayoutConstraint` values, there is no coverage of spacing math, sign conventions, the `fatalError` path, or the force cast.

---

## 7. Safe-area individual helpers accept `UIView?` instead of `SafeAreaConstrainable?`

**Files:** `Sources/ConstraintKit/Constrainable+XAxisEdges.swift:14`, `Constrainable+YAxisEdges.swift:13`

`pinLeadingToSafeArea(of:)`, `pinTopToSafeArea(of:)`, and similar methods take `UIView?` rather than `SafeAreaConstrainable?`. This excludes custom types that conform to `SafeAreaConstrainable` and contradicts the abstraction the protocol hierarchy provides.

---

## 8. `center(to:)` does not support an offset

**File:** `Sources/ConstraintKit/Constrainable+Center.swift:41`

`centerX(to:withOffset:)` and `centerY(to:withOffset:)` both accept an offset, but `center(to:)` does not. Centering with an offset requires two separate calls, making the combined method less useful than its parts.

---

## 9. No documentation on public API

All public functions lack doc comments. The sign convention for trailing/bottom `withSpacing` parameters, the behaviour of `withInset` vs `withSpacing`, the dictionary keys returned by pin methods, and the requirement to call `prepareForAutoLayout()` before pinning are all implicit. Each public function should have a doc comment covering parameters, return value, and any non-obvious behaviour.
