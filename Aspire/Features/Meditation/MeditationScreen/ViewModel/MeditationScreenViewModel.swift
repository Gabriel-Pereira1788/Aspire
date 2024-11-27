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
    
    private var meditationMode: MeditationMode?
    
    @Published var  isBreathingIn = false
    @Published private var remainingTime: TimeInterval = 30
    
    init () {
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink() {_ in
            self.changeTimer()
        }
        
        setCurrentMode(.easy)
    }
    
    deinit {
        meditationMode?.stop()
        timerCancellable?.cancel()
    }
    
    func setCurrentMode(_ mode:SelectionMode){
        
        switch mode {
        case .easy:
            meditationMode = RelaxMode(toggleState:{self.isBreathingIn.toggle()})
        default:
            break
        }
    }
    
    func setHomeStackPublisher(_ toHomeStackPublisher: PassthroughSubject<HomeStackActions,Never>) {
        homeStackPublisher = toHomeStackPublisher
    }
    
    func dispatchMode() {
        meditationMode?.execute()
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
            meditationMode?.stop()
        }
    }
}

