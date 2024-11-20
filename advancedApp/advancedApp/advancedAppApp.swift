//
//  advancedAppApp.swift
//  advancedApp
//
//  Created by DDUKK on 19/10/24.
//

import SwiftUI

@main
struct adavanced2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
