import Foundation

public extension Money {
    enum MathError: Error {
        case currencyMismatch
    }

    // MARK: - Add

    func add(_ money: Money) throws -> Money {
        guard compatible(with: money) else { throw MathError.currencyMismatch }

        return Money(amount: amount + money.amount, currency: currency)
    }

    static func + (lhs: Money, rhs: Money) -> Money {
        try! lhs.add(rhs)
    }

    // MARK: - Subtract

    func subtract(_ money: Money) throws -> Money {
        guard compatible(with: money) else { throw MathError.currencyMismatch }

        return Money(amount: amount - money.amount, currency: currency)
    }

    static func - (lhs: Money, rhs: Money) -> Money {
        try! lhs.subtract(rhs)
    }

    // MARK: - Multiply

    func multiply(_ multiplier: Decimal) -> Money {
        return Money(amount: amount * multiplier, currency: currency)
    }

    func multiply(_ multiplier: Int) -> Money {
        multiply(Decimal(multiplier))
    }

    static func * (lhs: Money, rhs: Decimal) -> Money {
        lhs.multiply(rhs)
    }

    static func * (lhs: Money, rhs: Int) -> Money {
        lhs.multiply(rhs)
    }
}
