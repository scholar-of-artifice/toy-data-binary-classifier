//
//  NormalGeneratorTests.swift
//  ToyDataBinaryClassifierFactoryTests
//
//  Created by scholar-of-artifice on 22/08/2026.
//

import Foundation
import GameplayKit
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("NormalGenerator Tests")
struct NormalGeneratorTests {

    @Test("Generate Known Random Number")
    func successfulInitialization() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
            source: mt_src_A
        )

        let val_A = g_A.generate(count: 1).first!

        #expect(val_A == -0.36294162)
    }

    @Test("Two Different Sources With Same Seed Produce Same Result")
    func twoDifferentSourcesWithSameSeedProduceSameResults() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )
        let mt_src_B = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
            source: mt_src_A
        )
        let g_B = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
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

        let g_A = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
            source: mt_src_A
        )
        let g_B = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
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

        let g_A = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
            source: mt_src_A
        )
        let g_B = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
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

        let g_A = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
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

        let g_A = NormalGenerator(
            mu: 1.0,
            sigma: 1.0,
            source: mt_src_A
        )

        let result = g_A.generate(count: 15)

        let expected_result: [Float] = [
            -0.36294162, 2.0892794, 1.1820605, -0.7190144, 0.19228047,
            1.9044698, 1.6938262, 1.4657509, 0.2551946, 1.8455899, 2.5472243,
            1.3060486, 1.51406, 1.6184213, -0.15549207,
        ]
        #expect(result == expected_result)
    }
    
    @Test("Does Not Overflow")
    func doesNotOverflow() {
        let mt_src_A = GKMersenneTwisterRandomSource(
            seed: 430_103_027 as UInt64
        )

        let g_A = NormalGenerator(
            mu: Float.greatestFiniteMagnitude,
            sigma: 1.0,
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
