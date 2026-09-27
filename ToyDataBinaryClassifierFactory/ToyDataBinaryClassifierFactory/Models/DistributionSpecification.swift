//
//  DistributionSpecification.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// Represents a distribution and its validated parameters
enum DistributionSpecification: Encodable {

    /// A continuous uniform distribution bounded between a minimum and maximum value
    case uniform(min: Float, max: Float)

    /// A continuous normal distribution defined by its mean (µ) and standard deviation (σ)
    case normal(mu: Float, sigma: Float)

    // keys used inside the nested "parameters" object
    private enum UniformCodingKeys: String, CodingKey {
        case minimum
        case maximum
    }
    private enum NormalCodingKeys: String, CodingKey {
        case mu
        case sigma
    }

    /// Encodes the distribution's parameters dictionary into the specified encoder.
    ///
    /// - Parameters:
    ///     - encoder: the encoder to write data to.
    /// - Throws: An error if encoding any associated numerical values fails.
    func encode(to encoder: Encoder) throws {

        switch self {
            case .uniform(let min, let max):
                var nested = encoder.container(keyedBy: UniformCodingKeys.self)
                try nested.encode(min, forKey: .minimum)
                try nested.encode(max, forKey: .maximum)
            case .normal(let mu, let sigma):
                var nested = encoder.container(keyedBy: NormalCodingKeys.self)
                try nested.encode(mu, forKey: .mu)
                try nested.encode(sigma, forKey: .sigma)
        }
    }

    /// Creates and validates a uniform distribution specification.
    ///
    /// - Parameters:
    ///     - min: the lower bound of the range
    ///     - max: the upper bound of the range
    static func makeUniform(min: Float, max: Float) throws
        -> DistributionSpecification
    {
        guard min < max else {
            throw DistributionError.invalidRange(min: min, max: max)
        }
        return .uniform(min: min, max: max)
    }

    /// Creates and validates a uniform distribution specification.
    ///
    /// - Parameters:
    ///     - mu: the mean of the distribution
    ///     - sigma: the standard deviation
    static func makeNormal(mu: Float, sigma: Float) throws
        -> DistributionSpecification
    {
        guard sigma > 0.0 else {
            throw DistributionError.invalidStandardDeviation(sigma)
        }
        return .normal(mu: mu, sigma: sigma)
    }
}
