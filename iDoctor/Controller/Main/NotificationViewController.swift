//
//  NotificationViewController.swift
//  iDoctor
//
//  Created by mohammed on 6/16/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController,StoryboardInitializable {
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
}
    
    
}
extension NotificationViewController : UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }


}
 
