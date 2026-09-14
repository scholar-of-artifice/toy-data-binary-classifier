//
//  ContentView.swift
//  ToyDataBinaryClassifierFactoryApp
//
//  Created by scholar-of-artifice on 14/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RecessedContainer(
                title: "Core Configuration",
                content: CoreConfiguration()
            )
            RecessedContainer(
                title: "Distribution Configuration",
                content: DistributionConfiguration()
            )
            RecessedContainer(
                title: "Execution Status",
                content: ExecutionStatus()
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
