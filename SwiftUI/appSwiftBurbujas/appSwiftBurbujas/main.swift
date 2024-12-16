//
//  main.swift
//  appSwiftBurbujas
//
//  Created by Adriana Sofia on 05/11/24.
//

import Foundation

//Implementar un metodo para aplicar el ordenamiento burbuja a un arreglo
func ordenamientoBurbuja(_ arreglo: inout [Int]) {
    let n = arreglo.count
    for i in 0..<n {
        for j in 0..<n - i - 1 {
            if arreglo[j] > arreglo[j + 1] {
                // Intercambiamos los elementos
                let temp = arreglo[j]
                arreglo[j] = arreglo[j + 1]
                arreglo[j + 1] = temp
            }
        }
    }
}

var numeros = [5, 3, 8, 4, 2]
ordenamientoBurbuja(&numeros)
print(numeros)





func OrdBurbuja(array: [Int]) -> (arrayOrdenado: [Int], elementos: Int) {
    var arreglo = array
    let n = arreglo.count
    var comparaciones = 0
    
    for i in 0..<n {
        for j in 0..<n - i - 1 {
            comparaciones += 1 // Contamos cada comparación
            if arreglo[j] > arreglo[j + 1] {
                let temp = arreglo[j]
                arreglo[j] = arreglo[j + 1]
                arreglo[j + 1] = temp
            }
        }
    }
    return (arreglo, comparaciones)
}

// Ejemplo de uso
let numeros2 = [5, 3, 8, 4, 2, 24, 1, 12, 6]
let resultado2 = OrdBurbuja(array: numeros2)
print("Arreglo ordenado: \(resultado2.arrayOrdenado)") // [2, 3, 4, 5, 8]
print("Número de comparaciones: \(resultado2.elementos)")















//print("Hello, World!")

