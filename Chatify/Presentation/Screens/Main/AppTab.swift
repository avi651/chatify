//
//  AppTab.swift
//  Chatify
//
//  Created by AVINASH on 20/07/26.
//


import Foundation

enum AppTab: CaseIterable, Hashable {

    case chats
    case settings

    var title: String {

        switch self {

        case .chats:
            return "Chats"

        case .settings:
            return "Settings"
        }
    }

    var icon: String {

        switch self {

        case .chats:
            return "message"

        case .settings:
            return "gearshape"
        }
    }

    var selectedIcon: String {

        switch self {

        case .chats:
            return "message.fill"

        case .settings:
            return "gearshape.fill"
        }
    }
}
