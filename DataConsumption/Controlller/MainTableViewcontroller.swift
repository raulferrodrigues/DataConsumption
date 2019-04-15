//
//  ViewController.swift
//  DataConsumption
//
//  Created by Raul Rodrigues on 4/15/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class MainTableViewcontroller: UITableViewController {
    
    let model = Model()
    let handler = Handler()
    
    override func loadView() {
        super.loadView()
        handler.loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "funcao") as? FuncaoTableViewCell else {
            fatalError()
        }
        
        cell.setup(funcao: model.funcoes[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MarcasTableViewController {
            destination.marcas = handler.marcas
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "marcasSegue", sender: self)
        }
    }
    
    

}

