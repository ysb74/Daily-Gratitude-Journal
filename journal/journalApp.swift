//
//  journalApp.swift
//  journal
//
//  Created by Yogesh Singh Bisht on 22/06/25.
//

import SwiftUI

@main
struct journalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
