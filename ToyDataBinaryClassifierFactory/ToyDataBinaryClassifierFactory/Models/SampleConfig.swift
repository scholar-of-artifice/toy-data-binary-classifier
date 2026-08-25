//
//  SampleConfig.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

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
