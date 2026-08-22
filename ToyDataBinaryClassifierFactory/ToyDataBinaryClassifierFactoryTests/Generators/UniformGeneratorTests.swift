//
//  UniformGeneratorTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 22/08/2026.
//

import Foundation
import GameplayKit
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("UniformGenerator Tests")
struct UniformGeneratorTests {

    @Test("Generate Known Random Number")
    func successfulInitialization() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_A
        )

        let val_A = g_A.generate(count: 1).first!

        #expect(val_A == -0.56348056)
    }

    @Test("Two Different Sources With Same Seed Produce Same Result")
    func twoDifferentSourcesWithSameSeedProduceSameResults() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )
        let mt_src_B = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_A
        )
        let g_B = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_B
        )

        let val_A = g_A.generate(count: 1).first!
        let val_B = g_B.generate(count: 1).first!

        #expect(val_A == val_B)
    }

    @Test(
        "Two Different Sources With Different Seeds Produce Different Results"
    )
    func twoDifferentSourcesWithDifferentSeedsProduceDifferentResults() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )
        let mt_src_B = GKMersenneTwisterRandomSource(
            seed: 430_103_031 as UInt64
        )

        let g_A = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_A
        )
        let g_B = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_B
        )

        let val_A = g_A.generate(count: 1).first!
        let val_B = g_B.generate(count: 1).first!

        #expect(val_A != val_B)
    }

    @Test("Two Different Generators With Same Source Produce Different Results")
    func twoDifferentGeneratorsWithSameSourceProduceDifferentResults() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_A
        )
        let g_B = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_A
        )

        let val_A = g_A.generate(count: 1).first!
        let val_B = g_B.generate(count: 1).first!

        #expect(val_A != val_B)
    }

    @Test("Generates The Correct Size Array")
    func generatesTheCorrectSizeArray() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_A
        )

        let result = g_A.generate(count: 30)

        #expect(result.isEmpty == false)
        #expect(result.count == 30)
    }

    @Test("Generates The Correct Array")
    func generatesTheCorrectArray() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = UniformGenerator(
            range: -1.0...1.0,
            source: mt_src_A
        )

        let result = g_A.generate(count: 15)

        let expected_result: [Float] = [
            -0.56348056, -0.21462369, -0.5510892, 0.533587, -0.041217566,
            -0.26796752, 0.41056144, -0.8118187, 0.059999704, -0.27014452,
            -0.42341775, -0.93783915, 0.44743907, -0.7207495, 0.024430394,
        ]
        #expect(result == expected_result)
    }

    @Test("Does Not Overflow")
    func doesNotOverflow() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = UniformGenerator(
            range: Float.leastNonzeroMagnitude...Float.greatestFiniteMagnitude,
            source: mt_src_A
        )

        let result = g_A.generate(count: 100_000)
        #expect(
            result.allSatisfy {
                abs($0) <= Float.greatestFiniteMagnitude
            }
        )
    }
}
