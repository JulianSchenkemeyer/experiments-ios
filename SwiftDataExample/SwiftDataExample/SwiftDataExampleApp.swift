//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Julian Schenkemeyer on 05.10.23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([Expense.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
