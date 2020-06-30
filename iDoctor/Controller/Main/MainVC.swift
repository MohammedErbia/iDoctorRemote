//
//  MainVC.swift
//  iDoctor
//
//  Created by mohammed on 6/17/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit 
class MainVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(err)
//        print(data)
        
//        self.get_appos(self, token: "YzRjYTQyMzhhMGI5MjM4MjBkY2M1MDlhNmY3NTg0OWI=", id: "1") { (data, err) in
//            print(err)
//            print(data)
//        } 
        
    }
}
 


extension MainVC:UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        //        cell.Categoery
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vc =  ViewController.initFromStoryboard()
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

 
