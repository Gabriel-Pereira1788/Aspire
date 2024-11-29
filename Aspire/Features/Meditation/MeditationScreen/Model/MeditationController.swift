//
//  MeditationMode.swift
//  Aspire
//
//  Created by Gabriel Pereira on 27/11/24.
//

import SwiftUI

protocol MeditationController {
    var toggleState:() -> Void { get }
    func execute() -> Void
    func stop() -> Void
}
