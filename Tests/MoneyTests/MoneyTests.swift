import XCTest
import Money

class MoneyTests: XCTestCase {

  func test_init() {
    let money = Money(amount: 12.34, currency: "EUR")

    XCTAssertEqual(money.amount, 12.34)
    XCTAssertEqual(money.currency, "EUR")
  }

}

