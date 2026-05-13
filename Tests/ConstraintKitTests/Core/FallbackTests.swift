import XCTest
@testable import ConstraintKit

final class FallbackTests: XCTestCase {

    var parent: UIView!
    var child: UIView!

    override func setUp() {
        super.setUp()
        parent = UIView()
        child = UIView()
        parent.addSubview(child)
        child.prepareForAutoLayout()
    }

    func testFallsBackToSuperviewWhenNoTargetProvided() {
        let constraint = child.pinLeading(withSpacing: 0)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    func testUsesExplicitTargetOverSuperview() {
        let other = UIView()
        parent.addSubview(other)
        let constraint = child.pinLeading(to: other, withSpacing: 0)
        XCTAssertTrue(constraint.secondItem === other)
    }

    // MARK: - UILayoutGuide

    func testLayoutGuideFallsBackToOwningView() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.pinLeading(withSpacing: 0)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    func testLayoutGuideUsesExplicitTarget() {
        let guide = UILayoutGuide()
        let other = UIView()
        parent.addLayoutGuide(guide)
        parent.addSubview(other)
        let constraint = guide.pinLeading(to: other, withSpacing: 0)
        XCTAssertTrue(constraint.secondItem === other)
    }
}
