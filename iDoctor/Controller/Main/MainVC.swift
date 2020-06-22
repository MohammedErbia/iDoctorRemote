//
//  MainVC.swift
//  iDoctor
//
//  Created by mohammed on 6/17/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkClient.Request(self,Login.self, router: .login(email: "simba11@gmail.com", password: "simba11")) { (data, err) in
            print(err)
            print(data)
        }
        
//        NetworkClient.Request(self, , router: .r, respons: <#T##((Decodable?, Error?) -> ())##((Decodable?, Error?) -> ())##(Decodable?, Error?) -> ()#>)
        
//        test(medo: "test1","test2","test3", t: 1)
//        Reqost.data { (data, err) in
//            print(err)
//            print(data)
//
//        }
//        Reqost.test { (data, err) in
//            print(data)
//        }
//        let d =  APIRouter.testmedo(<#APIRouter#>)
//        print(d)
//
        
//        NetworkClient.Request(self, get_objects.self, router: .get_objects(lat: "32", long: "232", type: "1")) { (data, err) in
//            print("err:-",err)
//            print(data)
//        }
        
    }
    /// arry of test
//    func test(medo : String... , t : Int){
//        for i in medo{
//            print(i, "count",medo.firstIndex(of: i))
//        }
//    }
    
    
    
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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

 
