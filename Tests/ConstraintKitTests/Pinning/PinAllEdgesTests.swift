import XCTest
@testable import ConstraintKit

final class PinAllEdgesTests: XCTestCase {

    var parent: UIView!
    var child: UIView!

    override func setUp() {
        super.setUp()
        parent = UIView()
        child = UIView()
        parent.addSubview(child)
        child.prepareForAutoLayout()
    }

    // MARK: - pinAllEdges

    func testPinAllEdgesInsetNegatesTrailingAndBottom() {
        let constraints = child.pinAllEdges(to: parent, withInset: 16)
        XCTAssertEqual(constraints[Edge.Keys.top]?.constant, 16)
        XCTAssertEqual(constraints[Edge.Keys.leading]?.constant, 16)
        XCTAssertEqual(constraints[Edge.Keys.trailing]?.constant, -16)
        XCTAssertEqual(constraints[Edge.Keys.bottom]?.constant, -16)
    }

    func testPinAllEdgesZeroInset() {
        let constraints = child.pinAllEdges(to: parent)
        XCTAssertTrue(constraints.values.allSatisfy { $0.constant == 0 })
    }

    func testPinAllEdgesAllActive() {
        let constraints = child.pinAllEdges(to: parent, withInset: 0)
        XCTAssertTrue(constraints.values.allSatisfy { $0.isActive })
    }

    func testPinAllEdgesUsesSuperview() {
        let constraints = child.pinAllEdges()
        XCTAssertTrue(constraints.values.allSatisfy { $0.secondItem === parent })
    }

    // MARK: - pin(edges:)

    func testPinEdgesConstants() {
        let constraints = child.pin(edges: .top(spacing: 8), .leading(spacing: 16), .trailing(spacing: -16), .bottom(spacing: -8), to: parent)
        XCTAssertEqual(constraints[Edge.Keys.top]?.constant, 8)
        XCTAssertEqual(constraints[Edge.Keys.leading]?.constant, 16)
        XCTAssertEqual(constraints[Edge.Keys.trailing]?.constant, -16)
        XCTAssertEqual(constraints[Edge.Keys.bottom]?.constant, -8)
    }

    func testPinEdgesGreaterThanRelation() {
        let constraints = child.pin(edges: .greaterThanTop(spacing: 8), .greaterThanLeading(spacing: 16), to: parent)
        XCTAssertEqual(constraints[Edge.Keys.greaterThanTop]?.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraints[Edge.Keys.greaterThanLeading]?.relation, .greaterThanOrEqual)
    }

    func testPinEdgesLessThanRelation() {
        let constraints = child.pin(edges: .lessThanBottom(spacing: -8), .lessThanTrailing(spacing: -16), to: parent)
        XCTAssertEqual(constraints[Edge.Keys.lessThanBottom]?.relation, .lessThanOrEqual)
        XCTAssertEqual(constraints[Edge.Keys.lessThanTrailing]?.relation, .lessThanOrEqual)
    }

    func testPinEdgesAllActive() {
        let constraints = child.pin(edges: .top(spacing: 0), .leading(spacing: 0), .trailing(spacing: 0), .bottom(spacing: 0), to: parent)
        XCTAssertTrue(constraints.values.allSatisfy { $0.isActive })
    }

    // MARK: - UILayoutGuide

    func testLayoutGuidePinAllEdges() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraints = guide.pinAllEdges(to: parent, withInset: 16)
        XCTAssertEqual(constraints[Edge.Keys.top]?.constant, 16)
        XCTAssertEqual(constraints[Edge.Keys.leading]?.constant, 16)
        XCTAssertEqual(constraints[Edge.Keys.trailing]?.constant, -16)
        XCTAssertEqual(constraints[Edge.Keys.bottom]?.constant, -16)
        XCTAssertTrue(constraints.values.allSatisfy { $0.isActive })
    }

    func testLayoutGuidePinEdges() {
        let guide = UILayoutGuide()
        parent.addLayoutGuide(guide)
        let constraints = guide.pin(edges: .top(spacing: 8), .leading(spacing: 16), to: parent)
        XCTAssertEqual(constraints[Edge.Keys.top]?.constant, 8)
        XCTAssertEqual(constraints[Edge.Keys.leading]?.constant, 16)
        XCTAssertTrue(constraints.values.allSatisfy { $0.isActive })
    }
}
