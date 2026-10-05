//
//  DistributionConfigurationViewModel.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 29/09/2026.
//

import Foundation
import Observation
import SwiftUI

enum DistributionType: String, CaseIterable {
    case normal = "Normal"
    case uniform = "Uniform"
}

@Observable
class DistributionConfigurationViewModel {
    //
    var selectedDistribution: DistributionType = .normal
    // ==== Normal Params
    var mu: Double = 0.0
    var sigma: Double = 1.0
    // ==== Uniform Params
    var minVal: Double = -1.0
    var maxVal: Double = 1.0
}
