import Currency
import Foundation

extension Money: Codable {
    public enum CodableError: Swift.Error {
        case invalidMoneyFormat
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        let parts = string.split(separator: " ")

        guard parts.count == 2 else { throw CodableError.invalidMoneyFormat }

        let amountString = String(parts[0])
        let currencyCodeString = String(parts[1])

        guard let amount = Decimal(string: amountString) else { throw CodableError.invalidMoneyFormat }

        self.amount = amount
        currency = Currency(code: currencyCodeString)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode("\(amount) \(String(currency))")
    }
}
