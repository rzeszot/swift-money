import Foundation
import Currency

public struct Money {
  public let amount: Decimal
  public let currency: Currency

  public init(amount: Decimal, currency: Currency) {
    self.amount = amount
    self.currency = currency
  }

  // MARK: -

  public func compatible(with money: Money) -> Bool {
    currency == money.currency
  }

  // MARK: -

  public func round(scale: Int, rounding: Decimal.RoundingMode) -> Money {
    Money(amount: amount.round(scale: scale, rounding: rounding), currency: currency)
  }

}

extension Money: Equatable {
  public static func == (lhs: Money, rhs: Money) -> Bool {
    lhs.amount == rhs.amount
  }
}

extension Money: Comparable {
  public static func < (lhs: Money, rhs: Money) -> Bool {
    lhs.amount < rhs.amount
  }
}

extension Money: Codable {
  public enum Error: Swift.Error {
    case invalidMoneyFormat
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let string = try container.decode(String.self)
    let parts = string.split(separator: " ")

    guard parts.count == 2 else { throw Error.invalidMoneyFormat }

    let amountString = String(parts[0])
    let currencyCodeString = String(parts[1])

    guard let amount = Decimal(string: amountString) else { throw Error.invalidMoneyFormat }

    self.amount = amount
    self.currency = Currency(code: currencyCodeString)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode("\(amount) \(String(currency))")
  }
}
