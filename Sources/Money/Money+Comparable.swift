import Foundation

extension Money: Comparable {

  public static func < (lhs: Money, rhs: Money) -> Bool {
    precondition(lhs.compatible(with: rhs))

    return lhs.amount < rhs.amount
  }

}
