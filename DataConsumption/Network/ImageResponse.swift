//
//  ImageResponse.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 17/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation

struct ImageResponse: Codable {
    var id : Int
    var url: String
    var large_url: String
    var source_id: Int?
    var copyright: String
    var site: String
}
