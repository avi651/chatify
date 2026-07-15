//
//  OTPValidator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//

import Foundation

enum OTPValidator {

    static func validate(_ otp: String) throws {

        guard !otp.isEmpty else {
            throw ValidationError.emptyOTP
        }

        let regex = #"^[0-9]{6}$"#

        let isValid = NSPredicate(
            format: "SELF MATCHES %@",
            regex
        ).evaluate(with: otp)

        guard isValid else {
            throw ValidationError.invalidOTP
        }
    }
}
