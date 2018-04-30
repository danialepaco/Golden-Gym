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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func calcular(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
