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

  // MARK: - Comparable

    func test_comparable() {
      let sut = Money(amount: 1.23, currency: "EUR")

      XCTAssertLessThan(sut, Money(amount: 99.00, currency: "EUR"))
      XCTAssertGreaterThan(sut, Money(amount: 1.00, currency: "EUR"))
    }

  // MARK: - Equatable

  func test_equal() {
    let sut = Money(amount: 0.99, currency: "EUR")

    XCTAssertEqual(sut, Money(amount: 0.99, currency: "EUR"))
  }

  func test_not_equal() {
    let sut = Money(amount: 0.99, currency: "EUR")

    XCTAssertNotEqual(sut, Money(amount: 1.00, currency: "EUR"))
  }

  // MARK: - Codable

  func test_decodable() throws {
    let json = """
        "10000.00 USD"
      """

    let sut: Money = try decode(json)

    XCTAssertEqual(sut.amount, 10_000)
    XCTAssertEqual(sut.currency, "USD")
  }

  func test_encodable() throws {
    let money = Money(amount: 20_000, currency: "EUR")

    let sut = try encode(money)

    XCTAssertEqual(sut, "\"20000 EUR\"")
  }

  // MARK: - Helpers

  private func decode<T: Decodable>(_ string: String) throws -> T {
    let data = string.data(using: .utf8)!
    let decoder = JSONDecoder()

    return try decoder.decode(T.self, from: data)
  }

  private func encode<T: Encodable>(_ value: T) throws -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]

    let data = try encoder.encode(value)

    return String(data: data, encoding: .utf8) ?? ""
  }

}
