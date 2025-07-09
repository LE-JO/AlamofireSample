//
//  AlamofireSubscription.swift
//  RefrigeratorStorage
//
//  Created by JYJ on 7/8/25.
//

import Foundation
import Combine
import Alamofire

final class AlamofireSubscription<DTO: Codable, SubscriberType: Subscriber>: Subscription where SubscriberType.Input == (Bool, DTO?), SubscriberType.Failure == Error {
    
    private var request: Request?
    private var subscriber: SubscriberType?
    
    init(method: HTTPMethod = .get, request: ServerRequest, subscriber: SubscriberType) {
        self.subscriber = subscriber
        
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
        self.request = AlamofireClient.shared.session.request(request.getUri(), method: method, parameters: request.toDictionary(), encoding: encoding)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let data):
                    do {
                        let dto = try JSONDecoder().decode(DTO.self, from: data)
                        
                        _ = self.subscriber?.receive((true, dto))
                        self.subscriber?.receive(completion: .finished)
                    } catch {
                        self.subscriber?.receive(completion: .failure(error))
                    }
                case .failure(let error):
                    self.subscriber?.receive(completion: .failure(error))
                }
            }
    }
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        request?.cancel()
        subscriber = nil
    }
}
