//
//  HomeStackViewModel.swift
//  Aspire
//
//  Created by Gabriel Pereira on 19/11/24.
//

import SwiftUI
import Combine

class HomeStackViewModel: ObservableObject {
    @Published var action:Int? = nil
    
    private var routerPublisher:PassthroughSubject<RouterUIState,Never>!
    private var homeStackPublisher = PassthroughSubject<HomeStackActions,Never>()
    private var cancellable:AnyCancellable?
    private var currentMode:SelectionMode = .easy
    
    init() {
        cancellable = self.homeStackPublisher.sink { value in
            if case HomeStackActions.meditationScreen(let mode) = value {
                self.currentMode = mode
            }
            
            self.action = value.action
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func setRouterPublisher(_ toRouterPublisher:PassthroughSubject<RouterUIState,Never>){
        routerPublisher = toRouterPublisher
    }

}

extension HomeStackViewModel {
    
    
    func renderHomeScreen() -> some View {
         HomeStackScreens.makeHomeScreenView(homeStackPublisher: homeStackPublisher)
    }
    
    func renderMeditationScreen() -> some View {
        HomeStackScreens.makeMeditationScreenView(homeStackPublisher: homeStackPublisher,mode: currentMode)
    }
}
