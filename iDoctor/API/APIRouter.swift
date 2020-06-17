//
//  APIRouter.swift
//  Gift
//
//  Created by osama on 4/22/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation
import Alamofire
///
enum APIRouter: URLRequestConvertible {
    case register(
        username:String,useremail:String,usergender:Int,password:String,userinsurance:Int,city:Int,BOB:String,userType:Int)
    case login(email:String, password:String)
    case get_objects(lat:String, long:String,type:String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .get_objects:
            return .post
        
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
            
        
        case .login:
            return "/api/login.php"
        case .register:
            return "/api/register.php"
            case .get_objects:
             return "/api/get_objects.php"
        
       
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
       case .register(
        username: let username,
        useremail: let useremail,
        usergender: let usergender,
        password:let password,
        userinsurance:let userinsurance,
        city:let city,
        BOB:let BOB, userType:let userType):
       return[
        Constant.APIParameterKey.UserName:username,
        Constant.APIParameterKey.UserEmail:useremail,
        Constant.APIParameterKey.Ginder:usergender,
        Constant.APIParameterKey.UserType:userType,
        Constant.APIParameterKey.UserPasswored:password,
        Constant.APIParameterKey.UserInsurance:userinsurance,
        Constant.APIParameterKey.city:city,
        Constant.APIParameterKey.DOB:BOB
            ]
              
              

        case .login(email: let email, password: let password):
            return [
                Constant.APIParameterKey.email: email,
                Constant.APIParameterKey.password: password
            ]
        
        
         
        case .get_objects(lat: let lat, long: let long, type: let type):
            return [
                Constant.APIParameterKey.lat: lat,
                Constant.APIParameterKey.long: long,
                Constant.APIParameterKey.type: type
            ]
            
        }
    }
    
    // MARK: - headers
    private  var headers: [String:String]? {
    switch self {

    case .register(username: _, useremail: _, usergender: _, password: _, userinsurance: _, city: _, BOB: _, userType: _):
        return nil
    case .login(email: _, password: _):
        return nil
    
    
    case .get_objects(lat: _, long: _, type: _):
        return nil
        }

    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.ProductionServer.baseURL.asURL()
       
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
         print(urlRequest)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
//        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
//        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
//        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
         
        // Parameters
        if let parameters = parameters {
            do {
                     
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
         
        if let header = headers {
            do{
                urlRequest.allHTTPHeaderFields = header
                
            } catch{
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }

        }
        return urlRequest
    }
}
 
//struct Headers {
//
///// - Returns: A configured header in the form of JSON dictionary.
//func generateHeader() -> [String: Any] {
//    var headerDict = [String: Any]()
//    headerDict["Authorization"] = "application/json"
//    headerDict["token"] = "fyfrgjirgjrigjrigjri"
//    return headerDict
//    }
//
//}


class Reqost {
        static func test(completion:@escaping ( [get_objects]? , _ error:Error?)->Void){
        let data = [
            "lat"    : "31.3547",
            "type"    : "1",
            "long" : "34.3088"
        ]
            AF.request("https://idoctortech.com/api/get_objects.php", method:.post, parameters: data)
            .responseJSON { (response) in
                switch response.result{
                case.success( _):
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode([get_objects].self, from: response.data!)
                        print(data)
                        completion(data , nil)
                        
                        
                    }
                    catch let jsonError{
                        print(jsonError)
                    }
                case .failure(let error):
                    print("error")
                    completion(nil , error)
                }

        }
    }

}
