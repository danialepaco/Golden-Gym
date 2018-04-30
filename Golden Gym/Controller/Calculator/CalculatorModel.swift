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
    var sexo: Bool
    var fecha: String
    var imc: Float

    init(peso: Float,altura: Float, edad: Int,sexo: Bool,fecha: String,imc: Float) {
        
        self.peso = peso
        self.altura = altura
        self.edad = edad
        self.sexo = sexo
        self.fecha = fecha
        self.imc = imc
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.peso = aDecoder.decodeFloat(forKey: "peso")
        self.altura = aDecoder.decodeFloat(forKey: "altura")
        self.edad = aDecoder.decodeInteger(forKey: "edad")
        self.sexo = aDecoder.decodeBool(forKey: "sexo")
        self.fecha = aDecoder.decodeObject(forKey: "fecha") as? String ?? ""
        self.imc = aDecoder.decodeFloat(forKey: "imc")

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(peso, forKey: "peso")
        aCoder.encode(altura, forKey: "altura")
        aCoder.encode(edad, forKey: "edad")
        aCoder.encode(sexo, forKey: "sexo")
        aCoder.encode(fecha, forKey: "fecha")
        aCoder.encode(imc, forKey: "imc")
    }
}
