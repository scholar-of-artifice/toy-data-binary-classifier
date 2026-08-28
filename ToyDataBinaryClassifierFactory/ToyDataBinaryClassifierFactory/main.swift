//
//  main.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 05/08/2026.
//

import Foundation
import GameplayKit

print("Hello, from ToyDataBinaryClassifierFactory!")

let currentDirectory = URL(
    fileURLWithPath: FileManager.default.currentDirectoryPath
)
let outputDirectory = currentDirectory.appending(path: "Output")

do {
    let distribution = try DistributionSpecification.makeNormal(
        mu: 0.0,
        sigma: 0.5
    )
    let config = try SampleConfig(
        saveLocation: outputDirectory,
        populationCount: 10,
        sampleSize: 5,
        seed: 1234,
        isSorted: true,
        distribution: distribution
    )
    let exporter = try DiskExporter(outDirectory: outputDirectory)
    let pipeline = DiskExportPipeline(
        exporter: exporter,
        config: config,
        label: 1
    )
    print("starting data generation")
    try pipeline.run()
    print("data generation complete")
} catch let error as DistributionError {
    print("something is wrong")
} catch {
    print("something else is wrong")
}
