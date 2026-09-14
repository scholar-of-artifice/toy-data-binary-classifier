//
//  ExecutionStatus.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 14/09/2026.
//

import SwiftUI

struct ExecutionStatus: View {
    
    var body: some View {
        //
        VStack(
            alignment: .leading,
            spacing: GUIConstants.SPACING
        ) {
            let a = 0
            if a == 0 {
                VStack(
                    alignment: .leading,
                    spacing: GUIConstants.SPACING
                ) {
                    ProgressView(value: 0.5)
                    Text("Making dataset...")
                    Button("Cancel", role: .destructive){
                    }
                }
            } else {
                HStack {
                    Spacer()
                    Button(action: {
                    }) {
                        Text("Generate Dataset")
                            .frame(alignment: .center)
                    }
                    Spacer()
                }
            }
        }
    }
}
