//
//  CalculatorModel.swift
//  Golden Gym
//
//  Created by Daniel Parra on 4/30/18.
//  Copyright © 2018 Daniel Parra. All rights reserved.
//

import Foundation
import UIKit

class CalculatorModel: NSObject, NSCoding {
    
    var peso: Float
    var altura: Float
    var edad: Int
    var esHombre: Bool
    var fecha: String
    var imc: Float
    var nombre: String

    init(peso: Float,altura: Float, edad: Int,esHombre: Bool,fecha: String,imc: Float,nombre:String) {
        
        self.peso = peso
        self.altura = altura
        self.edad = edad
        self.esHombre = esHombre
        self.fecha = fecha
        self.imc = imc
        self.nombre = nombre

    }
    
    required init?(coder aDecoder: NSCoder) {
        self.peso = aDecoder.decodeFloat(forKey: "peso")
        self.altura = aDecoder.decodeFloat(forKey: "altura")
        self.edad = aDecoder.decodeInteger(forKey: "edad")
        self.esHombre = aDecoder.decodeBool(forKey: "esHombre")
        self.fecha = aDecoder.decodeObject(forKey: "fecha") as? String ?? ""
        self.nombre = aDecoder.decodeObject(forKey: "nombre") as? String ?? ""
        self.imc = aDecoder.decodeFloat(forKey: "imc")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(peso, forKey: "peso")
        aCoder.encode(altura, forKey: "altura")
        aCoder.encode(edad, forKey: "edad")
        aCoder.encode(esHombre, forKey: "esHombre")
        aCoder.encode(fecha, forKey: "fecha")
        aCoder.encode(nombre, forKey: "nombre")
        aCoder.encode(imc, forKey: "imc")
    }
}
