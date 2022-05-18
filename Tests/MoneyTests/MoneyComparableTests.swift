// swiftlint:disable identifier_name

import Money
import XCTest

final class MoneyComparableTests: XCTestCase {
    func test_comparable() {
        let sut = Money(amount: 1.23, currency: "EUR")

        XCTAssertLessThan(sut, Money(amount: 99.00, currency: "EUR"))
        XCTAssertGreaterThan(sut, Money(amount: 1.00, currency: "EUR"))
    }
}
