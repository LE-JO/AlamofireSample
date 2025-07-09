//
//  ContentView.swift
//  RefrigeratorStorage
//
//  Created by QMIT_iOS on 7/8/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject
    var viewModel = FoodViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            viewModel.getFood()
        }
    }
}

#Preview {
    ContentView()
}
