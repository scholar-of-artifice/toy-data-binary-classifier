//
//  SampleConfigTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 22/08/2026.
//

import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("SampleConfig Tests")
struct SampleConfigTests {

    // reusable dummy data for tests
    let validURL = URL(fileURLWithPath: "/tmp/mock_data.csv")
    // make a distribution specification
    func getValidDistribution() throws -> DistributionSpecification {
        try DistributionSpecification.makeUniform(min: 0.0, max: 1.0)
    }

    @Test("Successful Initialization Test")
    func successfulInitialization() {
        do {
            let config = try SampleConfig(
                saveLocation: validURL,
                populationCount: 1000,
                sampleSize: 50,
                seed: 12345,
                isSorted: false,
                distribution: try getValidDistribution()
            )
            #expect(config.populationCount == 1000)
            #expect(config.sampleSize == 50)
            #expect(config.seed == 12345)
            #expect(config.isSorted == false)
        } catch {
            Issue.record(
                "Valid initialization should not throw; received error instead: \(error)"
            )
        }
    }
    
    @Test("Throws On Zero Population Test")
    func throwsOnZeroPopulation() {
        #expect(throws: DistributionError.invalidPopulationSize(0)) {
            try SampleConfig(
               saveLocation: validURL,
               populationCount: 0,
               sampleSize: 50,
               seed: 12345,
               isSorted: false,
               distribution: try getValidDistribution()
           )
        }
    }
    
    @Test("Throws On Zero Sample Size Test")
    func throwsOnZeroSampleSize() {
        #expect(throws: DistributionError.invalidSampleSize(0)) {
            try SampleConfig(
               saveLocation: validURL,
               populationCount: 1000,
               sampleSize: 0,
               seed: 12345,
               isSorted: false,
               distribution: try getValidDistribution()
           )
        }
    }
    
    @Test("Throws On Negative Sample Size Test")
    func throwsOnNegativeSampleSize() {
        #expect(throws: DistributionError.invalidSampleSize(-10)) {
            try SampleConfig(
               saveLocation: validURL,
               populationCount: 1000,
               sampleSize: -10,
               seed: 12345,
               isSorted: false,
               distribution: try getValidDistribution()
           )
        }
    }
}
