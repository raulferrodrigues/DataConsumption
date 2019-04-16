//
//  carsResponse.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 16/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation

struct CarsResponse: Codable {
    var modelos: [Car]
}

struct Car: Codable{
    var nome: String
    var codigo: Int
}
