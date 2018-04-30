//
//  CalulatorView.swift
//  Golden Gym
//
//  Created by Daniel Parra on 4/30/18.
//  Copyright © 2018 Daniel Parra. All rights reserved.
//

import UIKit


class CalulatorView: UIViewController {
    
    @IBOutlet weak var segmentedSex: UISegmentedControl!
    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var altura: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var imc: UILabel!
    @IBOutlet weak var boton: UIButton!

    let controller = CalculatorController()
    var segueData: CalculatorController.segueData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segueData != nil {
            peso.text = String(segueData?.datos.peso ?? 0)
            altura.text = String(segueData?.datos.altura ?? 0)
            edad.text = String(segueData?.datos.edad ?? 0)
            nombre.text = segueData?.datos.nombre
            segmentedSex.selectedSegmentIndex = (segueData?.datos.esHombre)! ? 0:1
            fecha.text = "Fecha: " + (segueData?.datos.fecha)!
            fecha.isHidden = false
            imc.text = "IMC: " + String(segueData?.datos.imc ?? 0)
            imc.isHidden = false
            boton.setTitle("Guardar", for: UIControlState.normal)
        }
    }
    
    @IBAction func calcular(_ sender: Any) {
        
        let msg = self.controller.clasificar(imc: self.controller.calcularIMC(peso: (peso.text! as NSString).floatValue, altura: (altura.text! as NSString).floatValue))
        
        let alertController = UIAlertController(title: "Alerta", message: msg,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            action in
            
            if self.segueData == nil {
                self.guardar()
            } else {
                self.editar()
            }
            
            self.navigationController?.popViewController(animated: true)

        }))
        self.present(alertController, animated: true)

    }
    
    func guardar() {
        //Guardar dentro del Array de IMC
        self.controller.guardar(dataToAppend: CalculatorModel.init(peso: (self.peso.text! as NSString).floatValue, altura: (self.altura.text! as NSString).floatValue, edad: Int(self.edad.text!)!, esHombre: self.controller.getSex(value: self.segmentedSex.selectedSegmentIndex), fecha: self.controller.getDate(), imc: self.controller.calcularIMC(peso: (self.peso.text! as NSString).floatValue, altura: (self.altura.text! as NSString).floatValue), nombre: self.nombre.text!))

    }
    
    func editar() {
        //Editar dentro del Array de IMC
        self.controller.editar(dataToEdit: CalculatorModel.init(peso: (self.peso.text! as NSString).floatValue, altura: (self.altura.text! as NSString).floatValue, edad: Int(self.edad.text!)!, esHombre: self.controller.getSex(value: self.segmentedSex.selectedSegmentIndex), fecha: self.fecha.text!, imc: self.controller.calcularIMC(peso: (self.peso.text! as NSString).floatValue, altura: (self.altura.text! as NSString).floatValue), nombre: self.nombre.text!), index: (segueData?.index)!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
