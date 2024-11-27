import SwiftUI
import Combine


enum RouterStacks {
    static func makeHomeStack(routerPublisher:PassthroughSubject<RouterUIState,Never>) -> some View {
        let viewModel = HomeStackViewModel()
        viewModel.setRouterPublisher(routerPublisher)
        return HomeStackView(viewModel: viewModel)
    }
}
