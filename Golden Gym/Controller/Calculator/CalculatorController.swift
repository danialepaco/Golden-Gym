//
//  CalculatorController.swift
//  Golden Gym
//
//  Created by Daniel Parra on 4/30/18.
//  Copyright © 2018 Daniel Parra. All rights reserved.
//

import Foundation

class CalculatorController {
    
    func calcularIMC(peso: Float, altura: Float) -> Float {
        let imc = peso/(altura*altura)
        return imc
    }
    
    func clasificar(imc: Float) -> String {
        
        var msg = ""
        switch imc {
        case ..<18:
            msg = "Peso Bajo. Necesario valorar signos de desnutricion."
            break
        case 18...24.9:
            msg = "Normal"
            break

        case 25...26.9:
            msg =  "Sobrepeso"
            break
        case 27...29.9:
            msg =  "Obesidad Grado I"
            break

        case 30...39.9:
            msg =  "Obesidad Grado II"
            break

        case 40...:
            msg =  "Obesidad Grado III (Extrema o mórbida)"
            break

        default:
            break
        }
    return msg
    }
    
    func getSex(value: Int) -> Bool {
        
        var sex = true
        
        switch value {
        case 0:
            sex = true
            break
        case 1:
            sex = false
            break
        default:
            break
        }
        
        return sex
    }
    
    func borrar(index: Int) {
        
        var newData = getData()
        newData.remove(at: index)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: newData)
        UserDefaults.standard.set(encodedData, forKey: "guardados")
        
    }
    
    func editar(dataToEdit: CalculatorModel,index: Int) {
        var newData = getData()
        newData.insert(dataToEdit, at: index)
        newData.remove(at: index + 1)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: newData)
        UserDefaults.standard.set(encodedData, forKey: "guardados")
    }
    
    func guardar(dataToAppend: CalculatorModel) {

        var newData = getData()
        newData.append(dataToAppend)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: newData)
        UserDefaults.standard.set(encodedData, forKey: "guardados")

    }
    
    func getData() -> [CalculatorModel] {
        if let data = UserDefaults.standard.data(forKey: "guardados"),
            let list = NSKeyedUnarchiver.unarchiveObject(with: data) as? [CalculatorModel] {
            return list
        }
        return []
    }
    
    func getDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        return formatter.string(from: date)
    }
    
    struct segueData {
        var datos: CalculatorModel
        var index: Int
    }
}
