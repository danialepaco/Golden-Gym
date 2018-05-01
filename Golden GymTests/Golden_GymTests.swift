//
//  Golden_GymTests.swift
//  Golden GymTests
//
//  Created by Daniel Parra on 4/30/18.
//  Copyright © 2018 Daniel Parra. All rights reserved.
//

import XCTest
@testable import Golden_Gym

class Golden_GymTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCalcularImc() {
        
        let controller = CalculatorController()
        
        let pesoExitoso = 60.0
        let AlturaExitosa = 1.7
        let imcExitoso = 20.7612457
        
        //Calculo Exitoso
        XCTAssertEqual(controller.calcularIMC(peso: Float(pesoExitoso), altura: Float(AlturaExitosa)), Float(imcExitoso))
        
        
        //Calculo Fallido

        let imcFallido = 36.554
        
        XCTAssertNotEqual(controller.calcularIMC(peso: Float(pesoExitoso), altura: Float(AlturaExitosa)), Float(imcFallido))

    }
    
    func testClasificarImc() {
        
        let controller = CalculatorController()
        
        let bajo = 17
        let normal = 19.5
        let sobrepeso = 26.4
        let obeso1 = 28.7
        let obeso2 = 32.5
        let obeso3 = 40.9
        
        let bajoMsj = "Peso Bajo. Necesario valorar signos de desnutricion."
        let normalMsj = "Normal"
        let sobrepesoMsj =  "Sobrepeso"
        let obeso1Msj =  "Obesidad Grado I"
        let obeso2Msj =  "Obesidad Grado II"
        let obeso3Msj =  "Obesidad Grado III (Extrema o mórbida)"

        //Clasificacion Exitosa
        XCTAssertEqual(controller.clasificar(imc: Float(bajo)), bajoMsj)
        XCTAssertEqual(controller.clasificar(imc: Float(normal)), normalMsj)
        XCTAssertEqual(controller.clasificar(imc: Float(sobrepeso)), sobrepesoMsj)
        XCTAssertEqual(controller.clasificar(imc: Float(obeso1)), obeso1Msj)
        XCTAssertEqual(controller.clasificar(imc: Float(obeso2)), obeso2Msj)
        XCTAssertEqual(controller.clasificar(imc: Float(obeso3)), obeso3Msj)
        
        //Clasificacion Fallida
        let bajoMsjFallido =  "Obesidad Grado III (Extrema o mórbida)"
        let normalMsjFallido =  "Obesidad Grado II"
        let sobrepesoMsjFallido =  "Obesidad Grado I"
        let obeso1MsjFallido =  "Sobrepeso"
        let obeso2MsjFallido =  "Normal"
        let obeso3MsjFallido = "Peso Bajo. Necesario valorar signos de desnutricion."
        
        XCTAssertNotEqual(controller.clasificar(imc: Float(bajo)), bajoMsjFallido)
        XCTAssertNotEqual(controller.clasificar(imc: Float(normal)), normalMsjFallido)
        XCTAssertNotEqual(controller.clasificar(imc: Float(sobrepeso)), sobrepesoMsjFallido)
        XCTAssertNotEqual(controller.clasificar(imc: Float(obeso1)), obeso1MsjFallido)
        XCTAssertNotEqual(controller.clasificar(imc: Float(obeso2)), obeso2MsjFallido)
        XCTAssertNotEqual(controller.clasificar(imc: Float(obeso3)), obeso3MsjFallido)


    }
}
