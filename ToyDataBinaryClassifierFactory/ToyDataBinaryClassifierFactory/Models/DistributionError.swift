//
//  DistributionError.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// Errors encoungered during the validation or generation of synthetic distributions.
///
/// Use `DistributionError` to diagnose invalid parameter configuraiton such as negative standard deviations and more.
enum DistributionError: LocalizedError, Equatable {
    /// Indicates that the requested save location is invalid or inaccessible.
    ///
    /// - Parameters
    ///     - path: The invalid file path string.
    case invalidSaveLocation(String)

    /// Indicates that the requested population size is not greater than zero.
    ///
    /// - Parameters
    ///     - populationSize: The invalid file population count.
    case invalidPopulationSize(UInt32)

    /// Indicates that the requested sample size is not greater than zero.
    ///
    /// - Parameters
    ///     - sampleSize: The invalid file sample feature count.
    case invalidSampleSize(Int)

    /// Indicates that the requested uniform distribution range has an invalid lower or upper bound.
    ///
    /// - Parameters
    ///     - min: The lower bound, which must be strictly less than `max`
    ///     - max: The upper bound, which must be strictly greater than `min`
    case invalidRange(min: Float, max: Float)

    /// Indicates that the requested normal distribution range has an invalid standard deviation value which must be strictly positive.
    ///
    /// - Parameters
    ///     - sigma: The invalid standard deviation value.
    case invalidStandardDeviation(Float)

    /// A localized description explaining the cause of the distribution error.
    var errorDescription: String? {
        switch self {
            case .invalidSaveLocation(let path):
                return "Save location must be a valid file path: \(path)"
            case .invalidPopulationSize(let populationSize):
                return "Invalid Population Size: populationSize (\(populationSize)) must be greater than 0."
            case .invalidSampleSize(let sampleSize):
                return "Invalid Sample Size: sampleSize (\(sampleSize)) must be greater than 0."
            case .invalidRange(let min, let max):
                return "Invalid Uniform Distribution: min (\(min)) must be strictly less than max (\(max))."
            case .invalidStandardDeviation(let sigma):
                return "Invalid Normal Distribtion: sigma (\(sigma)) must be greater than 0."
        }
    }
}
