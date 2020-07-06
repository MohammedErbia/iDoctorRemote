//
//  getInsurances.swift
//  iDoctor
//
//  Created by osama on 6/16/20.
//  Copyright © 2020 iDoctor. All rights reserved.
//

import Foundation
/*
 {
        "insurance_id": "1",
        "insurance_en_name": "Be Safe Insurance com",
        "insurance_ar_name": "كن في امان",
        "insurance_discount": "10",
        "insurance_state": "1"
    },
 */

struct get_ins: Codable {
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
