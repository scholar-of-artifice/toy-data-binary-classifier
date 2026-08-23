//
//  DistributionGenerating.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// A functional contract for generating an array of floating-point values
protocol DistributionGenerating {
    /// Generates the requested number of values based on the conforming type's internal distribution rules.
    func generate(count: Int) -> [Float]
}
