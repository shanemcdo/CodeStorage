//
//  CodeStorageApp.swift
//  CodeStorage
//
//  Created by Shane McDonough on 7/23/25.
//

import SwiftUI
import SwiftData

@main
struct CodeStorageApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Code.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
