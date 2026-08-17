//
//  Models.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 12/08/2026.
//

import Foundation

/// DistributionParameters
enum DistributionError: LocalizedError {
    case invalidSaveLocation(String)
    case invalidPopulationSize(UInt32)
    case invalidSampleSize(Int)
    case invalidRange(min: Float, max: Float)
    case invalidStandardDeviation(Float)

    var errorDescription: String? {
        switch self {
        case .invalidSaveLocation(let path):
            return "Save location must be a valid file path: \(path)"
        case .invalidPopulationSize(let populationSize):
            return
                "Invalid Population Size: populationSize (\(populationSize)) must be greater than 0."
        case .invalidSampleSize(let sampleSize):
            return
                "Invalid Sample Size: sampleSize (\(sampleSize)) must be greater than 0."
        case .invalidRange(let min, let max):
            return
                "Invalid Uniform Distribution: min (\(min)) must be strictly less than max (\(max))."
        case .invalidStandardDeviation(let sigma):
            return
                "Invalid Normal Distribtion: sigma (\(sigma)) must be greater than 0."
        }
    }
}

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

struct SampleConfig {
    let saveLocation: URL  // where should the data be saved?
    let populationCount: UInt32  // how many data samples should we contribute to our dataset for this run?
    let sampleSize: Int  // how big should a list of numbers be?
    let seed: UInt64  // what should we seed the RNG with for reproducibility?
    let isSorted: Bool  // is this data sorted?
    let distribution: DistributionSpecification  // what distribution do we want and what parameters does it have?
    /// Validates all parameters during initialization
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
