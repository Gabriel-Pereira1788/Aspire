//
//  HomeStackScreens.swift
//  Aspire
//
//  Created by Gabriel Pereira on 24/11/24.
//
import SwiftUI
import Combine

enum HomeStackScreens {
    
    static func makeHomeScreenView(homeStackPublisher:PassthroughSubject<HomeStackActions,Never>!) -> some View {
        let viewModel = HomeScreenViewModel()
        viewModel.setHomeStackPublisher(homeStackPublisher)
        return HomeScreenView(viewModel: viewModel)
    }
    
    static func makeMeditationScreenView(homeStackPublisher:PassthroughSubject<HomeStackActions,Never>!,mode:SelectionMode) -> some View {
        let viewModel = MeditationScreenViewModel()
        viewModel.setHomeStackPublisher(homeStackPublisher)
        viewModel.setCurrentMode(mode)
        return MeditationScreenView(viewModel: viewModel)
    }
}
