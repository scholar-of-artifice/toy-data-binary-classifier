//
//  DistributionsTests.swift
//  ToyDataBinaryClassifierFactoryTests
//
//  Created by scholar-of-artifice on 05/08/2026.
//

import Testing

@Suite("Distribution Tests")
struct DistributionsTests {

    @Test("Array length matches requested count")
    func countMatches() async throws {
        var generator: RandomNumberGenerator = SystemRandomNumberGenerator()
        let expected_size = 50
        let test_range: ClosedRange<Float> = 0.0...1.0
        let result = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: &generator
        )
        
        #expect(result.count == expected_size)
    }

}
