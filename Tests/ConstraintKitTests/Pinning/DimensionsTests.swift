import XCTest
@testable import ConstraintKit

final class DimensionsTests: XCTestCase {

    var parent: UIView!
    var child: UIView!

    override func setUp() {
        super.setUp()
        parent = UIView()
        child = UIView()
        parent.addSubview(child)
        child.preparedForAutoLayout()
    }

    // MARK: - Height (constant)

    func testConstrainHeightEqualToConstant() {
        let constraint = child.constrainHeight(equalToConstant: 100)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .equal)
    }

    func testConstrainHeightGreaterThanEqualToConstant() {
        let constraint = child.constrainHeight(greaterThanEqualToConstant: 50)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 50)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
    }

    func testConstrainHeightLessThanEqualToConstant() {
        let constraint = child.constrainHeight(lessThanEqualToConstant: 200)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 200)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
    }

    // MARK: - Height (relative)

    func testConstrainHeightToConstrainable() {
        let constraint = child.constrainHeight(toConstrainable: parent)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    func testConstrainHeightToConstrainableWithMultiplier() {
        let constraint = child.constrainHeight(toConstrainable: parent, multiplier: 0.5)
        XCTAssertEqual(constraint.multiplier, 0.5, accuracy: 0.001)
    }

    func testConstrainHeightToSuperview() {
        let constraint = child.constrainHeightToSuperview()
        XCTAssertTrue(constraint.isActive)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    // MARK: - Width (constant)

    func testConstrainWidthEqualToConstant() {
        let constraint = child.constrainWidth(equalToConstant: 100)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .equal)
    }

    func testConstrainWidthGreaterThanEqualToConstant() {
        let constraint = child.constrainWidth(greaterThanEqualToConstant: 50)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 50)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
    }

    func testConstrainWidthLessThanEqualToConstant() {
        let constraint = child.constrainWidth(lessThanEqualToConstant: 200)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 200)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
    }

    // MARK: - Width (relative)

    func testConstrainWidthToConstrainable() {
        let constraint = child.constrainWidth(toConstrainable: parent)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.secondAttribute, .width)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    func testConstrainWidthToConstrainableWithMultiplier() {
        let constraint = child.constrainWidth(toConstrainable: parent, multiplier: 0.5)
        XCTAssertEqual(constraint.multiplier, 0.5, accuracy: 0.001)
    }

    func testConstrainWidthToSuperview() {
        let constraint = child.constrainWidthToSuperview()
        XCTAssertTrue(constraint.isActive)
        XCTAssertTrue(constraint.secondItem === parent)
    }

    // MARK: - Aspect Ratio

    func testSetAspectRatio() {
        let constraint = child.setAspectRatio(to: 16.0 / 9.0)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertEqual(constraint.multiplier, 16.0 / 9.0, accuracy: 0.001)
        XCTAssertTrue(constraint.firstItem === child)
        XCTAssertTrue(constraint.secondItem === child)
    }

    func testSetAspectRatioSquare() {
        let constraint = child.setAspectRatio(to: 1)
        XCTAssertEqual(constraint.multiplier, 1, accuracy: 0.001)
    }

    // MARK: - UILayoutGuide

    func testLayoutGuideConstrainHeight() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.constrainHeight(equalToConstant: 100)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertTrue(constraint.firstItem === guide)
    }

    func testLayoutGuideConstrainWidth() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.constrainWidth(equalToConstant: 200)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 200)
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertTrue(constraint.firstItem === guide)
    }

    func testLayoutGuideConstrainHeightToConstrainable() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraint = guide.constrainHeight(toConstrainable: parent)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.secondAttribute, .height)
        XCTAssertTrue(constraint.firstItem === guide)
        XCTAssertTrue(constraint.secondItem === parent)
    }
}
