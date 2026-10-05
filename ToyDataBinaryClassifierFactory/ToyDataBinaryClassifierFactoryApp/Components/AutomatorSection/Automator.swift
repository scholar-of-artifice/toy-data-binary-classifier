//
//  Automator.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 29/09/2026.
//

import SwiftUI

struct Automator: View {
    @Bindable var viewModel: AutomatorViewModel

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: GUIConstants.SPACING
        ) {
            Grid() {
                GridRow() {
                    Text("Activate")
                        .gridColumnAlignment(.leading)
                    HStack() {
                        Toggle(
                            "Is this automator active?",
                            isOn: $viewModel.isActive
                        )
                        .toggleStyle(.checkbox)
                        .focusable()
                        .gridColumnAlignment(.leading)
                        .onKeyPress(.space) {
                            viewModel.isActive.toggle()
                            return .handled
                        }
                        .onKeyPress(.return) {
                            viewModel.isActive.toggle()
                            return .handled
                        }
                    }
                }
                .gridColumnAlignment(.leading)
                GridRow() {
                    Picker(
                        "Automation Function",
                        selection: $viewModel.selectedFunction
                    ) {
                        ForEach(AutomationFunctionType.allCases, id: \.self) {
                            type in Text(type.rawValue).tag(type)
                        }
                    }
                    .gridColumnAlignment(.leading)
                    .focusable()
                }
                .gridColumnAlignment(.leading)
                GridRow() {
                    Picker(
                        "Target Parameter",
                        selection: $viewModel.selectedParameter
                    ) {
                        ForEach(TargetParameter.allCases, id: \.self) {
                            type in Text(type.rawValue).tag(type)
                        }
                    }
                    .gridColumnAlignment(.leading)
                    .focusable()
                }
                .gridColumnAlignment(.leading)
                GridRow() {
                    if viewModel.selectedFunction == .linear {
                        Grid() {

                            GridRow() {
                                Text("Max")
                                    .gridColumnAlignment(.trailing)
                                HStack() {
                                    TextField(
                                        "The minimum value in the range. Example: 1",
                                        value: $viewModel.max,
                                        format: .number
                                    )
                                }
                            }

                            GridRow() {
                                Text("Min")
                                    .gridColumnAlignment(.trailing)
                                HStack() {
                                    TextField(
                                        "The minimum value in the range. Example: 0",
                                        value: $viewModel.min,
                                        format: .number
                                    )
                                }
                            }
                        }
                        ///
                        ///
                    } else if viewModel.selectedFunction == .sine {
                        Grid() {

                            GridRow() {
                                Text("Max")
                                    .gridColumnAlignment(.trailing)
                                HStack() {
                                    TextField(
                                        "The minimum value in the range. Example: 1",
                                        value: $viewModel.max,
                                        format: .number
                                    )
                                }
                            }

                            GridRow() {
                                Text("Min")
                                    .gridColumnAlignment(.trailing)
                                HStack() {
                                    TextField(
                                        "The minimum value in the range. Example: 0",
                                        value: $viewModel.min,
                                        format: .number
                                    )
                                }
                            }

                            GridRow() {
                                Text("Frequency")
                                    .gridColumnAlignment(.trailing)
                                HStack() {
                                    TextField(
                                        "The number of oscillations over all samples. Example: 1",
                                        value: $viewModel.frequency,
                                        format: .number
                                    )
                                }
                            }

                            GridRow() {
                                Text("Phase")
                                    .gridColumnAlignment(.trailing)
                                HStack() {
                                    TextField(
                                        "The starting point in the sine function. Example: 0.25",
                                        value: $viewModel.phase,
                                        format: .number
                                    )
                                }
                            }


                            GridRow() {
                                Text("Decay Rate")
                                    .gridColumnAlignment(.trailing)
                                HStack() {
                                    TextField(
                                        "The rate of decay of the wave. Example: 0.25",
                                        value: $viewModel.decayRate,
                                        format: .number
                                    )
                                }
                            }
                        }
                        ///
                    } else {
                        ///
                    }
                }
                .gridColumnAlignment(.leading)
            }

        }
    }
}
