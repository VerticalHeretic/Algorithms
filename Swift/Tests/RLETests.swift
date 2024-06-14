//
//  Test.swift
//
//
//  Created by Łukasz Stachnik on 14/06/2024.
//

import Testing

@testable import Algorithms

struct RLETests {
    @Test func encodingTest() {
        let input = Array("AAAAAABBBBBBCCCCC")
        let want = Array("6A6B5C")

        let got = encode(input)

        #expect(got == want)
    }

    @Test func encodingTestOnEmptyInput() {
        let input = Array("")
        let want = Array("")

        let got = encode(input)

        #expect(got == want)
    }

    @Test func decodedTest() {
        let input = Array("6A6B5C")
        let want = Array("AAAAAABBBBBBCCCCC")

        let got = decode(input)

        #expect(got == want)
    }

    @Test func decodedTestOnEmptyInput() {
        let input = Array("")
        let want = Array("")

        let got = decode(input)

        #expect(got == want)
    }
}
