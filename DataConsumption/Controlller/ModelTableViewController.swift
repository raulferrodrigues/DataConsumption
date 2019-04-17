//
//  ModelTableViewCell.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 16/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ModelTableViewController: UITableViewController {

    var model = ""
    var codigo = ""
    var brandName = ""
    var brandCode = ""
    var carName = ""
    var carCode = ""
    var models : [ModelResponse] = []
    var index = 0
    var handler = Handler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(models)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "modelCell") as? ModelTableViewCell else {
            fatalError()
        }
        cell.setUpCell(model: models[indexPath.row].nome)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .blue
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: tableView.bounds.size.width, height: 30))
        label.text = "\(brandName) \(carName)"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        
        return view
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return carName
//    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        model = models[index].nome
        codigo = models[index].codigo
        
        handler.loadDetails(brandId: brandCode, carId: carCode, modelId: codigo)
        handler.getRandomImage()
        
        //ADD IMAGE WAIT HERE
        while !handler.detailLoaded || !handler.imageLoaded{
            
        }
        
        if handler.detailLoaded && handler.imageLoaded {
            handler.imageLoaded = false
            handler.detailLoaded = false
            print(handler.imageURL)

            performSegue(withIdentifier: "detailsSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            //set variables
            destination.carModel = "Modelo: \( handler.detalhes.Modelo)"
            destination.value = "Valor: \(handler.detalhes.Valor)"
            destination.power = "Combustível: \(handler.detalhes.Combustivel)"
            destination.year = "Ano: \(handler.detalhes.AnoModelo)"
            destination.brand = "Marca: \( handler.detalhes.Marca)"
            
            //MUDAR AQUI
            destination.imageURL = handler.imageURL
        }
        
    }

}
