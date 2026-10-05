//
//  CoreConfigurationViewModel.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 28/09/2026.
//

import SwiftUI

@Observable
class CoreConfigurationViewModel {
    //
    var parameterCount: Int = 10
    var sampleSize: Int = 1000
    var seedValue: Int = 42173
    var isSorted: Bool = true
}
