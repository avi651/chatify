//
//  NameValidatorTests.swift
//  ChatifyTests
//
//  Created by AVINASH on 19/07/26.
//

import XCTest
@testable import Chatify

final class NameValidatorTests: XCTestCase {

    // MARK: - Properties

    private var sut: NameValidator!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        sut = NameValidator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success

    func test_validate_whenNameIsValid_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("Avinash")
        )
    }

    // MARK: - Empty Name

    func test_validate_whenNameIsEmpty_shouldThrowEmptyName() {

        XCTAssertThrowsError(
            try sut.validate("")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .emptyName
            )
        }
    }

    // MARK: - Whitespaces Only

    func test_validate_whenNameContainsOnlyWhitespaces_shouldThrowEmptyName() {

        XCTAssertThrowsError(
            try sut.validate("     ")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .emptyName
            )
        }
    }

    // MARK: - Invalid Name

    func test_validate_whenNameHasSingleCharacter_shouldThrowInvalidName() {

        XCTAssertThrowsError(
            try sut.validate("A")
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .invalidName
            )
        }
    }

    // MARK: - Minimum Length

    func test_validate_whenNameHasTwoCharacters_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("Ab")
        )
    }

    // MARK: - Leading & Trailing Spaces

    func test_validate_whenNameHasLeadingTrailingSpaces_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate("  Avinash  ")
        )
    }
}
