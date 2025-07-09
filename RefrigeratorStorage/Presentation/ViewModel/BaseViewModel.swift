//
//  BaseViewModel.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/9/25.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    var disposables = Set<AnyCancellable>()
}
