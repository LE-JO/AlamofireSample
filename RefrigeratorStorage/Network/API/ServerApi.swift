//
//  ServerApi.swift
//  RefrigeratorStorage
//
//  Created by JYJ on 7/8/25.
//

import Foundation

extension Server {
    
    class FoodAPI {
        
        class Request: ServerRequest {
            
            var serviceId: String?
            var dataType: String?
            var startIdx: String?
            var endIdx: String?
            var barCode: String?
            
            override func getUri() -> String {
                let pathComponents = [
                    NetworkManager.SERVER_URL,
                    "api",
                    "sample",
                    serviceId ?? "C005",
                    dataType ?? "json",
                    startIdx ?? "1",
                    endIdx ?? "5"
                ]
                
                var url = pathComponents.joined(separator: "/")
                if let barCode = barCode {
                    url += "/BAR_CD=\(barCode)"
                }

                return url
            }
            
            /**
             * API에서 요구하는 파라미터 키와 실제 속성명을 매핑
             */
            enum CodingKeys: String, CodingKey {
                case barCode = "BAR_CD"
            }
            
            /**
             * 객체를 JSON으로 인코딩할 때 어떤 키로 어떤 값을 넣을지 지정
             */
            override func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(barCode, forKey: .barCode)
                try super.encode(to: encoder)
            }
        }
    }
}
