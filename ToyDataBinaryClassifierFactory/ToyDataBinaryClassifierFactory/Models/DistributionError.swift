//
//  DistributionError.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// DistributionError
enum DistributionError: LocalizedError, Equatable {
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
