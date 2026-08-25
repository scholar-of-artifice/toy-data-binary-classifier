//
//  DatasetManifest.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 23/08/2026.
//

import Foundation

struct DatasetManifest: Codable {
    let datasetName: String
    let totalSamples: Int
    let featuresPerSample: Int
    let samplesPerShard: Int
    let totalShards: Int
    let classDistributions: [String: DistributionConfig]
}
