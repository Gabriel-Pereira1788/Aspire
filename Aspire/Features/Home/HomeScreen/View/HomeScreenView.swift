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

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .white, location: 0),
                    .init(color: .white, location: 0.35),
                    .init(color: Color(red: 0.95, green: 0.95, blue: 1.0), location: 0.5),
                    .init(color: Color(red: 1.0, green: 0.93, blue: 0.97), location: 0.7),
                    .init(color: Color(red: 0.98, green: 0.92, blue: 1.0), location: 0.85),
                    .init(color: Color(red: 1.0, green: 0.92, blue: 0.98), location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack {
                Spacer()
                HStack {
                    
                    Circle()
                        .fill(Color(red: 1.0, green: 0.85, blue: 0.92).opacity(0.4))
                        .frame(width: 170, height: 170)
                        .blur(radius: 35)
                        .offset(x: -100, y: 20)
                    
                    
                    Circle()
                        .fill(Color(red: 0.9, green: 0.9, blue: 1.0).opacity(0.35))
                        .frame(width: 150, height: 150)
                        .blur(radius: 30)
                        .offset(x: 0, y: -20)
                    
                    
                    Circle()
                        .fill(Color(red: 1.0, green: 0.88, blue: 0.95).opacity(0.45))
                        .frame(width: 160, height: 160)
                        .blur(radius: 35)
                        .offset(x: 80, y: 30)
                }
                
                HStack {
                    
                    Circle()
                        .fill(Color(red: 0.95, green: 0.9, blue: 1.0).opacity(0.4))
                        .frame(width: 140, height: 140)
                        .blur(radius: 30)
                        .offset(x: -50, y: -40)
                    
                    
                    Circle()
                        .fill(Color(red: 1.0, green: 0.85, blue: 0.92).opacity(0.45))
                        .frame(width: 180, height: 180)
                        .blur(radius: 40)
                        .offset(x: 60, y: 0)
                }
                .offset(y: 30)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    VStack {
        HomeScreenView()
    }
    
}



