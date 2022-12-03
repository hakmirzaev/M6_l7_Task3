//
//  M6_l7_Task3App.swift
//  M6_l7_Task3
//
//  Created by Bekhruz Hakmirzaev on 03/12/22.
//

import SwiftUI

@main
struct M6_l7_Task3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
