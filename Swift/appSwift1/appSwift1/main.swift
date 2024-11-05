//import Foundation
//
//// Variables iniciales
//var n1 = 100
//var n2 = 50
//
//// Operación XOR entre n1 y n2
//var resul = n1 ^ n2
//print("n1: \(n1) ^ n2: \(n2) = \(resul)")
//
//// Conversión a binario
//let binario = String(resul, radix: 2)
//print("\t Binario : \(resul) = \(binario)")
//
//// Conversión a octal
//let octal = String(resul, radix: 8)
//print("\t Octal : \(resul) = \(octal)")
//
//// Conversión a hexadecimal
//let hexadecimal = String(resul, radix: 16)
//print("\t Hexa : \(resul) = \(hexadecimal)")
//
//// Convertir binario2 de binario a decimal
//let binario2 = "10101010"
//let numHexa = String(Int(binario2,radix: 2)!, radix: 16);
//print("Binario2 = \(binario2) = \(numHexa) HEXADECIMAL")
//
//
////if let decimalABinario = Int(binario2, radix: 2) {
////    print("\t Decimal de binario '\(binario2)' = \(decimalABinario)")
////}
//
//// Aplicar operadores AND y OR
//let andResult = n1 & n2
//let orResult = n1 | n2
//print("\t AND entre \(n1) y \(n2) = \(andResult)")
//print("\t OR entre \(n1) y \(n2) = \(orResult)")

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import Foundation

// Decimal integer literal
let num1 = 34
print("Decimal Integer: \(num1)")

// Binary integer literal
let num2 = 0b101011
print("Binary Integer: \(num2)")

// Octal integer literal
let num3 = 0o52
print("Octal Integer: \(num3)")

// Hexadecimal integer literal
let num4 = 0x2C
print("Hexadecimal Integer: \(num4)")


//Rangos
print("Rango cerrado")
let rangoCerrado = ...5
print(rangoCerrado.contains(-100000))
print(rangoCerrado.contains(6))
print(rangoCerrado.contains(2))

print("Rango Medio abierto, Half")
let rangoMedioAbierto = ..<60
print(rangoMedioAbierto.contains(70))
print(rangoMedioAbierto.contains(60))
print(rangoMedioAbierto.contains(59))

print("Rango abierto, one side")
let rangoAbierto = ...5
print(rangoAbierto.contains(70))
print(rangoAbierto.contains(5))
print(rangoAbierto.contains(2))


//Ejemplo con cadena
var cadena = "TEC LAGUNA"
var cadAux : String = ""

var caracteres = Array(cadena)

for i in 0..<caracteres.count{
    let car = String(caracteres[i])
    cadAux += car.lowercased()
    //print(cadAux, terminator: " ")
    print (cadAux)
}
print(cadAux)

for i in 0..<caracteres.count{
    let c = String(caracteres[i])
    cadAux += c.reversed()
    print(cadAux)
}


//Tarea mostrar diferentes salidas con metodos
//para el manejo de cadenas  reversed pop
