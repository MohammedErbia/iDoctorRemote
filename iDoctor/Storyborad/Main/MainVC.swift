//
//  MainVC.swift
//  iDoctor
//
//  Created by osama on 6/17/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit


class MainVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkClient.Request(self,get_insurances.self, router: .get_insurances) { (data, err) in
            print(err)
            print(data)
        }
    }
    
}
 


extension MainVC:UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        //        cell.Categoery
        return cell
    }
    
    
    
    
}
