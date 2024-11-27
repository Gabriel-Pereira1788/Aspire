import SwiftUI

struct MeditationScreenView : View {
    @ObservedObject var viewModel: MeditationScreenViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            Circle().fill(.red).frame(width: 100).frame(height: 100).scaleEffect(viewModel.isBreathingIn ? 1.5 : 1.0)
            Text("Deep Meditation to relax")
                .font(.system(size:40,weight: .light,design: .none))
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
            
            Text("Body Healing")
                .font(.subheadline)
                .foregroundColor(Color(UIColor.lightGray))
            
            Text(viewModel.formatTime())
                .font(.system(size: 50, weight: .light, design: .rounded))
                .foregroundColor(Color(red: 0.7, green: 0.8, blue: 1.0))
                
                .padding()
            
        }.frame(maxWidth:.infinity,maxHeight: .infinity)
            .onAppear {
                viewModel.dispatchMode()
            }
            .padding()
            .background {
                ZStack {
                    
                    LinearGradient(stops: [
                        .init(color:.white,location: 0),
                        .init(color: .white, location: 0.58),
                        
                            .init(color: Color(UIColor.systemGray), location: 0.99),
                        
                    ], startPoint: .bottomTrailing, endPoint: .topLeading)
                    
                }.ignoresSafeArea()
            }
    }
    
    
}


#Preview {
    
    MeditationScreenView(viewModel: MeditationScreenViewModel())
}
