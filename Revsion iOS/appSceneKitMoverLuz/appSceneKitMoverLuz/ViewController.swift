//
//  ViewController.swift
//  appSceneKitMoverLuz
//
//  Created by Adriana Sofia on 15/11/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    //Luz
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var sliderX: UISlider!
    
    @IBOutlet weak var textoX: UITextField!
    
    @IBOutlet weak var sliderY: UISlider!
    
    @IBOutlet weak var textoY: UITextField!
    
    @IBOutlet weak var sliderZ: UISlider!
    
    @IBOutlet weak var textoZ: UITextField!
    
    @IBOutlet weak var segController: UISegmentedControl!
    
    @IBOutlet weak var sliderXC: UISlider!
    
    @IBOutlet weak var sliderYC: UISlider!
    
    @IBOutlet weak var sliderZC: UISlider!
    
    
    @IBOutlet weak var textoXC: UITextField!
    
    @IBOutlet weak var textoYC: UITextField!
    
    @IBOutlet weak var textoZC: UITextField!
    
    //    segController.backgroundColor = UIColor.systemGray5
//    segController.selectedSegmentTintColor = UIColor.systemBlue
    var lightType: SCNLight.LightType = .omni
    //Control de segmentos
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                lightType = .ambient
           case 1:
                lightType = .directional
           case 2:
                lightType = .omni
           case 3:
               lightType = .probe
           case 4:
               lightType = .spot
           case 5:
               lightType = .area
           default:
               break
           }
           dibujaCubo() 
    }
    
    //Slider luz
    @IBAction func sliderX(_ sender: UISlider) {
        sliderX.value = sender.value
        textoX.text = String(sliderX.value)
        dibujaCubo()
    }
    
    
    @IBAction func sliderY(_ sender: UISlider) {
        sliderY.value = sender.value
        textoY.text = String(sliderY.value)
        dibujaCubo()
    }
    
    
    @IBAction func siiderZ(_ sender: UISlider) {
        sliderZ.value = sender.value
        textoZ.text = String(sliderZ.value)
        dibujaCubo()
    }
    
    
    //Slider camara
    
 
    @IBAction func sliderXC(_ sender: UISlider) {
        sliderXC.value = sender.value
        textoXC.text = String(sliderXC.value)
        dibujaCubo()
    }
    
    @IBAction func sliderYC(_ sender: UISlider) {
        sliderYC.value = sender.value
        textoYC.text = String(sliderYC.value)
        dibujaCubo()
    }
    
    
    @IBAction func sliderZC(_ sender: UISlider) {
        sliderZC.value = sender.value
        textoZC.text = String(sliderZC.value)
        dibujaCubo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dibujaCubo()
    }

    func dibujaCubo() {
        let sceneView = SCNView(frame: self.imageView.frame)
        self.imageView.addSubview(sceneView)

        let scene = SCNScene()
        sceneView.scene = scene

        // Configuración de la cámara
        let camara = SCNCamera()
        let camaraNodo = SCNNode()
        camaraNodo.camera = camara
        camaraNodo.position = SCNVector3(x: self.sliderXC.value, y: self.sliderYC.value, z: self.sliderZC.value)

        // Configuración de la luz
        let luz = SCNLight()
        luz.type = lightType // Usa el tipo de luz seleccionado
        if lightType == .spot {
            luz.spotInnerAngle = 30.0
            luz.spotOuterAngle = 70.0
            luz.castsShadow = true
        }

        let nodoLuz = SCNNode()
        nodoLuz.light = luz
        nodoLuz.position = SCNVector3(x: self.sliderX.value, y: self.sliderY.value, z: self.sliderZ.value)

        // Configuración del cubo
        let cubo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        let nodoCubo = SCNNode(geometry: cubo)

        let constraint = SCNLookAtConstraint(target: nodoCubo)
        constraint.isGimbalLockEnabled = true
        camaraNodo.constraints = [constraint]
        nodoLuz.constraints = [constraint]

        // Configuración del plano
        let geometriaPlano = SCNPlane(width: 50.0, height: 50.0)
        let nodoPlano = SCNNode(geometry: geometriaPlano)
        nodoPlano.eulerAngles = SCNVector3(x: GLKMathDegreesToRadians(-90), y: 0, z: 0)
        nodoPlano.position = SCNVector3(x: 0.0, y: -0.5, z: 0.0)

        let colorMaterial = SCNMaterial()
        colorMaterial.diffuse.contents = UIColor.systemBlue
        geometriaPlano.materials = [colorMaterial]

        // Agregar nodos a la escena
        scene.rootNode.addChildNode(nodoLuz)
        scene.rootNode.addChildNode(camaraNodo)
        scene.rootNode.addChildNode(nodoCubo)
        scene.rootNode.addChildNode(nodoPlano)
    }


}

