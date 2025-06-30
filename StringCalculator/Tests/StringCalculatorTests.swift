//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Hardi Patel on 30/06/25.
//

import XCTest
@testable import StringCalculator

final class StringCalculatorTests: XCTestCase {

    var calculator: StringCalculator!

    override func setUp() {
        super.setUp()
        calculator = StringCalculator()
    }

    func testEmptyStringReturnsZero() throws {
        XCTAssertEqual(try calculator.add(""), 0)
    }

    func testSingleNumberReturnsItself() throws {
        XCTAssertEqual(try calculator.add("5"), 5)
    }

    func testTwoNumbersReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1,2"), 3)
    }

    func testNewlineAsDelimiter() throws {
        XCTAssertEqual(try calculator.add("1\n2,3"), 6)
    }

    func testCustomDelimiter() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2"), 3)
    }

    func testNegativeNumberThrowsError() {
        XCTAssertThrowsError(try calculator.add("1,-2")) { error in
            XCTAssertEqual(error.localizedDescription, "negative numbers not allowed: -2")
        }
    }

    func testMultipleNegativeNumbersThrowAll() {
        XCTAssertThrowsError(try calculator.add("1,-2,-3")) { error in
            XCTAssertEqual(error.localizedDescription, "negative numbers not allowed: -2,-3")
        }
    }

    func testInvalidDelimiterFormatThrows() {
        XCTAssertThrowsError(try calculator.add("//")) { error in
            XCTAssertEqual(error.localizedDescription, "invalid delimiter format: expected format is //delimiter\\n numbers")
        }
    }
}
