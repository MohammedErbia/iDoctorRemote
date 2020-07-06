//
//  TimeVC.swift
//  iDoctor
//
//  Created by mohammed on 6/18/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class TimeVC: UIViewController,StoryboardInitializable {
     
    var object :  GetObject?
    var object1 :  GetObject?
    var object3 :  GetObject?
    var object2 :  GetObject?
    
    @IBOutlet weak var pickerDate: UIDatePicker!
    @IBOutlet weak var pickertime: UIDatePicker!
    
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var datelable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         
        getDate()
        gettime()
        pickerDate.datePickerMode = .date
        pickerDate.addTarget(self, action: #selector(editbutton), for:.valueChanged )
        
        pickertime.datePickerMode = .time
        pickertime.addTarget(self, action: #selector(gettimeaction), for:.valueChanged )
         
    }
    @objc func editbutton(){
        getDate()
    }
    func getDate() {
        let formmat = DateFormatter()
        formmat.dateFormat = "dd MMM yyy"
        self.datelable.text = formmat.string(from: pickerDate.date)
        
    }
    @objc func gettimeaction(){
        gettime()
    }
    func gettime() {
        let formmat = DateFormatter()
        formmat.timeStyle = .short
        self.timelabel.text = formmat.string(from: pickertime.date)
    }
    func datenow() -> String {
        let formmat = DateFormatter()
        formmat.dateFormat = "dd MMM yyy"
        return formmat.string(from: Date())
        
    }
    func timenow() -> String {
        let formmat = DateFormatter()
        formmat.timeStyle = .short
        return formmat.string(from: Date())
    }
    
    @IBAction func next(_ sender: Any) {
        
        let vc =  orderViewController.initFromStoryboard()
        guard let time = self.timelabel.text ,time != timenow() else {
            showHUD(  details: en ?  "Please choose the right time for you":"رجاء اختار الوقت المناسب لك ")
            return
        }
        
        guard let date = self.datelable.text ,date != datenow() else {
            showHUD(  details: en ?  "Please choose the date for you": "يرجى اختيار التاريخ المناسب لك")
            return
        }
        
        vc.object = self.object
        vc.time = time
        vc.date = date
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
