//
//  DatasetManifest.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 23/08/2026.
//

import Foundation

/// A manifest describing the structural metadata, sharding layout, and calss distributions of an exported synthetic dataset.
///
/// Use `DatasetManifest` to persist and verify dataset configurations produced by the factory pipelines, including shard partitioning and the generation parameters used for each binary class.
struct DatasetManifest: Codable {

    /// The human-readable name or identifier of the dataset.
    let datasetName: String

    /// The cumulative number of samples across all generated partitions.
    let totalSamples: Int

    /// The number of feature dimensions contained within each sample records.
    let featuresPerSample: Int

    /// The maximum number of sample records bundled into a single file shard.
    let samplesPerShard: Int

    /// The total count of file shards produced during export.
    let totalShards: Int

    /// The statistical distribution configuration keyed by class label.
    let classDistributions: [String: DistributionConfig]

    /// Creates a new dataset manifest.
    ///
    /// - Parameters:
    ///     - datasetName: The human-readable name or identifier of the dataset.
    ///     - totalSamples: The cumulative number of samples across all generated partitions.
    ///     - featuresPerSample: The number of feature dimensions contained within each sample records.
    ///     - samplesPerShard: The maximum number of sample records bundled into a single file shard.
    ///     - totalShards: The total count of file shards produced during export.
    ///     - classDistributions: The statistical distribution configuration keyed by class label.
    public init(
        datasetName: String,
        totalSamples: Int,
        featuresPerSample: Int,
        samplesPerShard: Int,
        totalShards: Int,
        classDistributions: [String: DistributionConfig]
    ) {
        self.datasetName = datasetName
        self.totalSamples = totalSamples
        self.featuresPerSample = featuresPerSample
        self.samplesPerShard = samplesPerShard
        self.totalShards = totalShards
        self.classDistributions = classDistributions
    }
}
