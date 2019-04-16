//
//  Handler.swift
//  DataConsumption
//
//  Created by Raul Rodrigues on 4/15/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation

class Handler {
    
    let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas")
    
    var marcas: [MarcasResponse] = []
    
    var carros: [Car] = []
    
    var modelos: [ModelResponse] = []
    
    var loadedBrand = 0
    var carsLoaded: Bool = false
    var loadedModel = 0
    var modelLoaded: Bool = false
    
    var isLoaded: Bool = false
    
    func loadData() {
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if let _ = error {
                return
            } else {
                if let data = data {
                    let decoder = JSONDecoder()
                    guard let marcasResponse = try? decoder.decode([MarcasResponse].self, from: data) else { return }
                    self.marcas = marcasResponse
                    self.isLoaded = true
                }
            }
        }
        
        task.resume()
    }
    
    func loadCars(brandId: Int){
        let carURL = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandId)/modelos")
        print(carURL as Any)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: carURL!){ (data, response, error) in
            
            if let _ = error {
                return
            } else {
                if let data = data{
                    let decoder = JSONDecoder()
                    guard let carsResponse = try?
                        decoder.decode(CarsResponse.self, from: data)
                        else {return}
                    self.carros = carsResponse.modelos
                    self.carsLoaded = true
                    self.loadedBrand = brandId
                }
            }
        }
        
        task.resume()
    }
    
    func loadCarModels(brandId: Int, carId: Int){
        let modelURL = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandId)/modelos/\(carId)/anos")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: modelURL!){ (data, response, error) in
            
            if let _ = error {
                return
            } else {
                if let data = data{
                    let decoder = JSONDecoder()
                    guard let modelResponse = try?
                        decoder.decode([ModelResponse].self, from: data)
                        else {return}
                    self.modelos = modelResponse
                    self.carsLoaded = true
                    self.loadedModel = carId
                }
            }
        }
        
        task.resume()
    }
}
