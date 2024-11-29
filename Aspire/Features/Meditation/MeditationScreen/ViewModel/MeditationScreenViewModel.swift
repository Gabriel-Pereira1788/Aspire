//
//  MeditationScreenViewModel.swift
//  Aspire
//
//  Created by Gabriel Pereira on 24/11/24.
//

import SwiftUI
import Combine
import UIKit


class MeditationScreenViewModel: ObservableObject {
    private var homeStackPublisher: PassthroughSubject<HomeStackActions,Never>!
    private var timerCancellable: AnyCancellable?
    private var shouldBeFinish = false
    
    private var meditationController: MeditationController?
    var title:String = ""
    
    @Published var  isBreathingIn = false
    @Published private var remainingTime: TimeInterval = 30
    
    init () {
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink() {_ in
            self.changeTimer()
        }
        
        setCurrentMode(.easy)
    }
    
    deinit {
        meditationController?.stop()
        timerCancellable?.cancel()
    }
    
    func setCurrentMode(_ mode:SelectionMode){
        
        switch mode {
        case .easy:
            remainingTime = SelectionMode.easy.getRemainingTime()
            title = SelectionMode.easy.title
            meditationController = RelaxMode(toggleState:{self.isBreathingIn.toggle()})
        case .medium:
            remainingTime = SelectionMode.medium.getRemainingTime()
            title = SelectionMode.medium.title
        case .hard:
            remainingTime = SelectionMode.hard.getRemainingTime()
            title = SelectionMode.hard.title
        }
    }
    
    func setHomeStackPublisher(_ toHomeStackPublisher: PassthroughSubject<HomeStackActions,Never>) {
        homeStackPublisher = toHomeStackPublisher
    }
    
    func dispatchMode() {
        meditationController?.execute()
    }
    
}

extension MeditationScreenViewModel {
    func formatTime() -> String {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func changeTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
        } else {
            timerCancellable?.cancel()
            meditationController?.stop()
        }
    }
}

