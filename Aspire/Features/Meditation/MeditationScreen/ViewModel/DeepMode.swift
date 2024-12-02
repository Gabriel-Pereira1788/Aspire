//
//  DeepMode.swift
//  Aspire
//
//  Created by Gabriel Pereira on 30/11/24.
//

import SwiftUI


class DeepMode:MeditationController {
    private var hapticFeedback = HapticFeedbackManager()
    private var soundEffect = SoundEffectManager()
    private var isStopped = false
    
    var toggleState: () -> Void
    
    init(toggleState: @escaping () -> Void) {
        self.toggleState = toggleState
    }
    deinit {
        soundEffect.stop()
    }
    func execute() {
        soundEffect.play(resource: SelectionMode.hard.resource)
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

extension DeepMode {
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