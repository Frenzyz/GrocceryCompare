//
//  GrocceryCompareApp.swift
//  Shared
//
//  Created by Aadit Chetan on 3/25/22.
//

import SwiftUI

@main
struct GrocceryCompareApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
