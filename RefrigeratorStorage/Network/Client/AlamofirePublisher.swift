//
//  AlamofirePublisher.swift
//  RefrigeratorStorage
//
//  Created by JYJ on 7/8/25.
//

import Foundation
import Combine
import Alamofire

struct AlamofirePublisher<DTO: Codable>: Publisher {
    typealias Output = (Bool, DTO?)
    typealias Failure = Error
    
    private let request: ServerRequest
    
    init(request: ServerRequest) {
        self.request = request
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Error, S.Input == Output {
        let subscription = AlamofireSubscription(request: self.request, subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}
