//
//  firstAppApp.swift
//  firstApp
//
//  Created by Ahanaf Tahmid Rifat on 14/11/24.
//

import SwiftUI

import Firebase

@main
struct firstAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
