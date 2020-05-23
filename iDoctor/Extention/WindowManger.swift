//
//  WindowManger.swift
//  Gift
//
//  Created by osama on 5/11/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation
import UIKit
enum StoryboardName: String {
    
    case account  = "Account"
    case main     = "Main"
    
    
}

class WindowManger {

    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func show(_ storyboard: StoryboardName, identifier: String? = nil, animated: Bool) {

        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller: UIViewController?
        if let identifier = identifier {
            controller = storyboard.instantiateViewController(withIdentifier: identifier)
        } else {
            controller = storyboard.instantiateInitialViewController()
        }
        
        if let controller = controller {
            
            if animated {
                UIView.transition(with: appDelegate.window!, duration: 0.35, options: [.transitionCrossDissolve], animations: {
                    appDelegate.window?.rootViewController = controller

                }, completion: nil)
                
            } else {
                appDelegate.window?.rootViewController = controller
            }
            
        }
        
    }

    
}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
