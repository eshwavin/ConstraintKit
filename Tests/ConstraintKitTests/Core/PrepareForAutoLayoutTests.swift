import XCTest
@testable import ConstraintKit

final class PrepareForAutoLayoutTests: XCTestCase {

    func testSetsTranslatesAutoresizingMaskIntoConstraintsToFalse() {
        let view = UIView()
        view.preparedForAutoLayout()
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
    }

    func testReturnsSelf() {
        let view = UIView()
        let result = view.preparedForAutoLayout()
        XCTAssertTrue(result === view)
    }
}
