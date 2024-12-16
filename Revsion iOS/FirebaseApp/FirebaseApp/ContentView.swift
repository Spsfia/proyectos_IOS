//
//  ContentView.swift
//  FirebaseApp
//
//  Created by Adriana Sofia on 15/12/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct ContentView: View {
    //Variables
    //@Binding var userIsLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn{
            ListView()
            
        }else{
            ContentView()
        }
    }
    
    var content: some View{
        ZStack{
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(400))
                .offset(y:-350)
            
            VStack(spacing: 20){
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x:100, y:-100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)

                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button{
                    register()
                } label: {
                Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
                Button{
                    login()
                } label: {
                    Text("Already have an account? Log in")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
            }
            .frame(width: 350)
            .onAppear()
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }

        }
        
        .ignoresSafeArea()
    }
    
    func register(){
        //Auth.auth().createUser(withEmail: email, password: password) {result, error in if error != nil}
        Auth.auth().createUser(withEmail: email, password: password) {result, error in if error != nil
            {
                print(error!.localizedDescription)
            }
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {result, error in if error != nil{
            if error == nil {
                userIsLoggedIn = true // Actualiza el estado si el login es exitoso
            } else {
                print(error!.localizedDescription)
            }
            
        }
            
        }
    }
    
}

#Preview {
    ContentView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
