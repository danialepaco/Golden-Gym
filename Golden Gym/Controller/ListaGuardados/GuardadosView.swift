//
//  GuardadosView.swift
//  Golden Gym
//
//  Created by Daniel Parra on 4/30/18.
//  Copyright © 2018 Daniel Parra. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GuardadosView: UITableViewController {
    
    var guardados = [CalculatorModel]()
    let controller = CalculatorController()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        guardados = self.controller.getData()
        self.tableView.reloadData()

//        Store.instance.calculados.asObservable()
//            .subscribe(onNext: {
//                guardado in
//                
//                self.guardados = guardado
//                self.tableView.reloadData()
//            }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guardados = self.controller.getData()
        self.tableView.reloadData()
//        Esto es un ejemplo de como tambien se podria hacer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guardados.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "guardados", for: indexPath) as? GuardadosViewCell {
            
            cell.updateUI(data: guardados[indexPath.row])

            return cell
        }
        
        return UITableViewCell()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guardados.remove(at: indexPath.row)
            self.controller.borrar(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editar", sender: CalculatorController.segueData.init(datos: guardados[indexPath.row], index: indexPath.row))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CalulatorView {
            
            if let datos = sender as? CalculatorController.segueData {
                destination.segueData = datos
            }
        }
    }

 }
