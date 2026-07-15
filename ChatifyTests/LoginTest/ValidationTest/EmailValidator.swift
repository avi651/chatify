//
//  EmailValidator.swift
//  ChatifyTests
//
//  Created by AVINASH on 15/07/26.
//

import Foundation

enum EmailValidator {
    
    static func isValid(_ email: String) -> Bool {
        let regex =
                #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        
        return NSPredicate(
            format: "SELF MATCHES %@",
            regex
        ).evaluate(with: email)
    }
}
