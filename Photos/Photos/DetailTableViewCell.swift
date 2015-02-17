//
//  DetailTableViewCell.swift
//  Photos
//
//  Created by robert on 2/14/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel:UILabel!
    @IBOutlet weak var valueLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
}
