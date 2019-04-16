//
//  CarroTableViewCell.swift
//  DataConsumption
//
//  Created by Alexandre Scheer Bing on 16/04/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class CarroTableViewCell: UITableViewCell {

    @IBOutlet weak var NomeLabel: UILabel!
    @IBOutlet weak var CodigoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(nome: String, codigo: String) {
        NomeLabel.text = nome
        CodigoLabel.text = codigo
    }
    
}
