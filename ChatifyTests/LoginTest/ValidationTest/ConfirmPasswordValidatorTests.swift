//
//  ConfirmPasswordValidatorTests.swift
//  ChatifyTests
//
//  Created by AVINASH on 19/07/26.
//

import XCTest
@testable import Chatify

final class ConfirmPasswordValidatorTests: XCTestCase {

    // MARK: - Properties

    private var sut: ConfirmPasswordValidator!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        sut = ConfirmPasswordValidator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Success

    func test_validate_whenPasswordsMatch_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate(
                password: "Password123",
                confirmPassword: "Password123"
            )
        )
    }

    // MARK: - Empty Confirm Password

    func test_validate_whenConfirmPasswordIsEmpty_shouldThrowEmptyConfirmPassword() {

        XCTAssertThrowsError(
            try sut.validate(
                password: "Password123",
                confirmPassword: ""
            )
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .emptyConfirmPassword
            )
        }
    }

    // MARK: - Password Mismatch

    func test_validate_whenPasswordsDoNotMatch_shouldThrowPasswordsDoNotMatch() {

        XCTAssertThrowsError(
            try sut.validate(
                password: "Password123",
                confirmPassword: "Password321"
            )
        ) { error in

            XCTAssertEqual(
                error as? ValidationError,
                .passwordsDoNotMatch
            )
        }
    }

    // MARK: - Leading & Trailing Spaces

    func test_validate_whenPasswordsContainLeadingTrailingSpaces_shouldNotThrow() {

        XCTAssertNoThrow(
            try sut.validate(
                password: " Password123 ",
                confirmPassword: "Password123"
            )
        )
    }
}
