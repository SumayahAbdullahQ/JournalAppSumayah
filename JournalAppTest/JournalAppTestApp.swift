//
//  JournalAppTestApp.swift
//  JournalAppTest
//
//  Created by Sumayah Alqahtani on 21/04/1446 AH.
//

import SwiftUI
import SwiftData // Import SwiftData

@main
struct JournalAppTestApp: App {
    
    // Register the model container for JournalEntry
    var body: some Scene {
        WindowGroup {
            SplashScreen() // This is your main view
                .modelContainer(for: [JournalEntry.self]) // Register the model container for the JournalEntry class
        }
    }
}
