//
//  MainTableViewCell.swift
//  iDoctor
//
//  Created by mohammed on 6/17/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var CategoeryDetelis: UILabel!
    @IBOutlet weak var Categoery: UILabel!
    @IBOutlet weak var Imge: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
