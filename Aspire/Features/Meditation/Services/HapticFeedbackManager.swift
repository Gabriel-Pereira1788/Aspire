//
//  HapticFeedbackManager.swift
//  Aspire
//
//  Created by Gabriel Pereira on 29/11/24.
//

import UIKit

class HapticFeedbackManager {
    private let impactFeedbackGenerator = UIImpactFeedbackGenerator()
    private let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    init() {
        prepareFeedbackGenerators()
    }
    
    func dispatchImpactFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare() // Melhora a responsividade
        generator.impactOccurred()
    }
    
    func dispatchNotificationFeedback(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        notificationFeedbackGenerator.notificationOccurred(type)
    }
    
    func dispatchSelectionFeedback() {
        selectionFeedbackGenerator.selectionChanged()
    }
    
    private func prepareFeedbackGenerators() {
        impactFeedbackGenerator.prepare()
        notificationFeedbackGenerator.prepare()
        selectionFeedbackGenerator.prepare()
    }
    
}
