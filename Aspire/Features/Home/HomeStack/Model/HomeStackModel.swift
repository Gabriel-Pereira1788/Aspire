//
//  HomeStackModel.swift
//  Aspire
//
//  Created by Gabriel Pereira on 24/11/24.
//


enum HomeStackActions {
    case homeScreen
    case meditationScreen(SelectionMode)
    
    var action:Int {
        switch self {
        case .homeScreen:
            return 1
        case .meditationScreen:
            return 2
        }
    }
}
