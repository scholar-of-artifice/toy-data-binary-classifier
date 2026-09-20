//
//  SineGradientTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 20/09/2026.
//

import Foundation
import GameplayKit
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("SineGradient Tests")
struct SineGradientTests {

    @Suite("Stead State Sinusoidal Tests")
    struct SteadyStateSinusoidalTests {

        @Test("A sinusoidal gradient between -1.0 and 1.0 of even length")
        func correctGradientFromNegativeOneToOneEvenLength() {

            let b: ClosedRange<Float> = -1.0...1.0
            let l = 20

            let gradient = generateSineGradient(bounds: b, length: l)
            let expectedGradient: [Float] = [
                0.0, 0.32469946, 0.6142127, 0.8371664, 0.9694003, 0.9965845,
                0.9157734, 0.7357239, 0.4759474, 0.16459462, -0.16459456,
                -0.47594714, -0.73572373, -0.9157732, -0.9965845, -0.96940035,
                -0.8371665, -0.61421293, -0.32469952, -3.019916e-07,
            ]

            #expect(gradient.count == 20)
            #expect(gradient == expectedGradient)
            #expect(gradient.min()! >= -1.0)
            #expect(gradient.max()! <= 1.0)
        }

        @Test("Size 0")
        func correctGradientSizeZero() {

            let b: ClosedRange<Float> = -1.0...1.0
            let l = 0

            let gradient = generateSineGradient(bounds: b, length: l)
            let expectedGradient: [Float] = []

            #expect(gradient.count == 0)
            #expect(gradient == expectedGradient)
        }

        @Test("ConstantBounds")
        func correctGradientForConstantBounds() {

            let b: ClosedRange<Float> = 1.0...1.0
            let l = 10

            let gradient = generateSineGradient(bounds: b, length: l)
            let expectedGradient: [Float] = [
                1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
            ]

            #expect(gradient.count == 10)
            #expect(gradient == expectedGradient)
        }
        
        @Test(
            "A sinusoidal gradient between -1.0 and 1.0 of even length with higher frequency"
        )
        func correctGradientFromNegativeOneToOneEvenLengthHighFrequency() {

            let b: ClosedRange<Float> = -1.0...1.0
            let l = 20
            let f: Float = 2.0

            let gradient = generateSineGradient(
                bounds: b,
                length: l,
                frequency: f
            )
            let expectedGradient: [Float] = [
                0.0, 0.6142127, 0.9694003, 0.9157734, 0.4759474, -0.16459456,
                -0.73572373, -0.9965845, -0.8371665, -0.32469952, 0.3246994,
                0.8371662, 0.99658453, 0.7357243, 0.16459468, -0.47594687,
                -0.9157733, -0.9694004, -0.6142128, -6.039832e-07,
            ]

            #expect(gradient.count == 20)
            #expect(gradient == expectedGradient)
            #expect(gradient.min()! >= -1.0)
            #expect(gradient.max()! <= 1.0)
        }

        @Test(
            "A sinusoidal gradient between -1.0 and 1.0 of even length with phase shift"
        )
        func correctGradientFromNegativeOneToOneEvenLengthPhaseShift() {

            let b: ClosedRange<Float> = -1.0...1.0
            let l = 20
            let p: Float = 1.0

            let gradient = generateSineGradient(bounds: b, length: l, phase: p)
            let expectedGradient: [Float] = [
                0.84147096, 0.97131366, 0.9958994, 0.912564, 0.7303381,
                0.46896878, 0.15677941, -0.17239945, -0.48289615, -0.74106354,
                -0.9189252, -0.9972071, -0.9674261, -0.8328096, -0.6079451,
                -0.31720057, 0.007917973, 0.33217803, 0.62044185, 0.84147084,
            ]

            #expect(gradient.count == 20)
            #expect(gradient == expectedGradient)
            #expect(gradient.min()! >= -1.0)
            #expect(gradient.max()! <= 1.0)
        }

        @Test(
            "A sinusoidal gradient between -1.0 and 1.0 with decay"
        )
        func correctGradientFromNegativeOneToOneEvenLengthDecay() {

            let b: ClosedRange<Float> = -1.0...1.0
            let l = 20
            let d: Float = 1.0

            let gradient = generateSineGradient(bounds: b, length: l, decay: d)
            let expectedGradient: [Float] = [
                0.0, 0.30805194, 0.55284524, 0.7148896, 0.78536713, 0.76599526,
                0.6677938, 0.5089928, 0.3123907, 0.1024937, -0.097238764,
                -0.26676267, -0.39122224, -0.4619969, -0.47698823, -0.4401889,
                -0.36065352, -0.25103813, -0.12590551, -1.11096504e-07,
            ]

            #expect(gradient.count == 20)
            #expect(gradient == expectedGradient)
            #expect(gradient.min()! >= -1.0)
            #expect(gradient.max()! <= 1.0)
        }

        @Test("A sinusoidal gradient between -2.0 and 10.23 of odd length")
        func correctGradientFromNegativeTwoToTenPointTwoThreeOddLength() {

            let b: ClosedRange<Float> = -2.0...10.0
            let l = 25

            let gradient = generateSineGradient(bounds: b, length: l)
            let expectedGradient: [Float] = [
                4.0, 5.552914, 7.0, 8.2426405, 9.196153, 9.795555, 10.0,
                9.795555,
                9.196152, 8.2426405, 7.0000014, 5.5529146, 4.000001, 2.4470856,
                1.0000012, -0.24263954, -1.1961527, -1.7955542, -2.0,
                -1.7955551,
                -1.1961541, -0.24264145, 0.99999905, 2.4470844, 3.999998,
            ]

            #expect(gradient.count == 25)
            #expect(gradient == expectedGradient)
            #expect(gradient.min()! >= -2.0)
            #expect(gradient.max()! <= 10.23)
        }
    }

}
