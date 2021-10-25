import Foundation

extension Money {

  public enum MathError: Error {
    case currencyMismatch
  }

  // MARK: - Add

  public func add(_ money: Money) throws -> Money {
    guard compatible(with: money) else { throw MathError.currencyMismatch }

    return Money(amount: amount + money.amount, currency: currency)
  }

  public static func + (lhs: Money, rhs: Money) -> Money {
    try! lhs.add(rhs)
  }

  // MARK: - Subtract

  public func subtract(_ money: Money) throws -> Money {
    guard compatible(with: money) else { throw MathError.currencyMismatch }

    return Money(amount: amount - money.amount, currency: currency)
  }

  public static func - (lhs: Money, rhs: Money) -> Money {
    try! lhs.subtract(rhs)
  }

  // MARK: - Multiply

  public func multiply(_ multiplier: Decimal) -> Money {
    return Money(amount: amount * multiplier, currency: currency)
  }

  public func multiply(_ multiplier: Int) -> Money {
    multiply(Decimal(multiplier))
  }

  public static func * (lhs: Money, rhs: Decimal) -> Money {
    lhs.multiply(rhs)
  }

  public static func * (lhs: Money, rhs: Int) -> Money {
    lhs.multiply(rhs)
  }

}
