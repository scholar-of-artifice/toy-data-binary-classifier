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
    
    @Suite("UniformDistribution Tests")
    struct UniformDistribution {
        
        @Test("Array length matches requested count")
        func countMatches() async throws {
            let seed = UInt64(32)
            let generator = GKMersenneTwisterRandomSource(seed: seed)
            let expected_size = 50
            let test_range: ClosedRange<Float> = 0.0...1.0
            let result = makeUniformDistribution(
                in: test_range,
                count: expected_size,
                using: generator
            )
            
            #expect(result.count == expected_size)
        }
         
         @Test("Produces a values within the specified bounds")
         func valuesWithinBounds() async throws {
             let seed = UInt64(32)
             let generator = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 50
             let test_range: ClosedRange<Float> = 0.0...1.0
             let result = makeUniformDistribution(
                 in: test_range,
                 count: expected_size,
                 using: generator
             )
             for value in result {
                 #expect(-1.0 <= value && value <= 1.0)
             }
         }
         
         @Test("Identical seeded generators produce identical distributions")
         func identicalResults() async throws {
             let seed = UInt64(32)
             let generatorA = GKMersenneTwisterRandomSource(seed: seed)
             let generatorB = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 10000
             let test_range: ClosedRange<Float> = -1.0...1.0
             let resultA = makeUniformDistribution(
                 in: test_range,
                 count: expected_size,
                 using: generatorA
             )
             let resultB = makeUniformDistribution(
                 in: test_range,
                 count: expected_size,
                 using: generatorB
             )
             #expect(resultA == resultB)
         }
        
         @Test("Zero count produces an empty array")
         func zeroCountIsEmpty() async throws {
             let seed = UInt64(32)
             let generator = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 0
             let test_range: ClosedRange<Float> = -1.0...1.0
             let result = makeUniformDistribution(
                 in: test_range,
                 count: expected_size,
                 using: generator
             )
             #expect(result.isEmpty)
         }
        
         @Test("Negative count produces an empty array")
         func negativeCountIsEmpty() async throws {
        let seed = UInt64(32)
        let generator = GKMersenneTwisterRandomSource(seed: seed)
        let expected_size = -2
        let test_range: ClosedRange<Float> = -1.0...1.0
        let result = makeUniformDistribution(
            in: test_range,
            count: expected_size,
            using: generator
        )
        #expect(result.isEmpty)
         }
        
         @Test("Example Result")
         func knownExampleSmall() async throws {
             let seed = UInt64(32)
             let generator = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 10
             let test_range: ClosedRange<Float> = -2.3...5.7
             let result = makeUniformDistribution(
                 in: test_range,
                 count: expected_size,
                 using: generator
             )
             let expected_result: [Float] = [5.0881767, 5.4566193, -1.8898633, 3.1530886, 1.1397996, 2.5052123, 1.5382903, 4.17603, 5.5699725, 4.2105317]
             #expect(result == expected_result)
         }
        /*
         */
    }

    
    @Suite("NormalDistribution Tests")
    struct NormalDistribution {
         @Test("Array length matches requested count")
         func countMatches() async throws {
             let seed = UInt64(32)
             let generator = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 11
             
             let result = makeNormalDistribution(
                 mu: 2.0,
                 sigma: 3.0,
                 count: expected_size,
                 using: generator
             )
             #expect(result.count == expected_size)
         }
        
         @Test("Identical seeded generators produce identical distributions")
         func identicalResults() async throws {
             let seed = UInt64(42)
             let generatorA = GKMersenneTwisterRandomSource(seed: seed)
             let generatorB = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 10000
             let resultA = makeNormalDistribution(
                 mu: 2.0,
                 sigma: 3.0,
                 count: expected_size,
                 using: generatorA
             )
             let resultB = makeNormalDistribution(
                 mu: 2.0,
                 sigma: 3.0,
                 count: expected_size,
                 using: generatorB
             )
             #expect(resultA == resultB)
         }
        
         @Test("Zero count produces an empty array")
         func zeroCountIsEmpty() async throws {
             let seed = UInt64(42)
             let generator = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 0
             
             let result = makeNormalDistribution(
                 mu: 2.0,
                 sigma: 3.0,
                 count: expected_size,
                 using: generator
             )
             #expect(result.count == expected_size)
         }
        
         @Test("Negative count produces an empty array")
         func negativeCountIsEmpty() async throws {
             let seed = UInt64(42)
             let generator = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 0
             
             let result = makeNormalDistribution(
                 mu: 2.0,
                 sigma: 3.0,
                 count: -10,
                 using: generator
             )
             #expect(result.count == expected_size)
         }
         
         @Test("Example Result")
         func knownExampleSmall() async throws {
             let seed = UInt64(42)
             let generator = GKMersenneTwisterRandomSource(seed: seed)
             let expected_size = 10
             
             let result = makeNormalDistribution(
                 mu: 2.0,
                 sigma: 3.0,
                 count: expected_size,
                 using: generator
             )
             let expected_result: [Float] = [0.5563469, 0.27638996, 3.4837513, 3.7103643, 3.1236625, 2.7540622, -0.20336771, 4.262645, -1.7254286, 5.071278]
             #expect(result == expected_result)
         }
    }



}
