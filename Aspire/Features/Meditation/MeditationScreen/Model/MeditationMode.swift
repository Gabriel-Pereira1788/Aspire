//
//  MeditationMode.swift
//  Aspire
//
//  Created by Gabriel Pereira on 27/11/24.
//

import SwiftUI

protocol MeditationMode {
    var toggleState:() -> Void { get }
    func execute() -> Void
    func stop() -> Void
}
