//
//  NewDogView.swift
//  firstApp
//
//  Created by Ahanaf Tahmid Rifat on 27/11/24.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newDog = ""
    
    var body: some View {
        VStack {
            TextField("Dog", text: $newDog)
            
            Button {
                //add dog
                dataManager.addDog(dogBreed: newDog)
                
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}

#Preview {
    NewDogView()
}
