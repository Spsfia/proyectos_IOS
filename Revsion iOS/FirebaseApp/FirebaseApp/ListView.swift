//
//  ListView.swift
//  FirebaseApp
//
//  Created by Adriana Sofia on 15/12/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopUp = false
    var body: some View {
        NavigationView{
            List(dataManager.dogs, id: \.id){ dog in
                Text(dog.breed)
            }
            .navigationTitle("Dogs")
            .navigationBarItems(trailing: Button(action: {
                showPopUp.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopUp){
                NewDogView()
                    .environmentObject(dataManager) // Opcional, en caso de ser necesario

            }
        }
    }
}

#Preview {
    ListView()
}
