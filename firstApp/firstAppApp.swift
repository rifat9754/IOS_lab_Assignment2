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
    
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           
            ContentView()
            .environmentObject(dataManager)
            
        }
    }
}
