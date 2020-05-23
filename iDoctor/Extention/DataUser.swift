//
//  DataUser.swift
//  Gift
//
//  Created by mohammed on 5/5/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation


struct userModel: Codable {
    var name: String
    var phone:String
    var city:String
    var sex:String
    var id:Int
    var token:String 
    
    
    
}

///saveUser(user: userModel(name: "mohammed"))
func saveUser(user : userModel) {
    if let encoded = try? JSONEncoder().encode(user) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "SavedUser")
    }
}
///loadUser { (error, user) in
///    if let user = user{
///        print("user:- ",user.name)
///    }else{
///        print(error)
///    }
///}
func loadUser(handler: (_ Error : Error? ,_ user : userModel? )-> Void){
    let defaults = UserDefaults.standard
    if let savedPerson = defaults.object(forKey: "SavedUser") as? Data {
        let decoder = JSONDecoder()
        if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
            handler(nil,loadedPerson)
        }
    }else{
        handler(Error.self as? Error,nil)
    }
}
///removeUser()
func removeUser(){
     let defaults = UserDefaults.standard
    defaults.removeObject(forKey: "SavedUser")
//    WindowManger.show(.account, animated: true)
}
