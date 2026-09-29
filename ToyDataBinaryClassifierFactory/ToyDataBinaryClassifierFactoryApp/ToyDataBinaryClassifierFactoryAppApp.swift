//
//  ToyDataBinaryClassifierFactoryAppApp.swift
//  ToyDataBinaryClassifierFactoryApp
//
//  Created by scholar-of-artifice on 14/09/2026.
//

import SwiftUI

@main
struct ToyDataBinaryClassifierFactoryAppApp: App {
    @State private var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: appViewModel
            )
        }
    }
}
