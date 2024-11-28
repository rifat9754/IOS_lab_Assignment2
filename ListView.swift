//
//  ListView.swift
//  firstApp
//
//  Created by Ahanaf Tahmid Rifat on 27/11/24.
//

import SwiftUI
import FirebaseAuth

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    @Environment(\.presentationMode) var presentationMode // For dismissing the view
    
    @State private var userIsLoggedOut = false // Tracks logout state
    
    var body: some View {
        NavigationView {
            VStack {
                List(dataManager.dogs, id: \.id) { dog in
                    Text(dog.breed)
                }
                .navigationTitle("Dogs")
                .navigationBarItems(
                    leading: Button(action: {
                        logout()
                    }, label: {
                        Text("Logout")
                            .bold()
                            .frame(width: 200,height: 40)
                            .foregroundColor(.red)
                    }),
                    trailing: Button(action: {
                        showPopup.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                )
                .sheet(isPresented: $showPopup) {
                    NewDogView()
                }
            }
            .fullScreenCover(isPresented: $userIsLoggedOut, content: {
                ContentView() // Go back to the login/signup view
            })
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut() // Firebase sign-out
            userIsLoggedOut = true // Triggers transition to ContentView
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ListView()
}
