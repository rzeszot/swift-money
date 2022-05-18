// swiftlint:disable identifier_name

import Money
import XCTest

final class MoneyEquatableTests: XCTestCase {
    func test_equal() {
        let sut = Money(amount: 0.99, currency: "EUR")

        XCTAssertEqual(sut, Money(amount: 0.99, currency: "EUR"))
    }

    func test_not_equal() {
        let sut = Money(amount: 0.99, currency: "EUR")

        XCTAssertNotEqual(sut, Money(amount: 1.00, currency: "EUR"))
    }
}
