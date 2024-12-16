//
//  ViewController.swift
//  appMallaTouch
//
//  Creado por Adriana Sofia el 03/12/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    // Declarar la vista de SceneKit como propiedad
    var vistaSceneKit: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crear la escena
        let escena = SCNScene()
        let nodoRaiz = SCNNode()
        escena.rootNode.addChildNode(nodoRaiz)
        
        // Definir tamaño de la cuadrícula y propiedades de las cápsulas
        let tamanoCuadricula = 25
        let radioCapsula: CGFloat = 1.0 / CGFloat(tamanoCuadricula - 1)
        let alturaCapsula: CGFloat = radioCapsula * 4.0
        
        // Función para calcular el movimiento
        func funcionMovimiento(x: Float, z: Float) -> Float {
            return 0.2 * sin(x * 5 + z * 3) + 0.1 * cos(x * 5 + z * 10 + 0.6) + 0.05 * cos(x * x * z)
        }
        
        // Inicializar la cuadrícula en el plano XZ
        var z: Float = -1.0
        for fila in 0..<tamanoCuadricula {
            var x: Float = -1.0
            for columna in 0..<tamanoCuadricula {
                // Crear la geometría de la cápsula
                let capsula = SCNCapsule(capRadius: radioCapsula, height: alturaCapsula)
                
                // Determinar el color basado en abs(x * z)
                let tono = CGFloat(abs(x * z))
                let color = UIColor(hue: tono, saturation: 1.0, brightness: 1.0, alpha: 1.0)
                capsula.firstMaterial?.diffuse.contents = color
                
                // Crear un nodo para la cápsula y establecer su posición inicial
                let nodoCapsula = SCNNode(geometry: capsula)
                nodoCapsula.position = SCNVector3(x, 0.0, z)
                nodoRaiz.addChildNode(nodoCapsula)
                
                // Calcular el movimiento en el eje Y basado en la función
                let movimientoY = CGFloat(funcionMovimiento(x: x, z: z))
                let moverArriba = SCNAction.moveBy(x: 0, y: movimientoY, z: 0, duration: 1.0)
                let moverAbajo = SCNAction.moveBy(x: 0, y: -movimientoY, z: 0, duration: 1.0)
                
                // Crear una secuencia de animación infinita
                let secuencia = SCNAction.sequence([moverArriba, moverAbajo])
                let animacionRepetida = SCNAction.repeatForever(secuencia)
                nodoCapsula.runAction(animacionRepetida)
                
                // Incrementar x para la siguiente columna
                x += 2.0 * Float(radioCapsula)
            }
            // Incrementar z para la siguiente fila
            z += 2.0 * Float(radioCapsula)
        }
        
        // Configurar la vista de SceneKit
        vistaSceneKit = SCNView(frame: self.view.bounds)
        vistaSceneKit.scene = escena
        vistaSceneKit.allowsCameraControl = true
        vistaSceneKit.backgroundColor = .black
        
        // Agregar la vista de SceneKit a la vista principal
        self.view.addSubview(vistaSceneKit)
    }
    
    // Detectar toques en la pantalla
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let toque = touches.first else { return }
        let puntoTocado = toque.location(in: vistaSceneKit)
        
        // Realizar un hit test para ver si tocó algún nodo
        let resultados = vistaSceneKit.hitTest(puntoTocado, options: nil)
        if let nodoTocado = resultados.first?.node {
            // Cambiar el color de la cápsula tocada
            nodoTocado.geometry?.firstMaterial?.diffuse.contents = UIColor.white
            
            // Agregar animación
            let escalar = SCNAction.scale(to: 1.5, duration: 0.2)
            let restaurar = SCNAction.scale(to: 1.0, duration: 0.2)
            let secuencia = SCNAction.sequence([escalar, restaurar])
            nodoTocado.runAction(secuencia)
        }
    }
}
