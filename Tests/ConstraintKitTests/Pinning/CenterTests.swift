import XCTest
@testable import ConstraintKit

final class CenterTests: XCTestCase {

    var parent: UIView!
    var child: UIView!

    override func setUp() {
        super.setUp()
        parent = UIView()
        child = UIView()
        parent.addSubview(child)
        child.preparedForAutoLayout()
    }

    // MARK: - centerX

    func testCenterX() {
        let constraint = child.centerX(to: parent)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.firstAttribute, .centerX)
        XCTAssertEqual(constraint.secondAttribute, .centerX)
        XCTAssertTrue(constraint.firstItem === child)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    func testCenterXWithOffset() {
        let constraint = child.centerX(to: parent, withOffset: 10)
        XCTAssertEqual(constraint.constant, 10)
    }

    func testCenterXUsesSuperview() {
        let constraint = child.centerX()
        XCTAssertTrue(constraint.secondItem === parent)
    }

    // MARK: - centerY

    func testCenterY() {
        let constraint = child.centerY(to: parent)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertEqual(constraint.secondAttribute, .centerY)
    }

    func testCenterYWithOffset() {
        let constraint = child.centerY(to: parent, withOffset: 20)
        XCTAssertEqual(constraint.constant, 20)
    }

    // MARK: - center

    func testCenter() {
        let constraints = child.center(to: parent)
        XCTAssertEqual(constraints[CenterConstraintKeys.centerX]?.constant, 0)
        XCTAssertEqual(constraints[CenterConstraintKeys.centerY]?.constant, 0)
        XCTAssertTrue(constraints.values.allSatisfy { $0.isActive })
    }

    func testCenterWithOffset() {
        let constraints = child.center(to: parent, withOffset: Offset(x: 10, y: 20))
        XCTAssertEqual(constraints[CenterConstraintKeys.centerX]?.constant, 10)
        XCTAssertEqual(constraints[CenterConstraintKeys.centerY]?.constant, 20)
    }

    func testCenterWithZeroOffset() {
        let constraints = child.center(to: parent, withOffset: .zero)
        XCTAssertEqual(constraints[CenterConstraintKeys.centerX]?.constant, 0)
        XCTAssertEqual(constraints[CenterConstraintKeys.centerY]?.constant, 0)
    }

    // MARK: - UILayoutGuide

    func testLayoutGuideCenterX() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.centerX(to: parent)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstAttribute, .centerX)
        XCTAssertTrue(constraint.firstItem === guide)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    func testLayoutGuideCenterY() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.centerY(to: parent)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstAttribute, .centerY)
        XCTAssertTrue(constraint.firstItem === guide)
    }

    func testLayoutGuideCenter() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraints = guide.center(to: parent, withOffset: Offset(x: 5, y: 10))
        XCTAssertEqual(constraints[CenterConstraintKeys.centerX]?.constant, 5)
        XCTAssertEqual(constraints[CenterConstraintKeys.centerY]?.constant, 10)
        XCTAssertTrue(constraints.values.allSatisfy { $0.isActive })
    }
}
