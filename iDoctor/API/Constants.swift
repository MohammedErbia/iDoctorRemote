//
//  Constants.swift
//  Gift
//
//  Created by osama on 4/22/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation
import Alamofire
struct Constant {
    struct ProductionServer {
        //https://tamazuj.sa
        static let baseURL = "https://idoctortech.com"
    }
    //MARK: - API Parametr Key
    struct APIParameterKey {
        static let email = "email"
        static let password = "password"
        static let name = "name"
        // Register:-
        static let UserName = "user_name"
        static let UserEmail = "user_email"
        static let UserPasswored = "user_pass"
        static let DOB = "user_dob"
        static let Ginder = "user_gender"
        static let UserInsurance = "user_insurance"
        static let UserType = "user_type"
        static let UserCity = "user_city_id"
        static let UserImage = "user_image"
        static let phone = "phone"
        static let city = "city"
        static let gender = "gender"
        static let tokenNotfiaction = "tokenNotfiaction"
        static let rate = "rate"
        
//        static let user_id = "user_id"
//        static let product_id = "product_id"
//        static let comment = "comment"
//        static let key = "key"
        
        
        
        static let id = "id"
        static let token = "token"
        static let userId = "user_id"
        
        
        //MARK:- get_objects
        static let lat = "lat"
        static let long = "long"
        static let type = "type"
        
    }
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
struct WebserviceConfig {
    /// Generates common headers specific to APIs. Can also accept additional headers if demanded by specific APIs.
    ///
    /// - Returns: A configured header in the form of JSON dictionary.
    func generateHeader() -> [String: String] {
        var headerDict = [String: String]()
        headerDict["Content-Type"] = "application/json"
        
        return headerDict
    }
}
