//
//  PasswordValidatorTests.swift
//  ChatifyTests
//
//  Created by AVINASH on 19/07/26.
//

import XCTest
@testable import Chatify

final class PasswordValidatorTests: XCTestCase {

    // MARK: - Properties

    private var sut: PasswordValidator!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        sut = PasswordValidator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success

    func test_validate_whenPasswordIsValid_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("Password123")
        )
    }

    // MARK: - Empty Password

    func test_validate_whenPasswordIsEmpty_shouldThrowEmptyPassword() {

        XCTAssertThrowsError(
            try sut.validate("")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .emptyPassword
            )
        }
    }

    // MARK: - Whitespaces Only

    func test_validate_whenPasswordContainsOnlyWhitespaces_shouldThrowEmptyPassword() {

        XCTAssertThrowsError(
            try sut.validate("        ")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .emptyPassword
            )
        }
    }

    // MARK: - Weak Password

    func test_validate_whenPasswordIsLessThanEightCharacters_shouldThrowWeakPassword() {

        XCTAssertThrowsError(
            try sut.validate("Pass12")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .weakPassword
            )
        }
    }

    // MARK: - Minimum Length

    func test_validate_whenPasswordHasExactlyEightCharacters_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("Pass1234")
        )
    }

    // MARK: - Leading & Trailing Spaces

    func test_validate_whenPasswordHasLeadingTrailingSpaces_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("  Password123  ")
        )
    }
}
