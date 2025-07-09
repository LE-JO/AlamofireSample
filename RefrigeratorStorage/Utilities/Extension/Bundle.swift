//
//  Bundle.swift
//  RefrigeratorStorage
//
//  Created by JYJ on 7/9/25.
//

import Foundation

extension Bundle {
    
    var baseURL: String {
        return infoDictionary?["BASE_URL"] as? String ?? ""
    }
}
