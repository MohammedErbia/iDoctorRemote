//
//  userInfoViewController.swift
//  iDoctor
//
//  Created by mohammed on 6/28/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit
import Kingfisher
class userInfoViewController: UIViewController {

    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var name     : UILabel!
    @IBOutlet weak var email    : UILabel!
    @IBOutlet weak var gender   : UILabel!
    @IBOutlet weak var phone    : UILabel!
    @IBOutlet weak var date     : UILabel!
    @IBOutlet weak var city     : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata() 
    }
    func loaddata() {
        
        loadUser { (err, data) in
            self.user_infos(self, token: data?.token ?? "", id: data?.id ?? "") { (data, err) in
                if err == nil{
                    let fdata = data?.first
                    self.userimage.kf.indicatorType = .activity
                    self.userimage.kf.setImage(with: URL(string: fdata?.userImage ?? ""), placeholder: UIImage(named:"user (1)"))
                    self.name.text   =   fdata?.userName ?? "err userName"
                    self.email.text  =   fdata?.userEmail ?? "err userEmail"
                    self.gender.text =   fdata?.userGender ?? "err userGender"
                    self.phone.text  =   fdata?.userPhone ?? "err userPhone"
                    self.date.text   =   fdata?.userDob ?? "err userDob"
                    self.city.text   =   fdata?.userCityID ?? "err userCityID"
                    
                }else{
                    self.showHUD(title: "error", details: err?.localizedDescription ?? "some error")
                }
            }
         
    }
    }
 

}
