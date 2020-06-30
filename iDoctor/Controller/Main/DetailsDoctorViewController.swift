//
//  DetailsDoctorViewController.swift
//  iDoctor
//
//  Created by mohammed on 5/23/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit
import Kingfisher
class DetailsDoctorViewController: UIViewController,StoryboardInitializable {
    var object :  GetObject?
    
    @IBOutlet weak var imageUI: UIImageView!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var subtitel: UILabel!
    @IBOutlet weak var descriptionUI: UILabel!
    @IBOutlet weak var adress: UILabel!
    
    
    @IBOutlet weak var sat_on   : UILabel!
    @IBOutlet weak var sat_off  : UILabel!
    @IBOutlet weak var sun_on   : UILabel!
    @IBOutlet weak var sun_off  : UILabel!
    @IBOutlet weak var mon_on   : UILabel!
    @IBOutlet weak var mon_off  : UILabel!
    @IBOutlet weak var tues_on  : UILabel!
    @IBOutlet weak var tues_off : UILabel!
    @IBOutlet weak var wed_on   : UILabel!
    @IBOutlet weak var wed_off  : UILabel!
    @IBOutlet weak var thurs_on : UILabel!
    @IBOutlet weak var thurs_off: UILabel!
    @IBOutlet weak var fri_on   : UILabel!
    @IBOutlet weak var fri_off  : UILabel!
    var timedata : GetObjectAgenda?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titel.text = en ? object?.objectEnName ?? "err objectEnName" : object?.objectArName ?? "err objectArName"
         adress.text = en ? object?.objectEnAddress ?? "err objectEnAddress" : object?.objectArAddress ?? "err objectArAddress"
         imageUI.kf.indicatorType = .activity
         imageUI.kf.setImage(with: URL(string: object?.objectImage ?? ""), placeholder: UIImage(named:"personuser"))
        descriptionUI.text = en ? object?.objectEnDesc?.html2String ?? " err objectEnDesc" : object?.objectArDesc?.html2String ?? "err objectArDesc"
        
        loadUser { (err, data) in
            
            //FIXME:- fix id in object
            self.get_object_agendas(self, id:/* data?.id ?? */"1") { (time, err) in
                print(time ?? "")
                if err == nil{
                    self.timedata = time?.first
                    let day = time?.first
                    self.sat_on.text     =  day?.satOn   ?? "-"
                    self.sat_off.text    =  day?.satOff   ?? "-"
                    self.sun_on.text     =  day?.sunOn   ?? "-"
                    self.sun_off.text    =  day?.sunOff   ?? "-"
                    self.mon_on.text     =  day?.monOn   ?? "-"
                    self.mon_off.text    =  day?.monOff   ?? "-"
                    self.tues_on.text    =  day?.tuesOn   ?? "-"
                    self.tues_off.text   =  day?.tuesOff   ?? "-"
                    self.wed_on.text     =  day?.wedOn   ?? "-"
                    self.wed_off.text    =  day?.wedOff   ?? "-"
                    self.thurs_on.text   =  day?.thursOn   ?? "-"
                    self.thurs_off.text  =  day?.thursOff   ?? "-"
                    self.fri_on.text     =  day?.friOn   ?? "-"
                    self.fri_off.text    =  day?.friOff   ?? "-"
                }else{
                    self.showHUD(title: "error", details: err?.localizedDescription ?? "error")
                }
            }
        }
    }
     
    @IBAction func appApoiment(_ sender: Any) {
        let vc = TimeVC.initFromStoryboard()
        vc.object = self.object
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
