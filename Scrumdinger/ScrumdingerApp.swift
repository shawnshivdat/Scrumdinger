//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Shawn Shivdat on 2/15/22.
//

// COMMENT 1

// COMMENT 2

import SwiftUI

@main
struct ScrumdingerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MeetingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
