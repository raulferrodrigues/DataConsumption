//
//  Detail.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 16/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation

struct DetailResponse : Codable {
    var Valor: String
    var Marca: String
    var Modelo: String
    var AnoModelo: Int
    var Combustivel: String
    var CodigoFipe: String
    var MesReferencia: String
    var TipoVeiculo: Int
    var SiglaCombustivel: String
}
