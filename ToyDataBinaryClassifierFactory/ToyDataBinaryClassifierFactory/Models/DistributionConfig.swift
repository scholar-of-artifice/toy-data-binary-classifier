//
//  DistributionConfig.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 23/08/2026.
//

import Foundation

/// The settings used to define a particular distribution to be computed.
///
/// Use `DistributionConfig` to serialize and pass distribution generation options such as distribution kind and numerical parameters (e.g. mean, standard deviation, etc) to data pipelines and factories.
struct DistributionConfig: Codable {
    /// The name of the distribution. Example: "normal", "uniform", etc.
    let type: String

    /// A key-value paring of parameters to make this distribution.
    let parameters: [String: Double]

    /// Creates a new distribution configuration.
    ///
    /// - Parameters:
    ///     - type: The name of the distribution. Example: "normal", "uniform", etc.
    ///     - parameters: A key-value pairing of numerical parameters configuring the distribution.
    public init(
        type: String,
        parameters: [String: Double]
    ) {
        self.type = type
        self.parameters = parameters
    }
}
