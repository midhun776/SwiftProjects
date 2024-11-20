//
//  AppliedIosApp.swift
//  AppliedIos
//
//  Created by DDUKK on 13/07/1946 Saka.
//

import SwiftUI

@main
struct AppliedIosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
