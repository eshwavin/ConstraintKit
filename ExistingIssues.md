# Existing Issues

## ~~1. Silent `translatesAutoresizingMaskIntoConstraints = false` on all callers~~ ✅ Resolved

Removed `setTranslatesAutoresizingMaskIntoConstraintsToFalse()` from all pin methods. Added `prepareForAutoLayout() -> Self` on `UIView` in `UIView+AutoLayout.swift` for callers to opt in explicitly.

---

## ~~2. Inconsistent spacing sign convention for trailing and bottom edges~~ ✅ Resolved

Renamed `withSpacing` → `withInset` in `pinAllEdges` and `pinAllEdgesSafely` to make the positive-inward convention self-documenting and visually distinct from the individual helpers, which pass the value directly as the Auto Layout constant.

---

## ~~3. Force cast `as! SafeAreaConstrainable`~~ ✅ Resolved

Added a `getConstrainable(for:SafeAreaConstrainable?) -> SafeAreaConstrainable` overload in `Constrainable+Helpers.swift`. Swift resolves the correct overload at compile time, removing the need for the force cast entirely.

---

## ~~4. `fatalError` with poor diagnostic in `getConstrainable`~~ ✅ Resolved

Replaced the opaque message with an actionable one: explains that the view has no superview and tells the developer either to add it to a hierarchy first or pass an explicit target.

---

## ~~5. `pinBottomToTop` sign is counter-intuitive~~ ✅ Resolved

Added `withInset` overloads to all six cross-edge methods (`pinTopToBottom`, `pinBottomToTop`, `pinLeadingToTrailing`, `pinTrailingToLeading`, `pinLeftToRight`, `pinRightToLeft`). The `withInset` variants always treat positive as a gap, negating internally where needed. The original `withSpacing` variants remain for callers who want raw constant control.

---

## ~~6. Safe-area individual helpers accept `UIView?` instead of `SafeAreaConstrainable?`~~ ✅ Resolved

Changed the `of:` parameter type from `UIView?` to `SafeAreaConstrainable?` in `pinLeadingToSafeArea`, `pinTrailingToSafeArea`, `pinTopToSafeArea`, and `pinBottomToSafeArea`.

---

## ~~7. `center(to:)` does not support an offset~~ ✅ Resolved

Added `withOffset: Offset = .zero` parameter to `center(to:)`. Introduced a new `Offset` struct in `Offset.swift` (importing `CoreGraphics`) with `x`, `y`, and a `.zero` static.

---

## 8. No tests

**File:** `Tests/ConstraintKitTests/ConstraintKitTests.swift`

The test suite is completely empty. For a library whose sole purpose is producing correct `NSLayoutConstraint` values, there is no coverage of spacing math, sign conventions, the `fatalError` path, or the force cast.

---

## 9. No documentation on public API

All public functions lack doc comments. The sign convention for trailing/bottom `withSpacing` parameters, the behaviour of `withInset` vs `withSpacing`, the dictionary keys returned by pin methods, and the requirement to call `prepareForAutoLayout()` before pinning are all implicit. Each public function should have a doc comment covering parameters, return value, and any non-obvious behaviour.
