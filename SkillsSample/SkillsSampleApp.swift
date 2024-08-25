//
//  SkillsSampleApp.swift
//  SkillsSample
//
//  Created by 刘永杰 on 2024/8/25.
//

import SwiftUI

@main
struct SkillsSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
