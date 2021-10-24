// swiftlint:disable identifier_name

import XCTest
import Money

final class MoneyCodableTests: XCTestCase {

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

  func test_encodable_float() throws {
    let money = Money(amount: 20_000.123, currency: "EUR")

    let sut = try encode(money)

    XCTAssertEqual(sut, "\"20000.123 EUR\"")
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
