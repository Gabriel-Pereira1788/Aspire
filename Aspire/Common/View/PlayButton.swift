//
//  PlayButton.swift
//  Aspire
//
//  Created by Gabriel Pereira on 22/11/24.
//
import SwiftUI
struct PlayButton: View {
    var action:() -> Void
    @State private var isPulsing = false

    var body: some View {
        ZStack {
            
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color(red: 0.5, green: 0.6, blue: 1.0).opacity(0.14))
                    .stroke(Color.blue.opacity(0.2 - Double(index) * 0.05), lineWidth: 1)
                    .frame(width: 150 + CGFloat(index * 30),
                           height: 120 + CGFloat(index * 30))
                    .scaleEffect(isPulsing ? 1.1 : 1.0)
                    .animation(
                        .easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.2),
                        value: isPulsing
                    )
                
            }
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.5, green: 0.6, blue: 1.0),
                        Color(red: 0.4, green: 0.5, blue: 0.9)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 80, height: 80)
            Button(action:action, label: {
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            })
            
        }.onAppear {
            DispatchQueue.main.async {
                    isPulsing = true
                }
        }
        
    }
}

#Preview {
    NavigationView {
        VStack {
            PlayButton(action:{
                print("Something")
            })
        }
        
    }.navigationBarHidden(true)
    
}
