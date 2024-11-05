//
//  main.swift
//  appFuncionesSwift
//
//  Created by Adriana Sofia on 04/11/24.
//

import Foundation

print("Funcion Mayor Menor")
let array: [Int] = [80, 60, 90, 70, 10]
print("Arreglo: \(array)")
let resul1 = mayorMenor(array: array)
print("Mayor: \(resul1.mayor), Menor: \(resul1.menor)")

// Función para encontrar el mayor y menor en un array
func mayorMenor(array: [Int]) -> (mayor: Int, menor: Int) {
    var mayor = array[0]
    var menor = array[0]
    
    for num in array[1..<array.count] {
        if num < menor {
            menor = num
        } else if num > mayor {
            mayor = num
        }
    }
    return (mayor, menor)
}

// Método para multiplicar dos números dobles
func multiplicar(num1: Double, num2: Double) -> Double {
    return num1 * num2
}

print("Resultado de la multiplicación de 2 y 5: \(multiplicar(num1: 2, num2: 5))")

// Capturar los números del usuario para multiplicación
func capturarMultiplicacion() {
    print("Ingresa el primer número:")
    if let input1 = readLine(), let num1 = Double(input1) {
        print("Ingresa el segundo número:")
        if let input2 = readLine(), let num2 = Double(input2) {
            let resultado = multiplicar(num1: num1, num2: num2)
            print("El resultado de la multiplicación es: \(resultado)")
        }
    }
}
capturarMultiplicacion()

// Método para calcular el factorial de un número entero de forma iterativa
func factorialIterativo(_ numero: Int) -> Int {
    var resultado = 1
    for i in 1...numero {
        resultado *= i
    }
    return resultado
}

// Método para calcular el factorial de un número entero de forma recursiva (para números mayores a 12)
func factorialRecursivo(_ numero: Int) -> Int64 {
    if numero <= 1 {
        return 1
    } else {
        return Int64(numero) * factorialRecursivo(numero - 1)
    }
}

print("Factorial de 12 (iterativo): \(factorialIterativo(12))")
print("Factorial de 13 (recursivo): \(factorialRecursivo(13))")

// Método para calcular la potencia de un número
func potencia(base: Double, exponente: Int) -> Double {
    return pow(base, Double(exponente))
}

print("Potencia de 2 elevado a la 3: \(potencia(base: 2, exponente: 3))")


