//
//  CommonModel.swift
//  Aspire
//
//  Created by Gabriel Pereira on 27/11/24.
//
import SwiftUI

enum SelectionMode: Int, CaseIterable {
    case easy
    case medium
    case hard
    
    func getRemainingTime() -> TimeInterval {
        let SECONDS = 60.0
        
        switch self {
        case .easy:
            return SECONDS * 15.0
        case .medium:
            return SECONDS * 30.0
        case .hard:
            return SECONDS * 60.0
        }
    }
    
    var imageName: String {
        switch self {
        case .easy:
            return "leaf"
        case .medium:
            return "cloud"
        case .hard:
            return "sparkles"
        }
    }
    
    var title: String {
        switch self {
        case .easy:
            return "Relax"
        case .medium:
            return "Focus"
        case .hard:
            return "Deep"
        }
    }
    
    var resource:String {
        switch self {
        case .easy:
            return "https://cdn.pixabay.com/audio/2021/09/06/audio_887337c364.mp3"
        case .medium:
            return "https://cdn.pixabay.com/audio/2023/08/12/audio_1de7c4d2a5.mp3"
        case .hard:
            return "https://cdn.pixabay.com/audio/2024/09/11/audio_a32fe28a75.mp3"
        }
    }
}
