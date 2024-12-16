//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by Adriana Sofia on 15/12/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseAppApp: App {
 @StateObject var dataManager = DataManager()
//    @State private var userIsLoggedIn = false
//    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            if userIsLoggedIn {
//                // Muestra la vista de la base de datos si el usuario está logueado
//                ListView()
//                    .environmentObject(dataManager)
//            } else {
//                // Muestra la vista de login si el usuario no está logueado
//                ContentView()
//            }
            
           // ContentView()
//            if userIsLoggedIn {
                          ListView()
                .environmentObject(DataManager()) // Inyecta el DataManager aquí
//                       } else {
//                           ContentView()
//                               .environmentObject(dataManager) // También aquí para ContentView
//                       }
        }
    }
}
