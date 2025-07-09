//
//  ServerRequest.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/8/25.
//

import Foundation

class ServerRequest: NSObject, Codable {
    
    var uri: String = ""
    
    // 기본 초기화
    override init() {
        super.init()
    }

    // URI 초기화
    convenience init(uri: String) {
        self.init()
        self.uri = uri
    }
    
    func getUri() -> String {
        return uri
    }

    // ServerRequest 객체를 딕셔너리로 변환
    func toDictionary() -> [String: Any] {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            return jsonObject as? [String: Any] ?? [:]
        } catch {
            print("Error creating dictionary: \(error)")
            return [:]
        }
    }
}
