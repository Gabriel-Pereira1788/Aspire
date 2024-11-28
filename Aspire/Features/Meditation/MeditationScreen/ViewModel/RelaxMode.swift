//
//  RelaxMode.swift
//  Aspire
//
//  Created by Gabriel Pereira on 27/11/24.
//
import SwiftUI
import UIKit

class RelaxMode: MeditationMode {
    var toggleState: () -> Void
    
    private var isStopped = false
    private var soundEffect = SoundEffectManager()
    
    init(toggleState:@escaping () -> Void){
        self.toggleState = toggleState
    }
    
    func execute() {
        soundEffect.play(resource: "relax_rain")
        runBreathingAnimation()
    }
    
    func stop() {
        isStopped = true
    }
    
    
    func runBreathingAnimation() {
        if isStopped {
            soundEffect.stop()
            return
        }
        
        withAnimation(.easeInOut(duration:4)) {
            toggleState()
        } completion: {
            self.dispatchImpactFeedback(.light)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.dispatchImpactFeedback(.medium)
            withAnimation(.easeInOut(duration:8)) {
                self.toggleState()
                
            } completion: {
                self.dispatchImpactFeedback(.soft)
                self.runBreathingAnimation()
            }
        }
    }
}



extension RelaxMode {
    private func dispatchImpactFeedback(_ style:UIImpactFeedbackGenerator.FeedbackStyle) {
        let feedbackHeavy = UIImpactFeedbackGenerator(style: style)
        feedbackHeavy.impactOccurred()
    }
}
