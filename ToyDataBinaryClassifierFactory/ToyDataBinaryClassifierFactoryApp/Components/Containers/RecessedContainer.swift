//
//  RecessedContainer.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 14/09/2026.
//

import SwiftUI
import Foundation

struct RecessedContainer<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, content: Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: GUIConstants.SPACING
        ) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.secondary)
            content
        }
        .padding(
            GUIConstants.PADDING
        )
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}
