import XCTest
@testable import ConstraintKit

final class CrossEdgeTests: XCTestCase {

    var parent: UIView!
    var child: UIView!
    var sibling: UIView!

    override func setUp() {
        super.setUp()
        parent = UIView()
        child = UIView()
        sibling = UIView()
        parent.addSubview(child)
        parent.addSubview(sibling)
        child.prepareForAutoLayout()
    }

    // MARK: - Leading to Trailing

    func testPinLeadingToTrailingWithSpacing() {
        let constraint = child.pinLeadingToTrailing(of: sibling, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
    }

    func testPinLeadingToTrailingWithInset() {
        let constraint = child.pinLeadingToTrailing(of: sibling, withInset: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
    }

    // MARK: - Trailing to Leading

    func testPinTrailingToLeadingWithSpacing() {
        let constraint = child.pinTrailingToLeading(of: sibling, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.secondAttribute, .leading)
    }

    func testPinTrailingToLeadingWithInsetNegatesConstant() {
        let constraint = child.pinTrailingToLeading(of: sibling, withInset: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.secondAttribute, .leading)
    }

    // MARK: - Left to Right

    func testPinLeftToRightWithSpacing() {
        let constraint = child.pinLeftToRight(of: sibling, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .left)
        XCTAssertEqual(constraint.secondAttribute, .right)
    }

    func testPinLeftToRightWithInset() {
        let constraint = child.pinLeftToRight(of: sibling, withInset: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .left)
        XCTAssertEqual(constraint.secondAttribute, .right)
    }

    // MARK: - Right to Left

    func testPinRightToLeftWithSpacing() {
        let constraint = child.pinRightToLeft(of: sibling, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .right)
        XCTAssertEqual(constraint.secondAttribute, .left)
    }

    func testPinRightToLeftWithInsetNegatesConstant() {
        let constraint = child.pinRightToLeft(of: sibling, withInset: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.firstAttribute, .right)
        XCTAssertEqual(constraint.secondAttribute, .left)
    }

    // MARK: - Top to Bottom

    func testPinTopToBottomWithSpacing() {
        let constraint = child.pinTopToBottom(of: sibling, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
    }

    func testPinTopToBottomWithInset() {
        let constraint = child.pinTopToBottom(of: sibling, withInset: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
    }

    // MARK: - Bottom to Top

    func testPinBottomToTopWithSpacing() {
        let constraint = child.pinBottomToTop(of: sibling, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.secondAttribute, .top)
    }

    func testPinBottomToTopWithInsetNegatesConstant() {
        let constraint = child.pinBottomToTop(of: sibling, withInset: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.secondAttribute, .top)
    }

    // MARK: - Leading to CenterX

    func testPinLeadingToCenterX() {
        let constraint = child.pinLeadingToCenterX(of: sibling, withOffset: 10)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 10)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.secondAttribute, .centerX)
    }

    // MARK: - Trailing to CenterX

    func testPinTrailingToCenterX() {
        let constraint = child.pinTrailingToCenterX(of: sibling, withOffset: 10)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 10)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.secondAttribute, .centerX)
    }

    // MARK: - Top to CenterY

    func testPinTopToCenterY() {
        let constraint = child.pinTopToCenterY(of: sibling, withOffset: 10)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 10)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.secondAttribute, .centerY)
    }

    // MARK: - Bottom to CenterY

    func testPinBottomToCenterY() {
        let constraint = child.pinBottomToCenterY(of: sibling, withOffset: 10)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 10)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.secondAttribute, .centerY)
    }

    // MARK: - UILayoutGuide

    func testLayoutGuideAsReceiverCrossEdge() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.pinLeadingToTrailing(of: sibling, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertTrue(constraint.firstItem === guide)
    }

    func testLayoutGuideAsTargetCrossEdge() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = child.pinLeadingToTrailing(of: guide, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertTrue(constraint.secondItem === guide)
    }
}
