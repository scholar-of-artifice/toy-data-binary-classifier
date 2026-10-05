//
//  AppViewModel.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 28/09/2026.
//

import SwiftUI

@Observable
class AppViewModel {
    var coreConfigurationVM = CoreConfigurationViewModel()
    var distributionConfigurationVM = DistributionConfigurationViewModel()
    var automatorVM = AutomatorViewModel()
}
