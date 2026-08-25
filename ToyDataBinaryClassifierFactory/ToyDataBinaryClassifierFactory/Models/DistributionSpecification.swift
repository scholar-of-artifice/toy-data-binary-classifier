//
//  DistributionSpecification.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// Represents a distribution and its validated parameters
enum DistributionSpecification {

    case uniform(min: Float, max: Float)
    case normal(mu: Float, sigma: Float)

    /// Factory method for uniform distribution with validation
    static func makeUniform(min: Float, max: Float) throws
        -> DistributionSpecification
    {
        guard min < max else {
            throw DistributionError.invalidRange(min: min, max: max)
        }
        return .uniform(min: min, max: max)
    }
    /// Factory method for normal distribution with validation
    static func makeNormal(mu: Float, sigma: Float) throws
        -> DistributionSpecification
    {
        guard sigma > 0.0 else {
            throw DistributionError.invalidStandardDeviation(sigma)
        }
        return .normal(mu: mu, sigma: sigma)
    }
}

