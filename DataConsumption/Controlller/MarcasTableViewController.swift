//
//  MarcasTableViewController.swift
//  DataConsumption
//
//  Created by Raul Rodrigues on 4/15/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class MarcasTableViewController: UITableViewController {
    
    var marcas: [MarcasResponse] = []
    let handler = Handler()
    var carros: [Car] = []
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //print(marcas.count)
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return marcas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "marca") as? MarcaTableViewCell else {
            fatalError()
        }
        cell.setup(nome: marcas[indexPath.row].nome)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        index = indexPath.row
        let brandCode = marcas[index].codigo
        handler.loadCars(brandId: Int(brandCode)!)
        
        while !handler.carsLoaded{
            
        }
        
        if handler.carsLoaded{
            handler.carsLoaded = false
            carros = handler.carros
            performSegue(withIdentifier: "carsSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CarsTableViewController{
            destination.cars = carros
            destination.brand = marcas[index].nome
            destination.brandCode = marcas[index].codigo
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Selecione a marca do seu veículo:"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .blue
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: tableView.bounds.size.width, height: 30))
        label.text = "Selecione a marca do seu veículo"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}
