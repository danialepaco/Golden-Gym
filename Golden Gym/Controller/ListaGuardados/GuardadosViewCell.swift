//
//  GuardadosViewCell.swift
//  Golden Gym
//
//  Created by Daniel Parra on 4/30/18.
//  Copyright © 2018 Daniel Parra. All rights reserved.
//

import UIKit

class GuardadosViewCell: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var imc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
                
    }
    
    func updateUI(data: CalculatorModel) {
        nombre.text = "Nombre: " + data.nombre
        edad.text = "Edad: " + String(data.edad)
        imc.text = "IMC: " + String(data.imc)
        changeColor(value: data.imc)
    }
    
    func changeColor(value: Float) {
        
        switch value {
        case ..<18:
            imc.textColor = UIColor.cyan
            break
        case 18...24.9:
            imc.textColor = UIColor.green
            break
        case 25...26.9:
            imc.textColor = UIColor.yellow
            break
        case 27...29.9:
            imc.textColor = UIColor.orange
            break
        case 30...:
            imc.textColor = UIColor.red
            break
        default:
            break
        }
    }
}
