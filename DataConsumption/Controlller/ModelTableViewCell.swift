//
//  ModelTableViewCell.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 16/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class ModelTableViewCell: UITableViewController {

    var model = ""
    var codigo = ""
    var brandName = ""
    var brandCode = 0
    var carName = ""
    var carCode = ""
    var models : [ModelResponse] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    

}
