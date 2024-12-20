//
//  RelaxMode.swift
//  Aspire
//
//  Created by Gabriel Pereira on 27/11/24.
//
import SwiftUI
import UIKit

class RelaxMode: MeditationController {
    var toggleState: () -> Void
    
    private var hapticFeedback = HapticFeedbackManager()
    private var soundEffect = SoundEffectManager()
    
    private var isStopped = false
    
    init(toggleState:@escaping () -> Void){
        self.toggleState = toggleState
    }
    
    func execute() {
        soundEffect.play(resource: SelectionMode.easy.resource)
        runBreathingAnimation()
    }
    
    func stop() {
        isStopped = true
        soundEffect.stop()
    }
    
    
    func runBreathingAnimation() {
        if isStopped {
            self.hapticFeedback.dispatchNotificationFeedback(.success)
            return
        }
        
        inhale()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.exhale {
                self.runBreathingAnimation()
            }
            
        }
    }
}

extension RelaxMode {
    func inhale() {
        withAnimation(.easeInOut(duration:4)) {
            toggleState()
        } completion: {
            self.hapticFeedback.dispatchImpactFeedback(.light)
            
        }
    }
    
    func exhale(completion:@escaping () -> Void) {
        self.hapticFeedback.dispatchImpactFeedback(.medium)
        withAnimation(.easeInOut(duration:8)) {
            self.toggleState()
            
        } completion: {
            self.hapticFeedback.dispatchImpactFeedback(.rigid)
            completion()
        }
        
    }
}
