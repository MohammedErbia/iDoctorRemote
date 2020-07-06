//
//  Account.swift
//  iDoctor
//
//  Created by osama on 6/16/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import Foundation
/**
 
 "Responce": {
         "token": "YzRjYTQyMzhhMGI5MjM4MjBkY2M1MDlhNmY3NTg0OWI=",
         "status": "OK"
     }
 }
 */

struct Login:Codable {
    var Responce:responce?
    
    struct responce:Codable {
        var token:String?
        var status:String?
        var id : String?
    }
}
 



