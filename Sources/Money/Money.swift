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
