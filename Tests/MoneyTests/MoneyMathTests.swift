// swiftlint:disable identifier_name

import XCTest
import Money

final class MoneyMathTests: XCTestCase {

  // MARK: - Add

  func test_add_function() throws {
    let a = Money(amount: 1.99, currency: "ADD")
    let b = Money(amount: 2.99, currency: "ADD")

    let sut = try a.add(b)

    XCTAssertEqual(sut, Money(amount: 4.98, currency: "ADD"))
  }

  func test_add_exception() throws {
    let a = Money(amount: 1.99, currency: .eur)
    let b = Money(amount: 2.99, currency: .usd)

    XCTAssertThrowsError(try a.add(b)) { error in
      XCTAssertEqual(error as? Money.MathError, Money.MathError.currencyMismatch)
    }
  }

  func test_add_operator() {
    let a = Money(amount: 0.1, currency: "OPE")
    let b = Money(amount: 0.2, currency: "OPE")

    let result = a + b

    XCTAssertEqual(result, Money(amount: 0.3, currency: "OPE"))
  }

  // MARK: - Subtract

  func test_subtract_function() throws {
    let a = Money(amount: 1.99, currency: .eur)
    let b = Money(amount: 2.99, currency: .eur)

    let result = try a.subtract(b)

    XCTAssertEqual(result, Money(amount: -1, currency: .eur))
  }

  func test_subtract_exception() throws {
    let a = Money(amount: 1.99, currency: .eur)
    let b = Money(amount: 2.99, currency: .usd)

    XCTAssertThrowsError(try a.subtract(b)) { error in
      XCTAssertEqual(error as? Money.MathError, Money.MathError.currencyMismatch)
    }
  }

  func test_subtract_operator() {
    let a = Money(amount: 0.1, currency: .eur)
    let b = Money(amount: 0.2, currency: .eur)

    let result = a - b

    XCTAssertEqual(result, Money(amount: -0.1, currency: .eur))
  }

  // MARK: - Multiply

  func test_multiply_function() throws {
    let a: Money = Money(amount: 1.99, currency: .eur)
    let result = a.multiply(5)

    XCTAssertEqual(result, Money(amount: 9.95, currency: .eur))
  }

  func test_multiply_operator() {
    let a = Money(amount: 0.1, currency: .eur)
    let result = a * 5

    XCTAssertEqual(result, Money(amount: 0.5, currency: .eur))
  }

}
