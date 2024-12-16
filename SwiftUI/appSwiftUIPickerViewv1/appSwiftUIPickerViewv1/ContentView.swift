//
//  ContentView.swift
//  appSwiftUIPickerViewv1
//
//  Created by Adriana Sofia on 06/12/24.
//

import SwiftUI

enum sabor: String, CaseIterable, Identifiable{
    case chocolate
    case vainilla
    case fresa
    
    var id: String {self.rawValue}
}

//struct ContentView: View {
struct VentaDeHelados: View {
    @State private var saborSeleccionado = sabor.chocolate
    var body: some View {
        Picker("SABORS",selection: $saborSeleccionado){
            Text("Chocolate 🍫").bold().italic().monospaced(true).tag(sabor.chocolate)
            Text("Vainilla 🍦").bold().italic().monospaced(true).tag(sabor.vainilla)
            Text("Fresa 🍓").bold().italic().monospaced(true).tag(sabor.fresa)
        }
        Text("Sabor seleccionado: \(saborSeleccionado.rawValue)")
        
    }
}

/*
 IMPLEMENTAR UNA APLICACION EN SWIFT UI PARA MANEJAR EXPRESIONES REGULARES UTILIZANDO: SEGMENTED O PICKER VIEW

 PARA EL DOMINGO 8
 */

#Preview {
    VentaDeHelados()
}
