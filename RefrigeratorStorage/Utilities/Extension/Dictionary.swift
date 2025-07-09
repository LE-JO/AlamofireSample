//
//  Dictionary.swift
//  RefrigeratorStorage
//
//  Created by JYJ on 7/8/25.
//

import Foundation

extension Dictionary {
    
    /**
     * Dictionary to Json 문자열 변환
     */
    func convertToJSONString() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: []) as Data
            if let json = String(data: jsonData, encoding: .utf8) {
                return json
            }
        } catch {
            print(error.localizedDescription)
        }
        return "{}"
    }
}
