import XCTest
@testable import ConstraintKit

final class SameEdgeTests: XCTestCase {

    var parent: UIView!
    var child: UIView!

    override func setUp() {
        super.setUp()
        parent = UIView()
        child = UIView()
        parent.addSubview(child)
        child.preparedForAutoLayout()
    }

    // MARK: - Leading

    func testPinLeading() {
        let constraint = child.pinLeading(to: parent, withSpacing: 16)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertTrue(constraint.firstItem === child)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    func testPinLeadingUsesSuperview() {
        let constraint = child.pinLeading(withSpacing: 8)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    // MARK: - Trailing

    func testPinTrailing() {
        let constraint = child.pinTrailing(to: parent, withSpacing: -16)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -16)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
    }

    // MARK: - Top

    func testPinTop() {
        let constraint = child.pinTop(to: parent, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.secondAttribute, .top)
    }

    // MARK: - Bottom

    func testPinBottom() {
        let constraint = child.pinBottom(to: parent, withSpacing: -8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
    }

    // MARK: - Left

    func testPinLeft() {
        let constraint = child.pinLeft(to: parent, withSpacing: 16)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.firstAttribute, .left)
        XCTAssertEqual(constraint.secondAttribute, .left)
    }

    // MARK: - Right

    func testPinRight() {
        let constraint = child.pinRight(to: parent, withSpacing: -16)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -16)
        XCTAssertEqual(constraint.firstAttribute, .right)
        XCTAssertEqual(constraint.secondAttribute, .right)
    }

    // MARK: - UILayoutGuide as receiver

    func testLayoutGuideAsReceiver() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.pinLeading(to: parent, withSpacing: 16)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertTrue(constraint.firstItem === guide)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    // MARK: - UILayoutGuide as target

    func testLayoutGuideAsTarget() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = child.pinLeading(to: guide, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertTrue(constraint.secondItem === guide)
    }
}
