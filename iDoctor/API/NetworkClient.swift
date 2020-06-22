//
//  NetworkClient.swift
//  Gift
//
//  Created by osama on 4/22/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkClient {
    
    // Define Error and Success Type
//    typealias onSuccess<T> = ((T?, _ error: Error?) -> ())
//    typealias onFailure = ( (_ error: Error) -> ())
    
    //MARK: - Ginaric Request Function
    
    static func Request<T>(_ controller : UIViewController,_ object: T.Type, router: APIRouter, respons: @escaping ((T?, _ error: Error? ) -> ()))
        
        where T: Decodable{
            if !Networke.Netwoke.connectedToNetwork(){
                print("NO INTRINT CONICTION")
                respons(nil,nil )
                let vc = UIAlertController.init(title: "errror", message: "", preferredStyle: .alert)
                
                vc.addAction(UIAlertAction.init(title: "error", style: .default, handler: { (alrt) in
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NotificationViewController") as! NotificationViewController
                    controller.navigationController?.pushViewController(vc, animated: true)
                }))
                controller.present(vc, animated: true, completion: nil)
                
            }else{
                
                controller.showHUDLoder()
//                let datatest = AF.request("https://idoctortech.com/api/login.php", method:.post, parameters: data)
//                .responseJSON { (response) in
//                    switch response.result{
//                    case.success( _):
                
                AF.request("dmklqmwel", method: .get, parameters: nil  ,headers: nil).responseJSON { (response) in
                  
                        print(response.result)
                   
                }
                
                AF.request(router).responseJSON { (response) in
                    print(response.result)
                    switch response.result{
                        
                    case .success( _):
                        do {
                             
//                            controller.dismiss(animated: true, completion: nil)
                            let decoder = JSONDecoder()
                            let data = try decoder.decode(T.self, from: response.data!)
                            respons(data, nil )
                            controller.hidHUD()
                        }
                        catch let jsonError{
                            controller.dismiss(animated: true, completion: nil)
                            respons(nil,jsonError )
//                            failure(jsonError)
                            controller.hidHUD()
                            print(jsonError)
                            print(jsonError.localizedDescription)
                            controller.showHUD(title: jsonError.localizedDescription)
                        }
                    case .failure(let error):
                        controller.dismiss(animated: true, completion: nil)
                        respons(nil,error )
//                        failure(error)
                        controller.hidHUD()
                        print(error)
                        print(error.localizedDescription)
                        controller.showHUD(title: error.localizedDescription)
                    }              }
            }
    }
}
    



