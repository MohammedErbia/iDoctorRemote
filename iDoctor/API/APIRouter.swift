//
//  APIRouter.swift
//  Gift
//
//  Created by osama on 4/22/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case register(
        username:String,useremail:String,usergender:Int,password:String,userinsurance:Int,city:Int,BOB:String,userType:Int)
    case login(email:String, password:String)
   
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
            
        
        case .login:
            return "/api/login.php?"
        case .register:
            return "/api/register.php"
        
       
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
       case .register(username: let username,
                      useremail: let useremail,
                      usergender: let usergender,
                      password:let password,
                      userinsurance:let userinsurance,
                      city:let city,
                      BOB:let BOB, userType:let userType):
       return[Constant.APIParameterKey.UserName:username,
              Constant.APIParameterKey.UserEmail:useremail,
              Constant.APIParameterKey.Ginder:usergender,
              Constant.APIParameterKey.UserType:userType,
              Constant.APIParameterKey.UserPasswored:password,
              Constant.APIParameterKey.UserInsurance:userinsurance,
              Constant.APIParameterKey.city:city,
              Constant.APIParameterKey.DOB:BOB]
              
              

        case .login(email: let email, password: let password):
            return [Constant.APIParameterKey.email: email, Constant.APIParameterKey.password: password]
        
        
        
        }
    }
    
    // MARK: - headers
  private  var headers: HTTPHeaders? {
    switch self {

    case .register(username: _, useremail: _, usergender: _, password: _, userinsurance: _, city: _, BOB: _, userType: _):
        return nil
    case .login(email: _, password: _):
        return nil
    
   

    }

    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        
       // urlRequest.allHTTPHeaderFields = Headers.generateHeader()
        //urlRequest.allHTTPHeaderFields = WebserviceConfig().generateHeader()

        // Parameters
        urlRequest.setValue("application/x-www-form-urlencoded charset=utf-8", forHTTPHeaderField: "Content-Type")

        if let parameters = parameters {
            do {
                
//                urlRequest.httpBody = json!.data(using: String.Encoding.utf8.rawValue);

               // let postString = let postString = self.getPostString(params: parameters)
//                urlRequest.httpBody = postString.data(using: .utf8)
//                urlRequest.httpBody = postString.data(using: .utf8)
              //  urlRequest.httpBody = .data(using: String.Encoding.utf8)
                let par = try JSONSerialization.data(withJSONObject: parameters, options: [])
//                urlRequest.httpBody = (using: String.Encoding.utf8.rawValue);

                urlRequest.httpBody = par
                print(parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        
        /*
        if let header = headers {
            do{
//                urlRequest.allHTTPHeaderFields = headers
                
            } catch{
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }

        }*/
        
//        urlRequest.httpBody?.base64EncodedData()
        return urlRequest
    }
}
struct Headers {

/// - Returns: A configured header in the form of JSON dictionary.
func generateHeader() -> [String: Any] {
    var headerDict = [String: Any]()
    headerDict["Authorization"] = "application/json"
    headerDict["token"] = "fyfrgjirgjrigjrigjri"
    return headerDict
    }
    
}
class Reqost {
        static func login(email:String, password:String,completion:@escaping ( Login? , _ error:Error?)->Void){
        
        let data = [
            
            "email"    : email,
            "password" : password
            
        ]
        
            AF.request("https://idoctortech.com/api/login.php", method:.post, parameters: data, encoding: URLEncoding.default)
            .responseJSON { (response) in
                
                switch response.result{
                    
                case.success( _):
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(Login.self, from: response.data!)
                        //let token = data.access_token
                        //print(token)
                        
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
