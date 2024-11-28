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
}
