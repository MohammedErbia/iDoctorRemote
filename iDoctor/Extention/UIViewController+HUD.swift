//
//  ViewController.swift
//  testhud
//
//  Created by mohammed on 5/3/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import UIKit
//import WSProgressHUD
 
var globColor : UIColor = #colorLiteral(red: 0, green: 0.8666666667, blue: 0.4470588235, alpha: 1)
extension UIViewController {
    func showHUDLoder(){
        let alert = UIAlertController(title: nil, message: " ", preferredStyle: .alert)
        let heightview :NSLayoutConstraint = NSLayoutConstraint(item: alert.view ?? UIView(), attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 80)
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 15 , y: 5, width: 50, height: 50)) as UIActivityIndicatorView
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        loadingIndicator.transform = transform
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.color = globColor
        loadingIndicator.startAnimating()
        alert.view.addConstraint(heightview)
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
    func hidHUD() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showHUD(title:String? = nil , details: String? = nil) {
        let alert = UIAlertController(title: title ?? nil, message: details ?? nil, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func showHUDSetTime(_ titel : String, hideAfter:TimeInterval? = nil){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
         self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + ((hideAfter == nil) ? 2 : hideAfter ?? 2) ) {
            self.dismiss(animated: true, completion:  nil)
        }
        
        
    }
        //AlertButton
         func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        //
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                if options.count == 0 {
                    let OKAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                         completion(0)
                    })
                    alertController.addAction(OKAction)
                } else {
        
                    for (index, option) in options.enumerated() {
                         alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                            completion(index)
                        }))
                    }
                }
                self.present(alertController, animated: true, completion: nil)
            }
}


//https://stackoverflow.com/questions/29633938/swift-displaying-alerts-best-practices
//extension UIViewController {
////    presentAlertWithTitle(title: "medo", message: "test", options: "Done","error", "ok ") { (tt) in
////        if tt == 0{
////            print("00000000000")
////        }else if tt == 1{
////            print("11111111111")
////        }else{
////            print("else else")
////        }
////
////
////    }
//    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
//
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        if options.count == 0 {
//            let OKAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
//                 completion(0)
//            })
//            alertController.addAction(OKAction)
//        } else {
//
//            for (index, option) in options.enumerated() {
//                 alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
//                    completion(index)
//                }))
//            }
//        }
//        self.present(alertController, animated: true, completion: nil)
//    }
//
//}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Do any additional setup after loading the view.
//        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
//
//        alert.view.tintColor = UIColor.black
////        alert.view.backgroundColor = .black
//        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
//        loadingIndicator.hidesWhenStopped = true
//        loadingIndicator.style = UIActivityIndicatorView.Style.gray
//        loadingIndicator.startAnimating();
//
//        alert.view.addSubview(loadingIndicator)
//        present(alert, animated: true, completion: nil)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.dismiss(animated: true, completion: nil)
//        }

//MAKE:- last hud hhhh

//extension UIViewController {
//    func hidHUD (){
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
//            hud?.dismiss()
//        })
//    }
//    func showHUDLoder() {
//        handleReachability()
//        if let nav = navigationController{
//            hud = WSProgressHUD(view: nav.view)
//        }else if let tab = tabBarController {
//            hud = WSProgressHUD(view: tab.view)
//        }else{
//            hud = WSProgressHUD(view: UIViewController().view)
//        }
//
//        func viewWillAppear(_ animated: Bool) {
//            hidHUD ()
//        }
//
//        if let hud = hud {
//            view.addSubview(hud)
//            //            tabBarController.
//        }
//        hud?.show(with: .clear)
//    }
//    func showHUD(title:String? = nil , details: String? = nil) {
//
//        var hud: WSProgressHUD?
//        if let nav = navigationController{
//            hud = WSProgressHUD(view: nav.view)
//        }else if let tab = tabBarController {
//            hud = WSProgressHUD(view: tab.view)
//        }else{
//            hud = WSProgressHUD(view: UIViewController().view)
//        }
//        if let hud = hud {
//            view.addSubview(hud)
//        }
//        (title != nil) ?  hud?.show(nil, status: "\(title ?? "")\n\(details ?? "")", maskType: .clear) : hud?.show(nil, status: "\(details ?? "")", maskType: .clear)
//    }
//    func showHUDAnimtionTitel(_ titel : String, hideAfter:TimeInterval? = nil){
//        var hud: WSProgressHUD?
//        if let nav = navigationController{
//            hud = WSProgressHUD(view: nav.view)
//        }else if let tab = tabBarController {
//            hud = WSProgressHUD(view: tab.view)
//        }else{
//            hud = WSProgressHUD(view: UIViewController().view)
//        }
//
//        if let hud = hud {
//            view.addSubview(hud)
//        }
//        hud?.showShimmeringString(titel, maskType: .clear)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + ((hideAfter == nil) ? 2 : hideAfter ?? 2) ) {
//            if !hud!.accessibilityElementsHidden{
//                hud?.dismiss()
//            }
//        }
//
//
//    }
//}

///////////////////


//more advantege


//    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
//
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
////        alertController.view.borderWidth = 1
////        alertController.view.borderColor = #colorLiteral(red: 0, green: 0.8666666667, blue: 0.4470588235, alpha: 1)
//        alertController.view.backgroundColor = .clear
//        alertController.view.tintColor = .white
//
//
//         let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        view.backgroundColor = .red
//
//        let lab = UILabel(frame: CGRect(x: 20  , y: 0 , width: 50 , height: 50 ))
//        lab.text = "X"
//        lab.font = UIFont.systemFont(ofSize: 25)
//        lab.textColor = .white
//
//
//        alertController.view.addSubview(view)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        view.addGestureRecognizer(tap)
//        alertController.view.addSubview(lab)
//        if options.count == 0 {
//            let OKAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
//                completion(0)
//            })
//            alertController.addAction(OKAction)
//        } else {
//
//            for (index, option) in options.enumerated() {
//                alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
//                    completion(index)
//                }))
//            }
//        }
//        self.present(alertController, animated: true, completion: nil)
//    }
//    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
//        // handling code
//        print("tap one")
//        self.dismiss(animated: true, completion: nil)
//    }
