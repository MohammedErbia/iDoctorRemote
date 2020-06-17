//
//  LoginVC.swift
//  iDoctor
//
//  Created by osama on 6/7/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//
import UIKit
class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
                

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func login(_ sender: Any) {
//         WindowManger.show(.main, animated: true)
                NetworkClient.Request(Login.self, router: .login(email: "ibrahimmabad@gmail.com", password: "ibrahim123")) { (data, err, bool) in
                    if bool{
                        print("wqenqlwk")
                    }else{
                        print(data,"----------")
                        print("wqenqlwk")

                    }
                }
        
    }
}
