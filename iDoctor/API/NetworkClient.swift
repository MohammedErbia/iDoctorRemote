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
    
static func Request<T>(_ object: T.Type, router: APIRouter, respons: @escaping ((T?, _ error: Error?, _ NotNetworke : Bool) -> ()))
        
        where T: Decodable{
            if !Networke.Netwoke.connectedToNetwork(){
                print("NO INTRINT CONICTION")
                respons(nil,nil, true)
                
            }else{
                AF.request(router).responseJSON { (response) in
                    switch response.result{
                    case .success( _):
                        do {
                            let decoder = JSONDecoder()
                            let data = try decoder.decode(T.self, from: response.data!)
                            respons(data, nil, false)
                        }
                        catch let jsonError{
                            respons(nil,jsonError, false)
//                            failure(jsonError)
                            print(jsonError)
                            print(jsonError.localizedDescription)
                        }
                    case .failure(let error):
                        respons(nil,error, false)
//                        failure(error)
                        print(error)
                        print(error.localizedDescription)
                    }              }
            }
    }
}




