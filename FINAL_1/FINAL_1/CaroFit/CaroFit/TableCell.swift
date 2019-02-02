//
//  TableCell.swift
//  CaroFit
//
//  Created by labcisco on 15/11/18.
//  Copyright © 2018 labcisco. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var porcion: UILabel!
    @IBOutlet weak var peso: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
