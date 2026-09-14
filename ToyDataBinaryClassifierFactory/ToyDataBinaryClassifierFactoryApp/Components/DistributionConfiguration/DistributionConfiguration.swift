//
//  DistributionConfiguration.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 14/09/2026.
//

import SwiftUI

struct DistributionConfiguration: View {
    
    var body: some View {
        
        // MARK: This section is for parameters to make for the Distribution
        VStack(
            alignment: .leading,
            spacing: GUIConstants.SPACING
        ) {
            // What kind of Distribution?
            Text("Distribution Type")
            
            // The parameters for the distribution
            Grid(
                alignment: .leading,
                horizontalSpacing: GUIConstants.SPACING,
                verticalSpacing: GUIConstants.SPACING,
            ) {
                let a = 1
                if a == 0 {
                    GridRow {
                        Text("Mean (µ)")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                    }
                    GridRow {
                        Text("Standard Deviation (σ)")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                    }
                }
                else if a == 1 {
                    GridRow {
                        Text("Minimum")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                    }
                    GridRow {
                        Text("Maximum")
                            .font(.system(.body, design: .rounded))
                            .gridColumnAlignment(.trailing)
                    }
                }
                else {
                    Text("Please select a distribution")
                }
            }
        }
    }
}
