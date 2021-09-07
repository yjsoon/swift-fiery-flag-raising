//
//  Firey_Flag_RaisingApp.swift
//  Firey Flag Raising
//
//  Created by jiachen on 3/9/21.
//

import SwiftUI
import Firebase

@main
struct Firey_Flag_RaisingApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
