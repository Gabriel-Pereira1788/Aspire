//
//  RouterViewModel.swift
//  Aspire
//
//  Created by Gabriel Pereira on 19/11/24.
//

import SwiftUI
import Combine

class RouterViewModel: ObservableObject {
    @Published var uiState = RouterUIState.goToHomeStack
    private var routerPublisher = PassthroughSubject<RouterUIState,Never>()
    private var cancellable: AnyCancellable?
    
    init () {
        cancellable = routerPublisher.sink { value in
            self.uiState = value
            
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}

extension RouterViewModel {
    
    func homeStack () -> some View {
        RouterStacks.makeHomeStack(routerPublisher: routerPublisher)
    }
}
