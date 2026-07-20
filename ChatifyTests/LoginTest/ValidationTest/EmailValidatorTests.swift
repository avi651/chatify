//
//  EmailValidatorTests.swift
//  ChatifyTests
//
//  Created by AVINASH on 18/07/26.
//

import XCTest
@testable import Chatify

final class EmailValidatorTests: XCTestCase {

    // MARK: - Properties

    private var sut: EmailValidator!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        sut = EmailValidator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success

    func test_validate_whenEmailIsValid_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("avinash@gmail.com")
        )
    }

    // MARK: - Empty Email

    func test_validate_whenEmailIsEmpty_shouldThrowEmptyEmail() {

        XCTAssertThrowsError(
            try sut.validate("")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .emptyEmail
            )
        }
    }

    // MARK: - Whitespaces Only

    func test_validate_whenEmailContainsOnlyWhitespaces_shouldThrowEmptyEmail() {

        XCTAssertThrowsError(
            try sut.validate("     ")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .emptyEmail
            )
        }
    }

    // MARK: - Invalid Email

    func test_validate_whenEmailIsInvalid_shouldThrowInvalidEmail() {

        XCTAssertThrowsError(
            try sut.validate("avinashgmail.com")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .invalidEmail
            )
        }
    }

    // MARK: - Missing Domain

    func test_validate_whenEmailHasNoDomain_shouldThrowInvalidEmail() {

        XCTAssertThrowsError(
            try sut.validate("avinash@")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .invalidEmail
            )
        }
    }

    // MARK: - Missing Username

    func test_validate_whenEmailHasNoUsername_shouldThrowInvalidEmail() {

        XCTAssertThrowsError(
            try sut.validate("@gmail.com")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .invalidEmail
            )
        }
    }

    // MARK: - Leading And Trailing Spaces

    func test_validate_whenEmailHasLeadingTrailingSpaces_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("  avinash@gmail.com  ")
        )
    }
}
