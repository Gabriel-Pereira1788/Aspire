import SwiftUI

struct MeditationScreenView : View {
    @ObservedObject var viewModel: MeditationScreenViewModel
    
    var body: some View {
        VStack(alignment:.center,spacing: 20) {
            
            Circle()
                .fill(LinearGradient(
                    colors: [
                        Color.red.opacity(0.6),
                        Color.purple.opacity(0.4),
                        Color.blue.opacity(0.6)
                    ]
                    ,startPoint: .bottom,
                    endPoint: .top))
                .frame(width: 250)
                .frame(height: 250)
                .scaleEffect(viewModel.isBreathingIn ? 1.4 : 1.0)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
            
            VStack {
                Text("Meditation to \(viewModel.title)")
                    .font(.system(size:40,weight: .light,design: .none))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                
                Text("Body Healing")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.lightGray))
                
                Text(viewModel.formatTime())
                    .font(.system(size: 50, weight: .light, design: .rounded))
                    .foregroundStyle(LinearGradient(
                        colors: [
                            Color.purple.opacity(0.8),
                            Color.blue.opacity(0.8)
                        ]
                        ,startPoint: .bottom,
                        endPoint: .top))
                    .foregroundColor(Color(red: 0.7, green: 0.8, blue: 1.0))
                
                    .padding()
            }.padding(.top,100)
            
        }.frame(maxWidth:.infinity,maxHeight: .infinity)
            .onAppear {
                viewModel.dispatchMode()
            }
            .padding()
            .background {
                BackgroundView()
            }.onDisappear {
                print("run this")
                viewModel.unMountScreen()
            }
    }
    
    
}


#Preview {
    
    MeditationScreenView(viewModel: MeditationScreenViewModel())
}
