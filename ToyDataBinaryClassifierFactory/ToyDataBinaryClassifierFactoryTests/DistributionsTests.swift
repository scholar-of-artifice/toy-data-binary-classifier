//
//  DistributionsTests.swift
//  ToyDataBinaryClassifierFactoryTests
//
//  Created by scholar-of-artifice on 05/08/2026.
//

import Testing
import GameplayKit

struct LinearMockGenerator: RandomNumberGenerator {
    private var value: UInt64
    
    init(seed: UInt64 = 0) {
        self.value = seed
    }
    
    mutating func next() -> UInt64 {
        value += 1
        return value
    }
}

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
    
    @Test("Produces a values within the specified bounds")
    func valuesWithinBounds() async throws {
        var generator: RandomNumberGenerator = SystemRandomNumberGenerator()
        let expected_size = 1000
        let test_range: ClosedRange<Float> = -1.0...1.0
        let result = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: &generator
        )
        for value in result {
            #expect(-1.0 <= value && value <= 1.0)
        }
    }
    
    @Test("Identical seeded generators produce identical distributions")
    func identicalResults() async throws {
        var rngA: any RandomNumberGenerator = LinearMockGenerator(seed: 42)
        var rngB: any RandomNumberGenerator = LinearMockGenerator(seed: 42)
        let expected_size = 1000
        let test_range: ClosedRange<Float> = -1.0...1.0
        let resultA = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: &rngA
        )
        let resultB = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: &rngB
        )
        #expect(resultA == resultB)
    }
    
    @Test("Zero count produces an empty array")
    func zeroCountIsEmpty() async throws {
        var rngA: any RandomNumberGenerator = LinearMockGenerator(seed: 42)
        let expected_size = 0
        let test_range: ClosedRange<Float> = -1.0...1.0
        let resultA = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: &rngA
        )
        #expect(resultA.isEmpty)
    }
    
    @Test("Negative count produces an empty array")
    func negativeCountIsEmpty() async throws {
        var rngA: any RandomNumberGenerator =  LinearMockGenerator(seed: 42)
        let expected_size = -10
        let test_range: ClosedRange<Float> = -1.0...1.0
        let resultA = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: &rngA
        )
        #expect(resultA.isEmpty)
    }
    
    @Test("Example Result")
    func knownExampleSmall() async throws {
        var rngA: any RandomNumberGenerator =  LinearMockGenerator(seed: 42)
        let expected_size = 10
        let test_range: ClosedRange<Float> = -2.3...5.7
        let resultA = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: &rngA
        )
        let expected_result: [Float] = [-2.3, -2.3, -2.3, -2.3, -2.3, -2.3, -2.3, -2.3, -2.3, -2.3]
        #expect(resultA == expected_result)
    }

}
