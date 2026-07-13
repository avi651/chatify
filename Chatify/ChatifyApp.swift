//
//  ChatifyApp.swift
//  Chatify
//
//  Created by AVINASH on 13/07/26.
//

import SwiftUI
import CoreData

@main
struct ChatifyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
