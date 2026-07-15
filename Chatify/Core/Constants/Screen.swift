//
//  Screen.swift
//  Chatify
//
//  Created by AVINASH on 14/07/26.
//

import UIKit

enum Screen {

    static var width: CGFloat {
        UIScreen.main.bounds.width
    }

    static var height: CGFloat {
        UIScreen.main.bounds.height
    }

    static var shortestSide: CGFloat {
        min(width, height)
    }
}
