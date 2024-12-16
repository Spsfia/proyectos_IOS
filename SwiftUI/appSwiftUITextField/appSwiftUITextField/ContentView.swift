//
//  ContentView.swift
//  appSwiftUITextField
//
//  Created by Adriana Sofia on 02/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var entrada: String = ""
    var body: some View {
        Group{
            TextField("Escribe texto: ", text: $entrada)
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.accentColor)
            
            if !entrada.isEmpty{
                Text("Mayuscula: " + entrada).textCase(.uppercase)
            }
        }
    }
}

#Preview {
    ContentView()
}
