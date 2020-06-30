//
//  ViewController.swift
//  iDoctor
//
//  Created by mohammed on 5/22/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//




import UIKit
import CoreLocation
import Kingfisher
class ViewController: UIViewController,StoryboardInitializable,CLLocationManagerDelegate {
    let locationManager = CLLocationManager() // create Location Manager object
    
    var object : [GetObject] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.register(UINib(nibName: "DoctorsTableViewCell", bundle: nil), forCellReuseIdentifier: "DoctorsTableViewCell")
        
        
        
    }
    func loadData() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        loadUser { (err, data) in
            if err == nil{
                let location = locationManager.location?.coordinate
                print(location?.latitude ?? "",location?.longitude ?? "")
                //FIXME:- fix type error number 1
                self.get_objects(self, lat: "\(location?.latitude.binade ?? 0.0)", long:  "\(location?.latitude.binade ?? 0.0)", type: /*data?.type ?? */ "1") { (data, err) in
                    if err != nil {
                        self.showHUD(title: "error", details: err?.localizedDescription ?? "error")
                    }else{
                        self.object = data ?? []
                        self.tableView.reloadData()
                    }
                    
                }
            }else{
                WindowManger.show(.account, animated: true)
            }
        }
    }}


//MARK:- table
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorsTableViewCell", for: indexPath) as! DoctorsTableViewCell
        cell.selectionStyle = .none 
        let data = object[indexPath.row]
        cell.titel.text = en ? data.objectEnName ?? "err objectEnName" : data.objectArName ?? "err objectArName"
        cell.adress.text = en ? data.objectEnAddress ?? "err objectEnAddress" : data.objectArAddress ?? "err objectArAddress"
        cell.imageuser.kf.indicatorType = .activity
        cell.imageuser.kf.setImage(with: URL(string: data.objectImage ?? ""), placeholder: UIImage(named:"personuser"))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { 
        let vc = DetailsDoctorViewController.initFromStoryboard()
        vc.object = object[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
//extension ViewController : CLLocationManagerDelegate{
////    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
////        guard let location: CLLocationCoordinate2D = manager.location?.coordinate else { return }
////        // set the value of lat and long
//////        self.latitude = location.latitude
//////        self.longitude = location.longitude
//////        print("latiTude=\(location.latitude)&longiTude=\(location.longitude)")
//////         locationManager.stopUpdatingLocation()
//////        print("latiTude=\(location.latitude)&longiTude=\(location.longitude)")
////    }
//}
