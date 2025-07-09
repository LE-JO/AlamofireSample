//
//  Bundle.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/9/25.
//

import Foundation

extension Bundle {
    
    var baseURL: String {
        return infoDictionary?["BASE_URL"] as? String ?? ""
    }
}
