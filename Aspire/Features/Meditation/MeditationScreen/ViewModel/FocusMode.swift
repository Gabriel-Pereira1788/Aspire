//
//  FocusMode.swift
//  Aspire
//
//  Created by Gabriel Pereira on 29/11/24.
//

class FocusMode:MeditationController {
    private var hapticFeedback = HapticFeedbackManager()
    var toggleState: () -> Void
    
    init(toggleState: @escaping () -> Void) {
        self.toggleState = toggleState
    }
    
    func execute() {
        
    }
    
    func stop() {
        
    }
}
