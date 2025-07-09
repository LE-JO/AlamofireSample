//
//  FoodRepository.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/8/25.
//

import Foundation
import Combine

protocol FoodRepository {
    func fetchFood(barCode: String) -> AnyPublisher<FoodDTO?, Error>
}

class FoodRepositoryImpl: FoodRepository {
    
    /**
     * 음식 정보 조회
     */
    func fetchFood(barCode: String) -> AnyPublisher<FoodDTO?, Error> {
        let request = Server.FoodAPI.Request()
        request.barCode = barCode
        
        /**
         * 컴파일러가 FoodDTO으로 타입을 추론
         */
        return Server.fetchPublisher(request: request)
            .map { (isSucc, dto: FoodDTO?) in
                
                return (dto)
            }.eraseToAnyPublisher()
    }
}
