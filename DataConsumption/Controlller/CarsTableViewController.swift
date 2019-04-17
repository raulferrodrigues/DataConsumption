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
    var carName = ""
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .blue
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: tableView.bounds.size.width, height: 30))
        label.text = "\(brand)"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return brand
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        carCode = "\(cars[index].codigo)"
        carName = cars[index].nome
        handler.loadCarModels(brandId: Int(brandCode)!, carId: Int(carCode)!)
        
        while !handler.modelLoaded{

        }
        
        if handler.modelLoaded {
            handler.modelLoaded = false
            print(handler.modelos)
            models = handler.modelos
            performSegue(withIdentifier: "modelsSegue", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ModelTableViewController{
            destination.brandCode = brandCode
            destination.brandName = brand
            destination.carName = carName
            destination.carCode = carCode
            destination.models = models
        }
    }
    
}
