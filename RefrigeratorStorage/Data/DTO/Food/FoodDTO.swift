//
//  FoodDTO.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/8/25.
//

import Foundation

struct FoodDTO: Codable {
    var C005: C005?
}

struct C005: Codable {
    var totalCount: String?
    
    enum CodingKeys: String, CodingKey {
       case totalCount = "total_count"
   }
}
