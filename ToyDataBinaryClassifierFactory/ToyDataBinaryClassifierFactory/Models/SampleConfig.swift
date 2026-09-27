//
//  SampleConfig.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// Configuration settings governing a single dataset sampling generation run.
///
/// Use `SampleConfig` to define output destinations, sample sizes, parameters and more. All constraints are validated upon initialization.
struct SampleConfig {
    /// The destination file system directory where artifacts are written.
    let saveLocation: URL

    /// The number of distinct sample records to generate during this run.
    let populationCount: UInt32

    /// The number of numerical feature generated for each individual sample record.
    let sampleSize: Int

    /// The seed value providing a deterministic pseudo-random number generator output.
    let seed: UInt64

    /// A Boolean value indicating wheter feature vectors should be sorted in ascending order.
    let isSorted: Bool

    /// The statistical distribution and shape parameters used to generate the feature vectors.
    let distribution: DistributionSpecification

    /// Creates and validates a sample generation configuration.
    ///
    /// - Parameters:
    ///     - saveLocation: The destination file system directory where artifacts are written.
    ///     - populationCount: The number of distinct sample records to generate during this run.
    ///     - sampleSize: The number of numerical feature generated for each individual sample record.
    ///     - seed: The seed value providing a deterministic pseudo-random number generator output.
    ///     - isSorted: A Boolean value indicating wheter feature vectors should be sorted in ascending order.
    ///     - distribution: The statistical distribution and shape parameters used to generate the feature vectors.
    /// - Throws: ``DistributionError/invalidPopulationSize(_:)(_:)`` if `populationCount` is `0` or  ``DistributionError/invalidSampleSize(_:)`` if `sampleSize` is `0`
    init(
        saveLocation: URL,
        populationCount: UInt32,
        sampleSize: Int,
        seed: UInt64,
        isSorted: Bool,
        distribution: DistributionSpecification
    ) throws {
        guard populationCount > 0 else {
            throw DistributionError.invalidPopulationSize(populationCount)
        }
        guard sampleSize > 0 else {
            throw DistributionError.invalidSampleSize(sampleSize)
        }
        self.saveLocation = saveLocation
        self.populationCount = populationCount
        self.sampleSize = sampleSize
        self.seed = seed
        self.isSorted = isSorted
        self.distribution = distribution
    }
}
