//
//  BaseViewModel.swift
//  RefrigeratorStorage
//
//  Created by JYJ on 7/9/25.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    var disposables = Set<AnyCancellable>()
}
