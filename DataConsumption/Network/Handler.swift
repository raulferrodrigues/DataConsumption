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
    
    var carros: [CarsResponse] = []
    
    var carsLoaded: Bool = false
    
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
    
    func loadCars(carId: String){
        let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas/59/modelos/\(carId)/modelos")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!){
            (data, response, error) in
            
            if let _ = error {
                return
            } else {
                if let data = data{
                    let decoder = JSONDecoder()
                    guard let carsResponse = try?
                        decoder.decode([CarsResponse].self, from: data)
                        else {return}
                    self.carros = carsResponse
                    self.carsLoaded = true
                }
            }
        }
        
        task.resume()
    }
}
