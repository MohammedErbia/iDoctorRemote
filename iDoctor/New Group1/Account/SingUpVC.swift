//
//  SingUpVC.swift
//  iDoctor
//
//  Created by mohammed on 6/7/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class SingUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)

    }
     
    @IBAction func sigup(_ sender: Any) {
        WindowManger.show(.main, animated: true)
    }
}
 
