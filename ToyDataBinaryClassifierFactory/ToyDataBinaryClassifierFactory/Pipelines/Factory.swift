//
//  Factory.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 12/08/2026.
//

import GameplayKit

///
func makeSamples(config: SampleConfig) throws {
    let fileManager = FileManager.default
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH-mm-ss-SSS"

    //
    try fileManager.createDirectory(
        at: config.saveLocation,
        withIntermediateDirectories: true,
        attributes: nil
    )

    print("Output directory ready at: \(config.saveLocation.path)")

    // initialize RNG
    let randomSource = GKMersenneTwisterRandomSource(seed: config.seed)

    print("Making Dataset")
    print("\t\(config.populationCount) Samples")
    print("\t\(config.sampleSize) Values per Sample")
    print("\t\(config.isSorted ? "Sorted" : "Unsorted")")
    print("\t\(config.distribution)")

    for i in 0...config.populationCount {
        print("Creating Sample #\(i) of \(config.populationCount)...")

        var sample: [Float] = []
        switch config.distribution {
        case .uniform(let min, let max):
            sample = makeUniformDistribution(
                in: min...max,
                count: config.sampleSize,
                using: randomSource
            )
        case .normal(let mu, let sigma):
            sample = makeNormalDistribution(
                mu: mu,
                sigma: sigma,
                count: config.sampleSize,
                using: randomSource
            )
        }

        if config.isSorted {
            print("Sorting Data...")
            sample.sort()
        }

        print("New Sample: %@", sample)

        let timestamp = dateFormatter.string(from: Date())

        // example output
        let outputFileName = "sample_\(timestamp).txt"
        let fileURL = config.saveLocation.appendingPathComponent(outputFileName)
        let content = sample.map {
            String($0)
        }.joined(separator: ", ")
        try content.write(to: fileURL, atomically: true, encoding: .utf8)
        print(
            "Generated [\(i)/\(config.populationCount)] -> \(fileURL.lastPathComponent)"
        )
    }
}

/// Make a random value for mu
func makeRandMu(
    using src: GKMersenneTwisterRandomSource  // the random source
) -> Float {
    let mu_range = makeRandMinMaxPair(using: src)
    // create a floating point value
    let mu = makeUniformDistribution(
        in: mu_range[0]...mu_range[1],
        count: 1,
        using: src
    )
    return mu[0]
}

/// Make a random value for sigma
func makeRandSigma(
    using src: GKMersenneTwisterRandomSource  // the random source
) -> Float {
    // create a floating point value
    let sigma = makeUniformDistribution(
        in: 0.0...1.0,
        count: 1,
        using: src
    )
    return sigma[0]
}

/// Make a random min-max pairing for a uniform distribution
func makeRandMinMaxPair(
    using src: GKMersenneTwisterRandomSource  // the random source
) -> [Float] {
    // create 2 floating point values
    let gain = makeUniformDistribution(
        in: -1.0...1.0,
        count: 2,
        using: src
    )
    let values = makeUniformDistribution(
        in: 0.0...Float.greatestFiniteMagnitude,
        count: 2,
        using: src
    )
    let a = gain[0] * values[0]
    let b = gain[1] * values[1]
    //
    return [a, b].sorted()
}

/// Make a random UInt64
func makeRandSeed() -> UInt64 {
    return UInt64.random(in: .min ... .max)
}
