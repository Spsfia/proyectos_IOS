//
//  NewDogView.swift
//  FirebaseApp
//
//  Created by Adriana Sofia on 15/12/24.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newDog = ""
    
    var body: some View {
        VStack {
            TextField("Dog", text: $newDog)
            
            Button{
                dataManager.addDog(dogBreed: newDog)
            } label: {
                Text("Save")
            }
        }
    }
}

#Preview {
    NewDogView()
}
