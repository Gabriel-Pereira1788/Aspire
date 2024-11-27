//
//  RouterView.swift
//  Aspire
//
//  Created by Gabriel Pereira on 19/11/24.
//

import SwiftUI

struct RouterView: View {
    @ObservedObject var viewModel: RouterViewModel
    var body: some View {
        ZStack {
            switch viewModel.uiState {
            case .goToHomeStack:
                viewModel.homeStack()
            }
        }
    }
}
