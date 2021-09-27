//
//  LoginCoreDataApp.swift
//  Shared
//
//  Created by Anthony José on 24/09/21.
//

import SwiftUI

@main
struct LoginCoreDataApp: App {
    let persistenController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(coreDataManager: CoreDataManager())
//                .environment(\.managedObjectContext, persistenController.container.viewContext)
        }
    }
}
