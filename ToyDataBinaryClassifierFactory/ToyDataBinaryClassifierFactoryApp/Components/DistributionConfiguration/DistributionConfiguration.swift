//
//  DistributionConfiguration.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 14/09/2026.
//

import SwiftUI

struct DistributionConfiguration: View {

    @Bindable var viewModel: DistributionConfigurationViewModel

    var body: some View {

        // MARK: This section is for parameters to make for the Distribution
        VStack(
            alignment: .leading,
            spacing: GUIConstants.SPACING
        ) {
            Picker(
                "Distribution Type",
                selection: $viewModel.selectedDistribution
            ) {
                ForEach(DistributionType.allCases, id: \.self) {
                    type in Text(type.rawValue).tag(type)
                }
            }
            .focusable()

            // The parameters for the distribution
            Grid(
                alignment: .leading,
                horizontalSpacing: GUIConstants.SPACING,
                verticalSpacing: GUIConstants.SPACING,
            ) {
                if viewModel.selectedDistribution == .normal {
                    GridRow {
                        Text("Mean (µ)")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                        HStack() {
                            TextField(
                                "",
                                value: $viewModel.mu,
                                format: .number
                            )
                            .gridColumnAlignment(.leading)
                        }
                    }
                    GridRow {
                        Text("Standard Deviation (σ)")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                        HStack() {
                            TextField(
                                "",
                                value: $viewModel.sigma,
                                format: .number
                            )
                            .gridColumnAlignment(.leading)
                        }
                    }
                } else if viewModel.selectedDistribution == .uniform  {
                    GridRow {
                        Text("Minimum")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                        HStack() {
                            TextField(
                                "",
                                value: $viewModel.minVal,
                                format: .number
                            )
                            .gridColumnAlignment(.leading)
                        }
                    }
                    GridRow {
                        Text("Maximum")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                        HStack() {
                            TextField(
                                "",
                                value: $viewModel.maxVal,
                                format: .number
                            )
                            .gridColumnAlignment(.leading)
                        }
                    }
                } else {
                    Text("Please select a distribution")
                }
            }
        }
    }
}
