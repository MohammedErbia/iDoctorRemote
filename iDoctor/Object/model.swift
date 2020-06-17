//
//  model.swift
//  iDoctor
//
//  Created by mohammed on 6/17/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import Foundation


// MARK: - GetObjects
 
//struct get_objects: Codable {
//    let objectID, objectArName, objectEnName, objectArDesc: String
//    let objectEnDesc, objectCityID, objectArAddress, objectEnAddress: String
//    let objectType, objectOwnerID, objectImage, objectArSpic: String
//    let objectEnSpic, objectLat, objectLong, objectCreatedAt: String
//    let distance: String
//
//    enum CodingKeys: String, CodingKey {
//        case objectID = "object_id"
//        case objectArName = "object_ar_name"
//        case objectEnName = "object_en_name"
//        case objectArDesc = "object_ar_desc"
//        case objectEnDesc = "object_en_desc"
//        case objectCityID = "object_city_id"
//        case objectArAddress = "object_ar_address"
//        case objectEnAddress = "object_en_address"
//        case objectType = "object_type"
//        case objectOwnerID = "object_owner_id"
//        case objectImage = "object_image"
//        case objectArSpic = "object_ar_spic"
//        case objectEnSpic = "object_en_spic"
//        case objectLat = "object_lat"
//        case objectLong = "object_long"
//        case objectCreatedAt = "object_created_at"
//        case distance
//    }
//}
struct get_objects : Codable {
    var object_id : String?
//    var object_ar_name : String?
//    var object_en_name : String?
//    var object_ar_desc : String?
//    var object_en_desc : String?
//    var object_city_id : String?
//    var object_ar_address : String?
//    var object_en_address : String?
}

 

struct get_insurances: Codable {
    let insuranceID: String?
    let insuranceEnName: String?
    let insuranceArName: String?
    let insuranceDiscount: String?
    let insuranceState: String?

    enum CodingKeys: String, CodingKey {
        case insuranceID = "insurance_id"
        case insuranceEnName = "insurance_en_name"
        case insuranceArName = "insurance_ar_name"
        case insuranceDiscount = "insurance_discount"
        case insuranceState = "insurance_state"
    }
}
