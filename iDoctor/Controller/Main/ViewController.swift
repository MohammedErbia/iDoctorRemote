//
//  ViewController.swift
//  iDoctor
//
//  Created by mohammed on 5/22/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//




import UIKit
 
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        Reqost.test { (data, error) in
            print(error)
            print(data)
        }
        
        tableView.register(UINib(nibName: "DoctorsTableViewCell", bundle: nil), forCellReuseIdentifier: "DoctorsTableViewCell")
            
        
        
//<<<<<<< Updated upstream
//        NetworkClient.Request(Login.self, router: .login(email: "ibrahimmabad@gmail.com", password: "ibrahim123")) { (data, err, bool) in
//            if bool{
//                print("wqenqlwk")
//            }else{
//                print(data)
//            }
//        }
//
//        Reqost.test { (data, err) in
//            print(err)
//            print(data)
        }
        
//        NetworkClient.Request(Login.self, router: .login(email: "simba11@gmail.com", password: "simba11")) { (data, err, bool) in
//            print(err)
//            print(data)
//        }
//        NetworkClient.Request(Login.self, router: .login(email: "ibrahimmabad@gmail.com", password: "ibrahim123")) { (data, err, bool) in
//            if bool{
//                print("wqenqlwk")
//            }else{
//                print(data)
//            }
//        }
//
//        Reqost.test { (data, err) in
//            print(err)
//            print(data)
//        }
//        NetworkClient.Request([get_objects].self, router: .get_objects(lat: "31.3547", long: "34.3088", type: "1")) { (data, err, bool) in
//            if bool{
//
//            }else{
//                print(err)
//                print(data)
//
//            }
//        }
    }
    
    

//MARK:- table
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorsTableViewCell", for: indexPath) as! DoctorsTableViewCell
        cell.selectionStyle = .none 
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsDoctorViewController") as! DetailsDoctorViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
