//
//  AccountVC.swift
//  iDoctor
//
//  Created by osama on 6/7/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {

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

    @IBAction func singUp(_ sender: Any) {
        let vc = UIStoryboard(name: "Account", bundle: nil).instantiateViewController(withIdentifier: "SingUpVC") as! SingUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func login(_ sender: Any) {
        let vc = UIStoryboard(name: "Account", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
