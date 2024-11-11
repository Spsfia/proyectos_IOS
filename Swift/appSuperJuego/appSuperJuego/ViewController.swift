//
//  ViewController.swift
//  appSuperJuego
//
//  Created by Adriana Sofia on 10/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TFNumeros: UITextField!
    @IBOutlet weak var lblVidas: UILabel!
    @IBOutlet weak var lblMensaje: UILabel!
    
    var numRandom = 0
    var vida = 0
    
    func inicializar(){
        numRandom = Int.random(in: 0..<10) //0...9)
        TFNumeros.text = ""
        vida = 3
        lblVidas.text = String(vida)
        lblMensaje.text = "Selecciona un numero del 0 al 9"
        self.view.backgroundColor = #colorLiteral(red: 0.7276254252, green: 0.9379134474, blue: 0.9960805774, alpha: 1)
    }
    
    
    @IBAction func btnPlay(_ sender: UIButton) {
        guard let guessedNumber = Int(TFNumeros.text ?? "") else {
               lblMensaje.text = "Por favor, ingresa un número válido."
               return
           }

           self.view.backgroundColor = #colorLiteral(red: 0.7276254252, green: 0.9379134474, blue: 0.9960805774, alpha: 1)

           if guessedNumber == numRandom {
               lblMensaje.text = "¡GANASTE! FELICIDADES. EL NÚMERO ERA \(numRandom)"
               self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
           } else {
               let difference = abs(numRandom - guessedNumber)
               var hint = ""

               if difference <= 1 {
                   hint = "Estás muy cerca."
               } else if difference <= 3 {
                   hint = "Estás cerca."
               } else if difference <= 5 {
                   hint = "Estás lejos."
               } else {
                   hint = "Estás muy lejos."
               }

               if vida == 1 {
                   lblMensaje.text = "Fallaste, el número era \(numRandom). \(hint) ¡Juego terminado!"
                   self.view.backgroundColor = #colorLiteral(red: 0.9654524922, green: 0.2042350471, blue: 0.2641374171, alpha: 1)
                   alerta()
               } else {
                   vida -= 1
                   lblVidas.text = String(repeating: "❤️", count: vida) // Mostrar corazones en lugar de números
                   lblMensaje.text = "Fallaste. \(hint) Te quedan \(vida) vidas."
                   TFNumeros.text = ""
               }
           }
    }
    
    
    func alerta(){
        let alerta = UIAlertController(title: "SUPER MEGA JUEGO 💪", message: "Intentalo otra vez", preferredStyle: .alert)
        let jugarOtraVez = UIAlertAction(title: "Volver a intentarlo", style: .default)
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
    }
    
    
    @IBAction func btnRestart(_ sender: Any) {
        self.viewDidLoad()
    }
    
    
    @IBAction func btnSalir(_ sender: Any) {
        UIControl().sendAction(#selector(NSXPCConnection .suspend), to: UIApplication.shared, for: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inicializar()
    }


}

