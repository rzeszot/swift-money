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

