//
//  DistributionErrorTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 22/08/2026.
//

import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("DistributionError Tests")
struct DistributionErrorTests {
    
    @Test("Invalid Save Location Test")
    func invalidSaveLocation() {
        let error_val = DistributionError.invalidSaveLocation("asdf/1234")
        #expect(error_val.localizedDescription == "Save location must be a valid file path: asdf/1234")
    }
    
    @Test("Invalid Population Size Test")
    func invalidPopulationSize() {
        let error_val = DistributionError.invalidPopulationSize(123)
        #expect(error_val.localizedDescription == "Invalid Population Size: populationSize (123) must be greater than 0.")
    }
    
    @Test("Invalid Sample Size Test")
    func invalidSampleSize() {
        let error_val = DistributionError.invalidSampleSize(123)
        #expect(error_val.localizedDescription == "Invalid Sample Size: sampleSize (123) must be greater than 0.")
    }
    
    @Test("Invalid Range Test")
    func invalidRange() {
        let error_val = DistributionError.invalidRange(min: -100.0, max: 100.0)
        #expect(error_val.localizedDescription == "Invalid Uniform Distribution: min (-100.0) must be strictly less than max (100.0).")
    }
    
    @Test("Invalid Standard Deviation Test")
    func invalidStandardDeviation() {
        let error_val = DistributionError.invalidStandardDeviation(12.45)
        #expect(error_val.localizedDescription == "Invalid Normal Distribtion: sigma (12.45) must be greater than 0.")
    }
}

