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
                count: Int(config.sampleSize),
                using: randomSource
            )
        case .normal(let mu, let sigma):
            sample = makeNormalDistribution(
                mu: mu,
                sigma: sigma,
                count: Int(config.sampleSize),
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
    // log the data
    NSLog("%@", new_data)
    return new_data
}
