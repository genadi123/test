//
//  CustomTableViewCell.swift
//  Food
//
//  Created by robert on 2/27/15.
//  Copyright (c) 2015 Genadi Betsuashvili. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cellImageView: UIImageView!
    
<<<<<<< HEAD
    @IBOutlet weak var locationLabel: UILabel!
=======
>>>>>>> FETCH_HEAD
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
