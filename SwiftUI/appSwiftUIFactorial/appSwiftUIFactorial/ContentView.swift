//
//  ContentView.swift
//  appSwiftUIFactorial
//
//  Created by Adriana Sofia on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numero: String = ""
    @State private var resultado: String = ""
    @State private var slider: Int = 0
    
    var body: some View {
        VStack {
            Text("Factorial")
                .font(.largeTitle)
                .bold()
            TextField("Numero", text: $numero)
                .keyboardType(.numberPad)
                .padding()
                .background(Color(Color.red))
                .cornerRadius(15)
                .padding(.horizontal)
            //            VStack{
            //                Slider(value: $slider, in: 1...12)
            //            }
            Button(action: {
                if let num = Int32(numero){
                    resultado = "Factorial \(num) : \(Factorial (num))"
                }else{
                    resultado = "Numero no válido"
                }
            })
            {
                Text(verbatim: "Calcular")
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                
            }
            
            
            Text(resultado)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
                Spacer()
        
        }
       // .padding()
    }//Fin del View
    
    //Dentro del Content View
    func Factorial (_ n : Int32) -> Int32{
        if n == 0{
            return 1
        } else{
            return n * (Factorial(n-1))
        }
    }
}

#Preview {
    ContentView()
}
