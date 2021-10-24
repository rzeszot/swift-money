// swiftlint:disable identifier_name

import XCTest
import Money

final class MoneyTests: XCTestCase {

  func test_init() {
    let money = Money(amount: 12.34, currency: "EUR")

    XCTAssertEqual(money.amount, 12.34)
    XCTAssertEqual(money.currency, "EUR")
  }

  // MARK: -

  func test_compatible() {
    let a = Money(amount: 1.00, currency: "PLN")
    let b = Money(amount: 2.00, currency: "PLN")

    XCTAssertTrue(a.compatible(with: b))
  }

  func test_not_compatible() {
    let a = Money(amount: 3.00, currency: "PLN")
    let b = Money(amount: 4.00, currency: "EUR")

    XCTAssertFalse(a.compatible(with: b))
  }

  // MARK: - Rounding

  func test_rounding() {
    let sut = Money(amount: 12.345678, currency: "PLN").round(scale: 2, rounding: .down)

    XCTAssertEqual(sut.amount, 12.34)
  }

}
