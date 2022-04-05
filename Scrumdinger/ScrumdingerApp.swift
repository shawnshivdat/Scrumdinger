//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Shawn Shivdat on 2/15/22.
//

// COMMENT 1

import SwiftUI

@main
struct ScrumdingerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
