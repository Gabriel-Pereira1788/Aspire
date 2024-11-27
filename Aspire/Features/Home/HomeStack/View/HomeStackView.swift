//
//  HomeStackView.swift
//  Aspire
//
//  Created by Gabriel Pereira on 19/11/24.
//

import SwiftUI

struct HomeStackView: View {
    @ObservedObject var viewModel: HomeStackViewModel
    var body: some View {
        NavigationView {
            ZStack {
                viewModel.renderHomeScreen()
                renderStack()
            }
            
        }
        
    }
}


extension HomeStackView {
    func renderStack() -> some View {
        ZStack {
            NavigationLink(
                destination: viewModel.renderMeditationScreen(),
                tag: 2,
                selection:$viewModel.action,
                label: {
                    EmptyView()
                }
            )
        }
    }
}


#Preview {
    HomeStackView(viewModel: HomeStackViewModel())
}
