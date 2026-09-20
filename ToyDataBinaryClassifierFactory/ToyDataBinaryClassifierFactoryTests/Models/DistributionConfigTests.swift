//
//  DistributionConfigTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 24/08/2026.
//


import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("DistributionConfig Tests")
struct DistributionConfigTests {

    @Test("Successfully Encode To Expected JSON")
    func successfullyEncodeToExpectedJSON() throws {

        let config = DistributionConfig(type: "normal", parameters: ["mean": 1.0, "stdDev": 1.0])
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let encoder = JSONEncoder.deterministicEncoder
        let data = try encoder.encode(config)
        let jsonString = String(decoding: data, as: UTF8.self)
        
        #expect(jsonString ==  "{\"parameters\":{\"mean\":1,\"stdDev\":1},\"type\":\"normal\"}")
    }
}
