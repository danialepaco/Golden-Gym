//
//  Store.swift
//  Golden Gym
//
//  Created by Daniel Parra on 4/30/18.
//  Copyright © 2018 Daniel Parra. All rights reserved.
//

import Foundation
import RxSwift

class Store {
    
    static let instance = Store()
    init() {}
    
    let calculados: Variable<[CalculatorModel]> = Variable([])
    
}
