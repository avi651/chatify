//
//  View+Keyboard.swift
//  Chatify
//
//  Created by AVINASH on 17/07/26.
//

import SwiftUI

extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
           hideKeyboard()
        }
    }
    
    func hideKeyboard() {
        #if canImport(UIKit)
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
        #endif
    }
}
