import XCTest
@testable import ConstraintKit

final class PrepareForAutoLayoutTests: XCTestCase {

    func testSetsTranslatesAutoresizingMaskIntoConstraintsToFalse() {
        let view = UIView()
        view.prepareForAutoLayout()
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
    }

    func testReturnsSelf() {
        let view = UIView()
        let result = view.prepareForAutoLayout()
        XCTAssertTrue(result === view)
    }
}
