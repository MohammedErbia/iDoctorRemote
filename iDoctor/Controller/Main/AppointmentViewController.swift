//
//  AppointmentViewController.swift
//  iDoctor
//
//  Created by mohammed on 6/16/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.table.estimatedRowHeight = 100
            self.table.rowHeight = UITableView.automaticDimension 
        table.register(UINib(nibName: "appointmentTableViewCell", bundle: nil), forCellReuseIdentifier: "appointmentTableViewCell")
    }
    
 
}
 

extension AppointmentViewController : UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentTableViewCell", for: indexPath) as! appointmentTableViewCell
        cell.selectionStyle = .none

        return cell
    }
//TimeVC
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = TimeVC.initFromStoryboard()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

}
