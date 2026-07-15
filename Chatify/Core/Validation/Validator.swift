//
//  Validator.swift
//  Chatify
//
//  Created by AVINASH on 15/07/26.
//


import Foundation

protocol Validator {
    associatedtype Value
    func validate(_ value: Value) throws
}
