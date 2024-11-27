//
//  AspireApp.swift
//  Aspire
//
//  Created by Gabriel Pereira on 19/11/24.
//

import SwiftUI

@main
struct AspireApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView(viewModel: RouterViewModel())
        }
    }
}
