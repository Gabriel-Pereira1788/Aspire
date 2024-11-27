//
//  HomeScreenViewModel.swift
//  Aspire
//
//  Created by Gabriel Pereira on 22/11/24.
//
import SwiftUI
import Combine

class HomeScreenViewModel: ObservableObject {
    private var homeStackPublisher:PassthroughSubject<HomeStackActions,Never>!
    private var currentMode:SelectionMode = .easy
    func onSelectMode(mode:SelectionMode) {
        currentMode = mode
    }
    
    func setHomeStackPublisher(_ toHomeStackPublisher:PassthroughSubject<HomeStackActions,Never>!){
        homeStackPublisher = toHomeStackPublisher
    }
}

extension HomeScreenViewModel {
    
    func goToMeditationScreen() {
        
        homeStackPublisher.send(.meditationScreen(currentMode))
    }
}
