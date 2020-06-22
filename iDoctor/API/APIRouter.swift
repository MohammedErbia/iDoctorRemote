//
//  APIRouter.swift
//  Gift
//
//  Created by osama on 4/22/20.
//  Copyright © 2020 Gift. All rights reserved.
//


//
//  APIRouter.swift
//  Gift
//
//  Created by osama on 4/22/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation
import Alamofire

//let v =  AF.request(<#T##convertible: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Encodable?#>, encoder: <#T##ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)

//url + path
// mathod
// heder
// parameter
// encoder
enum myreqest : String {
    case test = "test"
    private var teste : HTTPMethod {
        switch self {
        case .test:
            return .post
        }
    }
}





enum APIRouter :URLRequestConvertible {
    
    case register(
        username:String,useremail:String,usergender:Int,password:String,userinsurance:Int,city:Int,BOB:String,userType:Int)
    case login(email:String, password:String)
    case get_objects(lat:String, long:String,type:String)
    case get_insurances
    
     
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .get_objects:
            return .post
        //        case
        case .get_insurances:
            return .post
        }
    }
    
    
    // MARK: - Path
    private var path: String {
        switch self {
            
            
        case .login:
            ///api/v1/user/login
            ////api/login.php
            return "/api/login.php"
        case .register:
            return "/api/register.php"
        case .get_objects:
            return "/api/get_objects.php"
            
            
        case .get_insurances:
            return "/api/get_insurances.php"
        }
    }
    
    // MARK: - Parameters
    private var parameters: [String:Any]? {
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
            
        case .get_insurances:
            return nil
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
        case .get_insurances:
            return nil
        }
        
    }
    
    // MARK: - URLRequestConvertible
    
    
    
    func asURLRequest() throws -> URLRequest {

        let url = try Constant.ProductionServer.baseURL.asURL()



        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.cachePolicy = .reloadIgnoringCacheData



        //                ReferenceType = NS
        //        CachePolicy = NSUR
        //               /NetworkServiceType/ HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)



        //        var components = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        //        let query = components.url!.appendingPathComponent(path).query



        //        components.queryItems

        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")


        //        urlRequest.Par//.allHTTPHeaderFields = Headers.generateHeader()
        //        urlRequest.allHTTPHeaderFields = WebserviceConfig().generateHeader()
        
        // Parameters
        if let parameters = parameters {
//            guard let parameters = parameters else { return }
          
            for (_, value) in parameters {
                urlRequest.httpBody = "\(value)".data(using: String.Encoding.utf8)!
            }
//               //Encoding
//                let encoding: ParameterEncoding = {
//                    switch method {
//                    case .get:
//                        return URLEncoding.default
//                     case .post:
//                        return URLEncoding.default
//                    default:
//                        return JSONEncoding.default
//                    }
//                }()
//
//                return try encoding.encode(urlRequest, with: parameters)
            
            
            do {
                print(parameters)
                
                //                var components = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
                //
                ////                components.
                ////
                //                    for (S,A) in parameters{
                //                        let b = [URLQueryItem(name: S, value: A as? String)]
                //                        print(b)
                //                        components.queryItems = b
                //                    }
                ////                    URLQueryItem(name: "key1", value: "NeedToEscape=And&")
                //
                //                let query = components.url!.appendingPathComponent(path).query
                //                print(query)
                //                let data = Data(query!.utf8)
                //
                //                urlRequest.httpBodyStream?.open()
                //                urlRequest.httpBody  = try JSONSerialization.data(withJSONObject: parameters, options: [])
                //                print(d.description)

                //MARK:- httpBody
                //                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])

//                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                //                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
                //                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .sortedKeys)
                //                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .withoutEscapingSlashes)
                //                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions())
                //                let d = String(format:"email=%@&password=%@","simba11@gmail.com","simba11").data(
                //                   using: String.Encoding.utf8,allowLossyConversion: false)
                //
                //                urlRequest.httpBody = d!

                //                urlRequest.
                //                let postString = "email=simba11@gmail.com&password=simba11"
                //                urlRequest.httpBody = postString.data(using: .utf8)//(using: .utf8, usingEncoding: String.Encoding)

                //

                //               let postString = "email=simba11@gmail.com&password=simba11";
                //
                //               urlRequest.httpBody = postString.data(using: String.Encoding.utf8);

                print("dddd")


                //MARK:- Encoding osama
                //                              let encoding: ParameterEncoding = {
                //                                  switch method {
                //                                  case .get:
                //                                      return URLEncoding.default
                //                                  case .post:
                //                                    return JSONEncoding.default
                //
                //                                  default:
                //                                      return JSONEncoding.default
                //                                  }
                //                              }()
                //                let bb = try URLEncoding.httpBody.encode(urlRequest, with: parameters)
                //                urlRequest = bb
                //////////////////////
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }

        }

        if let header = headers {
            do{
                urlRequest.allHTTPHeaderFields = header

            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }

        }



        return urlRequest
    }
    
    
    /////??????????????????????????????????/////////////////////?????????????/////////////////////?????????????
