//
//  JSONEncoder+DeterministicTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 20/09/2026.
//

import Foundation
import GameplayKit
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("JSONEncoder+DeterministicTests Tests")
struct JSONEncoderDeterministicTestsTests {
    // A dummy data structure
    struct MockData: Encodable {
        let zebra: Int
        let apple: String
        let duck: [Int]
    }

    @Test("Encoder format with pretty printing and sorted keys.")
    func deterministicEncoderFormatsCorrectly() throws {
        let mock = MockData(
            zebra: 42,
            apple: "some data here",
            duck: [3, 5, 1]
        )
        let encoder = JSONEncoder.deterministicEncoder
        let data = try encoder.encode(mock)
        let jsonString = String(decoding: data, as: UTF8.self)
        let expectedString = """
{
  "apple" : "some data here",
  "duck" : [
    3,
    5,
    1
  ],
  "zebra" : 42
}
"""
        #expect(jsonString == expectedString)
        
    }
}
