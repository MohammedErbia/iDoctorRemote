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
    typealias onSuccess<T> = ((T) -> ())
    typealias onFailure = ( (_ error: Error) -> ())
    
    //MARK: - Ginaric Request Function
    
    static func Request<T>(_ object: T.Type, router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure)
        
        where T: Decodable{
        AF.request(router).responseJSON { (response) in
            switch response.result{
            case .success( _):
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(T.self, from: response.data!)
                    success(data)
                }
                catch let jsonError{
                    failure(jsonError)
                    print(jsonError)
                    print(jsonError.localizedDescription)
                }
            case .failure(let error):
                failure(error)
                print(error)
                print(error.localizedDescription)
            }        }
    }
}




