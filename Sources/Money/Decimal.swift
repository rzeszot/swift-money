import Foundation

public extension Decimal {

  func round(scale: Int, rounding mode: RoundingMode = .bankers) -> Decimal {
    var (result, number) = (Decimal(), self)
    NSDecimalRound(&result, &number, scale, mode)
    return result
  }

  func add(_ rhs: Decimal, rounding mode: RoundingMode = .bankers) -> Decimal {
    var (result, lhs, rhs) = (Decimal(), self, rhs)
    NSDecimalAdd(&result, &lhs, &rhs, mode)
    return result
  }

  func subtract(_ rhs: Decimal, rounding mode: RoundingMode = .bankers) -> Decimal {
    var (result, lhs, rhs) = (Decimal(), self, rhs)
    NSDecimalSubtract(&result, &lhs, &rhs, mode)
    return result
  }

  func multiply(_ rhs: Decimal, rounding mode: RoundingMode = .bankers) -> Decimal {
    var (result, lhs, rhs) = (Decimal(), self, rhs)
    NSDecimalMultiply(&result, &lhs, &rhs, mode)
    return result
  }

  func divide(_ rhs: Decimal, rounding mode: RoundingMode = .bankers) -> Decimal {
    var (result, lhs, rhs) = (Decimal(), self, rhs)
    NSDecimalDivide(&result, &lhs, &rhs, mode)
    return result
  }

}
