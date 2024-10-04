//
//  Daily_HelperApp.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 21.09.2024.
//

import FirebaseCore
import SwiftUI

@main
struct Daily_HelperApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
