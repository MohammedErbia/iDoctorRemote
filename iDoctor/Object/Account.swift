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
    let Responce:responce?
    
    struct responce:Codable {
        let token:String?
        let status:String?
    }
}
