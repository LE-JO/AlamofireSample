//
//  Server.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/8/25.
//

import Foundation
import Alamofire
import Combine

class Server {
    
    static func fetchPublisher<DTO: Codable>(request: ServerRequest) -> AlamofirePublisher<DTO> {
        return AlamofirePublisher(request: request)
    }
}