//    func testmedo(completion:@escaping ( Login? , _ error:Error?)->Void)  {
//        guard let url = try? Constant.ProductionServer.baseURL.asURL() else {
//            return
////            print("")
//        }
//        AF.request(url.appendingPathComponent(path), method:HTTPMethod(rawValue: method.rawValue), parameters: parameters)
//                    .responseJSON { (response) in
//                        switch response.result{
//                        case.success( _):
//                            do {
//                                let decoder = JSONDecoder()
//                                let data = try decoder.decode(Login.self, from: response.data!)
//                                print(data)
//                                completion(data , nil)
//                            }
//                            catch let jsonError{
//                                print(jsonError)
//                                completion(nil , jsonError)
//                            }
//                        case .failure(let error):
//                            print("error",error)
//                            completion(nil , error)
//                        }
//                }
//
//    }
    
     
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

//extension Dictionary {
//    func percentEncoded() -> Data? {
//        return map { key, value in
//            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            return escapedKey + "=" + escapedValue
//        }
//        .joined(separator: "&")
//        .data(using: .utf8)
//    }
//}

//extension CharacterSet {
//    static let urlQueryValueAllowedw: CharacterSet = {
//        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
//        let subDelimitersToEncode = "!$&'()*+,;="
//
//        var allowed = CharacterSet.urlQueryAllowed
//        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
//        return allowed
//    }()
//}

class Reqost {
    
    
    static func test(completion:@escaping ( Login? , _ error:Error?)->Void){
        let data = [
            "email"    : "ibrahimmabad@gmail.com",
            "password"    : "ibrahim123",
        ]
        let datatest = AF.request("https://idoctortech.com/api/login.php", method:.post, parameters: data)
            .responseJSON { (response) in
                switch response.result{
                case.success( _):
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(Login.self, from: response.data!)
                        print(data)
                        completion(data , nil)
                        
                        //URLEncodedFormParameterEncoder: 0x600001694020>
                    }
                    catch let jsonError{
                        print(jsonError)
                    }
                case .failure(let error):
                    print("error")
                    completion(nil , error)
                }
        }
        print(datatest.data)
    }
//    static func data(completion:@escaping ( [get_objects]? , _ error:Error?)->Void){
//        let data = ["type": "1", "lat": "32", "long": "232"]
//        let datta :HTTPHeader = ["type": "1", "lat": "32", "long": "232"]
//        let tester = AF.request("https://idoctortech.com/api/get_objects.php", method:.post, parameters: data ,headers: datta)
//
//            .responseJSON { (response) in
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode([get_objects].self, from: response.data!)
//                        print(data)
//                        completion(data , nil)
//
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//
//
//        }
//        print(tester)
//    }
    
    
}



























 
