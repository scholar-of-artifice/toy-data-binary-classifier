//
//  LinearGradientTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 20/09/2026.
//

import Foundation
import GameplayKit
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("LinearGradient Tests")
struct LinearGradientTests {

    @Test("Size 0")
    func correctGradientSizeZero() {

        let b: ClosedRange<Float> = -1.0...1.0
        let l = 0

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = []

        #expect(gradient.count == 0)
        #expect(gradient == expectedGradient)
    }

    @Test("ConstantBounds")
    func correctGradientForConstantBounds() {

        let b: ClosedRange<Float> = 1.0...1.0
        let l = 10

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = [
            1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
        ]

        #expect(gradient.count == 10)
        #expect(gradient == expectedGradient)
    }

    @Test("A linear gradient between -1.0 and 1.0 of even length")
    func correctGradientFromNegativeOneToOneEvenLength() {

        let b: ClosedRange<Float> = -1.0...1.0
        let l = 20

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = [
            -1.0, -0.8947368, -0.78947365, -0.68421054, -0.57894737, -0.4736842,
            -0.36842108, -0.2631579, -0.15789473, -0.052631557, 0.052631617,
            0.15789473, 0.26315784, 0.36842108, 0.4736842, 0.5789474,
            0.68421054, 0.78947365, 0.8947369, 1.0,
        ]

        #expect(gradient.count == 20)
        #expect(gradient == expectedGradient)
    }

    @Test("A linear gradient between 0.0 and 10.0 of even length")
    func correctGradientFromZeroToTenEvenLength() {

        let b: ClosedRange<Float> = 0.0...10.0
        let l = 22

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = [
            0.0, 0.47619048, 0.95238096, 1.4285715, 1.9047619, 2.3809524,
            2.857143, 3.3333335, 3.8095238, 4.285714, 4.7619047, 5.2380953,
            5.714286, 6.1904764, 6.666667, 7.1428576, 7.6190476, 8.095238,
            8.571428, 9.047619, 9.523809, 10.0,
        ]

        #expect(gradient.count == 22)
        #expect(gradient == expectedGradient)
    }

    @Test("A linear gradient between -32.0 and 0.0 of even length")
    func correctGradientFromNegativeThirtyTwoToZeroEvenLength() {

        let b: ClosedRange<Float> = -32.0...0.0
        let l = 24

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = [
            -32.0, -30.608696, -29.217392, -27.826088, -26.434782, -25.043478,
            -23.652174, -22.26087, -20.869564, -19.47826, -18.086956,
            -16.695652, -15.304348, -13.913044, -12.52174, -11.130434, -9.73913,
            -8.347826, -6.956522, -5.565218, -4.173914, -2.782608, -1.391304,
            0.0,
        ]

        #expect(gradient.count == 24)
        #expect(gradient == expectedGradient)
    }

    @Test("A linear gradient between -1.0 and 1.0 of odd length")
    func correctGradientFromNegativeOneToOneOddLength() {

        let b: ClosedRange<Float> = -1.0...1.0
        let l = 21

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = [
            -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.39999998, -0.3, -0.19999999,
            -0.100000024, 0.0, 0.100000024, 0.20000005, 0.29999995, 0.39999998,
            0.5, 0.6, 0.70000005, 0.79999995, 0.9, 1.0,
        ]

        #expect(gradient.count == 21)
        #expect(gradient == expectedGradient)
    }

    @Test("A linear gradient between 0.0 and 10.0 of odd length")
    func correctGradientFromZeroToTenOddLength() {

        let b: ClosedRange<Float> = -0.0...10.0
        let l = 23

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = [
            0.0, 0.45454547, 0.90909094, 1.3636364, 1.8181819, 2.2727273,
            2.7272727, 3.181818, 3.6363637, 4.090909, 4.5454545, 5.0, 5.4545455,
            5.9090905, 6.363636, 6.818182, 7.2727275, 7.7272725, 8.181818,
            8.636364, 9.090909, 9.545454, 10.0,
        ]

        #expect(gradient.count == 23)
        #expect(gradient == expectedGradient)
    }

    @Test("A linear gradient between -32.0 and 0.0 of odd length")
    func correctGradientFromNegativeThirtyTwoToZeroOddLength() {

        let b: ClosedRange<Float> = -32.0...0.0
        let l = 27

        let gradient = generateLinearGradient(bounds: b, length: l)
        let expectedGradient: [Float] = [
            -32.0, -30.76923, -29.538462, -28.307692, -27.076923, -25.846153,
            -24.615385, -23.384615, -22.153847, -20.923077, -19.692307,
            -18.461538, -17.23077, -16.0, -14.76923, -13.538462, -12.307692,
            -11.076923, -9.846153, -8.615385, -7.384615, -6.1538467, -4.9230766,
            -3.6923084, -2.4615383, -1.2307701, 0.0,
        ]

        #expect(gradient.count == 27)
        #expect(gradient == expectedGradient)
    }

}
