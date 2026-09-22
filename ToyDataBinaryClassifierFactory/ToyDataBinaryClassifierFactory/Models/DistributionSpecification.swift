//
//  DistributionSpecification.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// Represents a distribution and its validated parameters
enum DistributionSpecification: Encodable {

    case uniform(min: Float, max: Float)
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
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DynamicCodingKey.self)

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

private struct DynamicCodingKey: CodingKey {

    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
}
