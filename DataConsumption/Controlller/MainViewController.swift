//
//  MainViewController.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 16/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let model = Model()
    let handler = Handler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handler.loadData()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MarcasTableViewController {
            destination.marcas = handler.marcas
        }
    }
    
    @IBAction func toBrands(_ sender: Any) {
        if handler.isLoaded{
            performSegue(withIdentifier: "brandsSegue", sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
