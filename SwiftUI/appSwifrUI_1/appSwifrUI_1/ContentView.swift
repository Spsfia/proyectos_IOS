//
//  ContentView.swift
//  appSwifrUI_1
//
//  Created by Adriana Sofia on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                ColorPicker(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
