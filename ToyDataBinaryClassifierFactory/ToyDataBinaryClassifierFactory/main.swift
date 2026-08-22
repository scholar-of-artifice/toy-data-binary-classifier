//
//  main.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 05/08/2026.
//

import Foundation
import GameplayKit

print("Hello, World!")

do {
    // choose a location
    let curretDir = URL(
        fileURLWithPath: FileManager.default.currentDirectoryPath
    )
    let outputFolder = curretDir.appendingPathComponent(
        "my_data/uniform",
        isDirectory: true
    )

    // initialize a RNG
    let randomSource = GKMersenneTwisterRandomSource(seed: 129)
    // create a random value for
    let rand_range = makeRandMinMaxPair(using: randomSource)
    let rand_mu = makeRandMu(using: randomSource)
    let rand_sigma = makeRandSigma(using: randomSource)

    // build and validate distribution spec
    let distribution_uniform = try DistributionSpecification.makeUniform(
        min: rand_range[0],
        max: rand_range[1]
    )
    let distribution_normal = try DistributionSpecification.makeNormal(
        mu: rand_mu,
        sigma: rand_sigma
    )

    // create validated configurations
    let uniform_config = try SampleConfig(
        saveLocation: outputFolder,
        populationCount: 3,
        sampleSize: 30,
        seed: 123,
        isSorted: true,
        distribution: distribution_uniform
    )
    let normal_config = try SampleConfig(
        saveLocation: outputFolder,
        populationCount: 3,
        sampleSize: 30,
        seed: 123,
        isSorted: true,
        distribution: distribution_normal
    )
    // make some data
    try makeSamples(config: uniform_config)
    try makeSamples(config: normal_config)
} catch {
    print("Exectution Failed: \(error.localizedDescription)")
}
