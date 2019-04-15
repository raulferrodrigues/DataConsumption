//
//  FuncaoTableViewCell.swift
//  DataConsumption
//
//  Created by Raul Rodrigues on 4/15/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class FuncaoTableViewCell: UITableViewCell {

    @IBOutlet weak var FuncaoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(funcao: String) {
        FuncaoLabel.text = funcao
    }
    
    
}
