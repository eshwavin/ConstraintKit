import XCTest
@testable import ConstraintKit

final class SafeAreaTests: XCTestCase {

    var parent: UIView!
    var child: UIView!

    override func setUp() {
        super.setUp()
        parent = UIView()
        child = UIView()
        parent.addSubview(child)
        child.prepareForAutoLayout()
    }

    // MARK: - pinLeadingToSafeArea

    func testPinLeadingToSafeArea() {
        let constraint = child.pinLeadingToSafeArea(of: parent, withSpacing: 16)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 16)
        XCTAssertEqual(constraint.firstAttribute, .leading)
        XCTAssertEqual(constraint.secondAttribute, .leading)
        XCTAssertTrue(constraint.secondItem === parent.safeAreaLayoutGuide)
    }

    // MARK: - pinTrailingToSafeArea

    func testPinTrailingToSafeArea() {
        let constraint = child.pinTrailingToSafeArea(of: parent, withSpacing: -16)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -16)
        XCTAssertEqual(constraint.firstAttribute, .trailing)
        XCTAssertEqual(constraint.secondAttribute, .trailing)
        XCTAssertTrue(constraint.secondItem === parent.safeAreaLayoutGuide)
    }

    // MARK: - pinTopToSafeArea

    func testPinTopToSafeArea() {
        let constraint = child.pinTopToSafeArea(of: parent, withSpacing: 8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, 8)
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertTrue(constraint.secondItem === parent.safeAreaLayoutGuide)
    }

    // MARK: - pinBottomToSafeArea

    func testPinBottomToSafeArea() {
        let constraint = child.pinBottomToSafeArea(of: parent, withSpacing: -8)
        XCTAssertTrue(constraint.isActive)
        XCTAssertEqual(constraint.constant, -8)
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertTrue(constraint.secondItem === parent.safeAreaLayoutGuide)
    }

    // MARK: - pin(safeAreaEdges:)

    func testPinSafeAreaEdgesConstants() {
        let constraints = child.pin(safeAreaEdges: .safeAreaTop(spacing: 8), .safeAreaLeading(spacing: 16), to: parent)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.safeAreaTop]?.constant, 8)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.safeAreaLeading]?.constant, 16)
    }

    func testPinSafeAreaEdgesUseSafeAreaLayoutGuide() {
        let constraints = child.pin(safeAreaEdges: .safeAreaTop(spacing: 0), to: parent)
        XCTAssertTrue(constraints[SafeAreaEdge.Keys.safeAreaTop]?.secondItem === parent.safeAreaLayoutGuide)
    }

    func testPinSafeAreaEdgesRelations() {
        let constraints = child.pin(safeAreaEdges: .greaterThanSafeAreaTop(spacing: 8), .lessThanSafeAreaBottom(spacing: -8), to: parent)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.greaterThanSafeAreaTop]?.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.lessThanSafeAreaBottom]?.relation, .lessThanOrEqual)
    }

    // MARK: - pinAllEdgesSafely

    func testPinAllEdgesSafelyInsetNegatesTrailingAndBottom() {
        let constraints = child.pinAllEdgesSafely(to: parent, withInset: 16)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.safeAreaTop]?.constant, 16)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.safeAreaLeading]?.constant, 16)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.safeAreaTrailing]?.constant, -16)
        XCTAssertEqual(constraints[SafeAreaEdge.Keys.safeAreaBottom]?.constant, -16)
    }

    func testPinAllEdgesSafelyZeroInset() {
        let constraints = child.pinAllEdgesSafely(to: parent)
        XCTAssertTrue(constraints.values.allSatisfy { $0.constant == 0 })
    }

    func testPinAllEdgesSafelyAllActive() {
        let constraints = child.pinAllEdgesSafely(to: parent, withInset: 0)
        XCTAssertTrue(constraints.values.allSatisfy { $0.isActive })
    }
}
