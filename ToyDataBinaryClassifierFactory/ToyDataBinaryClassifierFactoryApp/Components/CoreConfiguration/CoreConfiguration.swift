//
//  CoreConfiguration.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 14/09/2026.
//

import SwiftUI

struct CoreConfiguration: View {
    @Bindable var viewModel: CoreConfigurationViewModel

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: GUIConstants.SPACING
        ) {
            Grid() {
                GridRow() {
                    Text("Parameter Count")
                        .gridColumnAlignment(.trailing)
                    HStack() {
                        TextField(
                            "The number of values in each sample. Example: 30",
                            value: $viewModel.parameterCount,
                            format: .number
                        )
                    }
                }
                GridRow() {
                    Text("Sample Size")
                        .gridColumnAlignment(.trailing)
                    HStack() {
                        TextField(
                            "The number of total samples. Example: 1000",
                            value: $viewModel.sampleSize,
                            format: .number
                        )
                    }
                }
                GridRow() {
                    Text("Seed")
                        .gridColumnAlignment(.trailing)
                    HStack() {
                        TextField(
                            "Seed the random number generator. Example: 42",
                            value: $viewModel.seedValue,
                            format: .number
                        )
                    }
                }
                GridRow() {
                    Text("Sort")
                        .gridColumnAlignment(.trailing)
                    HStack() {
                        Toggle(
                            "Do you want the values to be sorted?",
                            isOn: $viewModel.isSorted
                        )
                        .toggleStyle(.checkbox)
                        .focusable() // explicitly tell SwiftUI that we can tab to this element
                        .onKeyPress(.space) {
                            viewModel.isSorted.toggle()
                            return .handled
                        }
                        .onKeyPress(.return) {
                            viewModel.isSorted.toggle()
                            return .handled
                        }
                    }
                    .gridColumnAlignment(.leading)
                }
            }
        }
    }
}
