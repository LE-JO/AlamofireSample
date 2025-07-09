//
//  FoodDataUseCase.swift
//  RefrigeratorStorage
//
//  Created by JYJ on 7/8/25.
//

import Foundation
import Combine

protocol FoodDataUseCase {
    func fetchFood(barCode: String) -> AnyPublisher<FoodDTO?, Error>
}

class FoodDataUseCaseImpl: FoodDataUseCase {
    private let repository: FoodRepositoryImpl
    
    init() {
        repository = FoodRepositoryImpl()
    }
    
    func fetchFood(barCode: String) -> AnyPublisher<FoodDTO?, Error> {
        return repository.fetchFood(barCode: barCode)
    }
}
