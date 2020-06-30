//
//  orderViewController.swift
//  iDoctor
//
//  Created by mohammed on 6/27/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class orderViewController: UIViewController,StoryboardInitializable {
    var object :  GetObject?
    var time : String?
    var date : String?
    
    @IBOutlet weak var imageUI: UIImageView!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var subtitel: UILabel!
    @IBOutlet weak var descriptionUI: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var timeanddate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeanddate.text = en ? "time:\(time ?? "00") \n Date:\(date ?? "00-00-0000")" : "الوقت:\(time ?? "00") \n التاريخ:\(date ?? "00-00-0000")"
        
        titel.text = en ? object?.objectEnName ?? "err objectEnName" : object?.objectArName ?? "err objectArName"
         adress.text = en ? object?.objectEnAddress ?? "err objectEnAddress" : object?.objectArAddress ?? "err objectArAddress"
         imageUI.kf.indicatorType = .activity
         imageUI.kf.setImage(with: URL(string: object?.objectImage ?? ""), placeholder: UIImage(named:"personuser"))
        descriptionUI.text = en ? object?.objectEnDesc?.html2String ?? " err objectEnDesc" : object?.objectArDesc?.html2String ?? "err objectArDesc"
        
    }
     
    @IBAction func addorder(_ sender: Any) {
//        self.addapp
    }
    
}

