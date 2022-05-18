// swiftlint:disable identifier_name

import Money
import XCTest

final class DecimalTests: XCTestCase {
    func test_round() {
        let decimal: Decimal = 0.1234567

        let sut = decimal.round(scale: 4, rounding: .down)

        XCTAssertEqual(sut, 0.1234)
    }

    func test_add() {
        let a = Decimal(0.111111).round(scale: 6)
        let b = Decimal(0.222222).round(scale: 6)

        let sut = a.add(b, rounding: .down)

        XCTAssertEqual(sut, Decimal(0.333333).round(scale: 6))
    }

    func test_subtract() {
        let a = Decimal(0.333333).round(scale: 6)
        let b = Decimal(0.111111).round(scale: 6)

        let sut = a.subtract(b, rounding: .down)

        XCTAssertEqual(sut, Decimal(0.222222).round(scale: 6))
    }

    func test_multiply() {
        let a = Decimal(20)
        let b = Decimal(50)

        let sut = a.multiply(b)

        XCTAssertEqual(sut, 1000)
    }

    func test_divide() {
        let a = Decimal(500)
        let b = Decimal(10)

        let sut = a.divide(b)

        XCTAssertEqual(sut, 50)
    }
}
