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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //print(marcas.count)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return marcas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "marca") as? MarcaTableViewCell else {
            fatalError()
        }
        cell.setup(nome: marcas[indexPath.row].nome, codigo: marcas[indexPath.row].codigo)
        return cell
    }

}
