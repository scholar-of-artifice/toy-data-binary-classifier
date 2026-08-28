//
//  DiskExportPipeline.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 27/08/2026.
//

import Foundation
import GameplayKit

class DiskExportPipeline: DataPipeline {
    private let exporter: DiskExporter
    private let config: SampleConfig
    private let label: Int

    init(exporter: DiskExporter, config: SampleConfig, label: Int) {
        self.exporter = exporter
        self.config = config
        self.label = label
    }

    func run() throws {
        print("Starting disk export pipeline...")
        let randomSource = GKMersenneTwisterRandomSource(seed: config.seed)
        let generator: DistributionGenerating

        switch config.distribution {
        case .uniform(let min, let max):
            generator = UniformGenerator(
                range: min...max,
                source: randomSource
            )
        case .normal(let mu, let sigma):
            generator = NormalGenerator(
                mu: mu,
                sigma: sigma,
                source: randomSource
            )
        }
        let populationSize = Int(config.populationCount)
        let sampleSize = config.sampleSize

        for i in 0..<populationSize {
            
            print("Writing sample \(i + 1)/\(populationSize)...")
            
            try Task.checkCancellation()
            var rawFeatures = generator.generate(count: config.sampleSize)
            if config.isSorted {
                rawFeatures.sort()
            }
            let features = rawFeatures.map { Double($0) }
            let record = SampleRecord(label: i, features: features)
            try exporter.writeSample(record)
            // periodic yield ?
        }
        try exporter.finalize()
        let distConfig: DistributionConfig

        switch config.distribution {
        case .uniform(let min, let max):
            distConfig = DistributionConfig(
                type: "uniform",
                parameters: ["min": Double(min), "max": Double(max)]
            )
        case .normal(let mu, let sigma):
            distConfig = DistributionConfig(
                type: "uniform",
                parameters: ["mu": Double(mu), "sigma": Double(sigma)]
            )
        }
        let totalShards = Int(ceil(Double(populationSize) / Double(exporter.samplesPerShard)))

        let manifest = DatasetManifest(
            datasetName: config.saveLocation.lastPathComponent, totalSamples: populationSize, featuresPerSample: config.sampleSize, samplesPerShard: exporter.samplesPerShard, totalShards: totalShards, classDistributions: ["\(label)": distConfig]
        )
        try exporter.writeManifest(manifest)
        
        print("Disk export complete...")
        print("Results located at:\n\t\(config.saveLocation.path)")
    }
}
