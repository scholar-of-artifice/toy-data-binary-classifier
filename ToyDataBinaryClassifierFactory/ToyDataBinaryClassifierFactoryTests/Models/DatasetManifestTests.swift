//
//  DatasetManifestTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 24/08/2026.
//

import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("DatasetManifest Tests")
struct DatasetManifestTests {

    @Test("Encode Decode Successfully To Expected JSON Test")
    func encodeDecodeSuccessfullyToExpectedJSON() throws {

        let configA = DistributionConfig(
            type: "normal",
            parameters: ["mean": 0.0, "stdDev": 1.0]
        )
        let configB = DistributionConfig(
            type: "uniform",
            parameters: ["min": -1.0, "max": 1.0]
        )
        let originalManifest = DatasetManifest(
            datasetName: "TestManifest",
            totalSamples: 1000,
            featuresPerSample: 2,
            samplesPerShard: 100,
            totalShards: 10,
            classDistributions: ["class_0": configA, "class_1": configB]
            
        )
        
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        let encodedData = try encoder.encode(originalManifest)
        let decodedManifest = try decoder.decode(DatasetManifest.self, from: encodedData)
        
        #expect(decodedManifest.datasetName == "TestManifest")
        #expect(decodedManifest.totalSamples == 1000)
        #expect(decodedManifest.featuresPerSample == 2)
        #expect(decodedManifest.totalShards == 10)
        #expect(decodedManifest.classDistributions.keys.contains("class_0"))
        #expect(decodedManifest.classDistributions.keys.contains("class_1"))
        
        #expect(decodedManifest.classDistributions["class_0"]?.type == "normal")
        #expect(decodedManifest.classDistributions["class_1"]?.type == "uniform")
    }
}
