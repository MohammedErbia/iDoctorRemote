//
//  DoctorsTableViewCell.swift
//  iDoctor
//
//  Created by mohammed on 5/23/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class DoctorsTableViewCell: UITableViewCell {

    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var subtitel: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var imageuser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
