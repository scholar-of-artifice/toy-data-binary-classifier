//
//  AutomatorViewModel.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 29/09/2026.
//

import SwiftUI

enum TargetParameter: String, CaseIterable {
    case mu = "mu"
    case sigma = "sigma"
    case min = "min"
    case max = "max"
}

enum AutomationFunctionType: String, CaseIterable {
    case linear = "Linear"
    case sine = "Sine"
}

@Observable
class AutomatorViewModel {
    var isActive: Bool = false
    var selectedFunction: AutomationFunctionType = .linear
    var selectedParameter: TargetParameter = .mu

    // ==== Automation Params
    var min: Double = 0.0
    var max: Double = 1.0

    var frequency: Double = 1.0
    var phase: Double = 0.0
    var decayRate: Double = 0.0
}
