import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var texto1: UITextField!
    
    // Municipios Baja California Sur
    let municipios = ["Comondú", "Mulegé", "La Paz", "Los Cabos", "Loreto"]
    
    // Arreglo con imágenes
    let imagenes = [
        "Comondú": "Comondú.png",
        "Mulegé": "Mulegé.png",
        "La Paz": "La_Paz.png",
        "Los Cabos": "Los_Cabos.png",
        "Loreto": "Loreto.png",
    ]
    
    // Información de cada municipio
    let informacionMunicipios = [
        "Comondú": "Comondú es conocido por sus hermosos oasis y paisajes desérticos.",
        "Mulegé": "Mulegé alberga bahías impresionantes y una rica historia misionera.",
        "La Paz": "La Paz es la capital del estado, famosa por su malecón y playas.",
        "Los Cabos": "Los Cabos es un destino turístico de clase mundial con paisajes icónicos.",
        "Loreto": "Loreto es la cuna de las misiones de California y tiene un encanto único."
    ]
    
    var municipioSeleccionado: String?
    
    // UIImageView para mostrar la imagen
    var imageView: UIImageView?
    
    // UILabel para mostrar la información
    var infoLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crear el Picker, el ImageView y la ToolBar
        crearPickerView()
        crearImageView()
        crearInfoLabel()
        crearToolBar()
    }
    
    // Crear el UIImageView para mostrar la imagen
    func crearImageView() {
        imageView = UIImageView()
        imageView?.contentMode = .scaleAspectFit
        imageView?.clipsToBounds = true
        
        if let imageView = imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
                imageView.widthAnchor.constraint(equalToConstant: 300),
                imageView.heightAnchor.constraint(equalToConstant: 300)
            ])
        }
    }
    
    // Crear el UILabel para mostrar la información
    func crearInfoLabel() {
        infoLabel = UILabel()
        infoLabel?.numberOfLines = 0
        infoLabel?.textAlignment = .center
        infoLabel?.font = UIFont(name: "Arial", size: 16)
        infoLabel?.textColor = .darkGray
        
        if let infoLabel = infoLabel {
            infoLabel.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(infoLabel)
            NSLayoutConstraint.activate([
                infoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                infoLabel.topAnchor.constraint(equalTo: imageView?.bottomAnchor ?? self.view.topAnchor, constant: 20),
                infoLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                infoLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            ])
        }
    }
    
    // Crear el UIPickerView
    func crearPickerView() {
        let municipiosPicker = UIPickerView()
        municipiosPicker.delegate = self
        texto1.inputView = municipiosPicker
    }
    
    // Crear la ToolBar con botones personalizados
    func crearToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .green
        toolBar.tintColor = .black
        let botonOcultar = UIBarButtonItem(title: "Ocultar 👁️‍🗨️", style: .plain, target: self, action: #selector(dismissKeyboard))
        let espacio = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let botonAdios = UIBarButtonItem(title: "Salir ➡️", style: .plain, target: self, action: #selector(adios))
        
        toolBar.setItems([botonOcultar, espacio, botonAdios], animated: true)
        texto1.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func adios() {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
}

// MARK: - UIPickerViewDataSource & UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return municipios.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return municipios[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        municipioSeleccionado = municipios[row]
        texto1.text = municipioSeleccionado
        
        // Actualizar la imagen según el municipio seleccionado
        if let imagen = imagenes[municipioSeleccionado ?? ""] {
            imageView?.image = UIImage(named: imagen)
        }
        
        // Mostrar la información del municipio seleccionado
        if let info = informacionMunicipios[municipioSeleccionado ?? ""] {
            infoLabel?.text = info
        }
        
        // Cambiar colores aleatoriamente
        texto1.backgroundColor = UIColor.gray
        self.view.backgroundColor = UIColor.lightGray
    }
}
