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
                    HStack() {
                        TextField(
                            "",
                            value: $viewModel.parameterCount,
                            format: .number
                        )
                        .gridColumnAlignment(.leading)
                    }
                }
                GridRow() {
                    Text("Sample Size")
                    HStack() {
                        TextField(
                            "",
                            value: $viewModel.sampleSize,
                            format: .number
                        )
                        .gridColumnAlignment(.leading)
                    }
                }
                GridRow() {
                    Text("Seed")
                    HStack() {
                        TextField(
                            "",
                            value: $viewModel.seedValue,
                            format: .number
                        )
                        .gridColumnAlignment(.leading)
                    }
                }
                GridRow() {
                    Text("Sort")
                        .gridColumnAlignment(.leading)
                    HStack() {
                        Toggle(
                            "",
                            isOn: $viewModel.isSorted
                        )
                        .toggleStyle(.checkbox)
                        .focusable() // explicitly tell SwiftUI that we can tab to this element
                        .gridColumnAlignment(.leading)
                        .onKeyPress(.space) {
                            viewModel.isSorted.toggle()
                            return .handled
                        }
                        .onKeyPress(.return) {
                            viewModel.isSorted.toggle()
                            return .handled
                        }
                    }
                }
            }
        }
    }
}
