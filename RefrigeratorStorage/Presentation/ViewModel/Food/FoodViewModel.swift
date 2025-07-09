//
//  FoodViewModel.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/8/25.
//

import Foundation
import Combine

class FoodViewModel: BaseViewModel {
    
    private var foodUseCase: FoodDataUseCaseImpl = FoodDataUseCaseImpl()
    
    @Published
    var foodItem: FoodDTO?
}

extension FoodViewModel {
    
    func getFood() {
        foodUseCase.fetchFood(barCode: "8809394830376").receive(on: DispatchQueue.main).sink(receiveCompletion: { completion in
        }, receiveValue: { dto in
            self.foodItem = dto
        }).store(in: &disposables)
    }
}
