//
//  MarcaTableViewCell.swift
//  DataConsumption
//
//  Created by Raul Rodrigues on 4/15/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class MarcaTableViewCell: UITableViewCell {
    
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
