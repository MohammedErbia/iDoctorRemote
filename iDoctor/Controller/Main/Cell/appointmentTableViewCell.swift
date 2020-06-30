//
//  appointmentTableViewCell.swift
//  iDoctor
//
//  Created by mohammed on 6/16/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class appointmentTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUI: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var subname: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
