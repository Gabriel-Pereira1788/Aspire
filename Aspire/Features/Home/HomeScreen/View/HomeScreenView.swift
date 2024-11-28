//
//  HomeScreenView.swift
//  Aspire
//
//  Created by Gabriel Pereira on 22/11/24.
//

import SwiftUI
import Combine

struct HomeScreenView: View {
    @ObservedObject var viewModel = HomeScreenViewModel()
    var homeStackPublisher:PassthroughSubject<HomeStackScreens,Never>!
    var body: some View {
        
        VStack(spacing:50) {
            VStack( alignment:.center,spacing:10) {
                Text("Deep Meditation to relax")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                
                Text("Start meditation of mind")
                    .font(.headline)
                    .foregroundStyle(Color(UIColor.lightGray))
                
            }
            
            PlayButton {
                viewModel.goToMeditationScreen()
            }
            
            SelectionView {mode in viewModel.onSelectMode(mode: mode)}
        }
        .padding(35)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            BackgroundView()
        }
    }
    
}


#Preview {
    VStack {
        HomeScreenView()
    }
    
}



