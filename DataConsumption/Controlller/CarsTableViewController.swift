//
//  CarsTableViewController.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 16/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {

    var brand = ""
    var brandCode = ""
    var carCode : String = ""
    var cars : [Car] = []
    var index = 0
    var handler = Handler()
    var models : [ModelResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cars.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "carCell") as? CarroTableViewCell else {
            fatalError()
        }
        cell.setup(nome: cars[indexPath.row].nome, codigo: "\(cars[indexPath.row].codigo)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return brand
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        let carCode = cars[index].codigo
        handler.loadCarModels(brandId: Int(brandCode)!, carId: carCode)
        
        if handler.carsLoaded && String(handler.loadedBrand) == brandCode {
            handler.carsLoaded = false
            models = handler.modelos
            performSegue(withIdentifier: "carsSegue", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ModelTableViewCell{
            
        }
    }
    
}
