import XCTest
@testable import Tonic

final class IntervalTests: XCTestCase {
    func testInterval() {
        XCTAssertEqual(Interval.betweenNotes(.C, .D), .M2)
        XCTAssertEqual(Interval.betweenNotes(.C, .G), .P5)
        XCTAssertEqual(Interval.betweenNotes(.G, .C), .P5)
        XCTAssertEqual(Interval.betweenNotes(.C, .Fb), .d4)
    }

    func testInterval2() {
        XCTAssertEqual(Interval2.P1.semitones, 0)
        XCTAssertEqual(Interval2.P4.semitones, 5)
        XCTAssertEqual(Interval2.P5.semitones, 7)
        XCTAssertEqual(Interval2.P8.semitones, 12)
        XCTAssertEqual(Interval2.P11.semitones, 17)
        XCTAssertEqual(Interval2.P12.semitones, 19)
        XCTAssertEqual(Interval2.P15.semitones, 24)

        XCTAssertEqual(Interval2.m2.semitones, 1)
        XCTAssertEqual(Interval2.m3.semitones, 3)
        XCTAssertEqual(Interval2.m6.semitones, 8)
        XCTAssertEqual(Interval2.m7.semitones, 10)
        XCTAssertEqual(Interval2.m9.semitones, 13)
        XCTAssertEqual(Interval2.m10.semitones, 15)
        XCTAssertEqual(Interval2.m13.semitones, 20)
        XCTAssertEqual(Interval2.m14.semitones, 22)

        XCTAssertEqual(Interval2.M2.semitones, 2)
        XCTAssertEqual(Interval2.M3.semitones, 4)
        XCTAssertEqual(Interval2.M6.semitones, 9)
        XCTAssertEqual(Interval2.M7.semitones, 11)
        XCTAssertEqual(Interval2.M9.semitones, 14)
        XCTAssertEqual(Interval2.M10.semitones, 16)
        XCTAssertEqual(Interval2.M13.semitones, 21)
        XCTAssertEqual(Interval2.M14.semitones, 23)

        XCTAssertEqual(Interval2.d1.semitones, -1)
        XCTAssertEqual(Interval2.d2.semitones, 0)
        XCTAssertEqual(Interval2.d3.semitones, 2)
        XCTAssertEqual(Interval2.d4.semitones, 4)
        XCTAssertEqual(Interval2.d5.semitones, 6)
        XCTAssertEqual(Interval2.d6.semitones, 7)
        XCTAssertEqual(Interval2.d7.semitones, 9)
        XCTAssertEqual(Interval2.d8.semitones, 11)
        XCTAssertEqual(Interval2.d9.semitones, 12)
        XCTAssertEqual(Interval2.d10.semitones, 14)
        XCTAssertEqual(Interval2.d11.semitones, 16)
        XCTAssertEqual(Interval2.d12.semitones, 18)
        XCTAssertEqual(Interval2.d13.semitones, 19)
        XCTAssertEqual(Interval2.d14.semitones, 21)
        XCTAssertEqual(Interval2.d15.semitones, 23)

        XCTAssertEqual(Interval2.A1.semitones, 1)
        XCTAssertEqual(Interval2.A2.semitones, 3)
        XCTAssertEqual(Interval2.A3.semitones, 5)
        XCTAssertEqual(Interval2.A4.semitones, 6)
        XCTAssertEqual(Interval2.A5.semitones, 8)
        XCTAssertEqual(Interval2.A6.semitones, 10)
        XCTAssertEqual(Interval2.A7.semitones, 12)
        XCTAssertEqual(Interval2.A8.semitones, 13)
        XCTAssertEqual(Interval2.A9.semitones, 15)
        XCTAssertEqual(Interval2.A10.semitones, 17)
        XCTAssertEqual(Interval2.A11.semitones, 18)
        XCTAssertEqual(Interval2.A12.semitones, 20)
        XCTAssertEqual(Interval2.A13.semitones, 22)
        XCTAssertEqual(Interval2.A14.semitones, 24)
        XCTAssertEqual(Interval2.A15.semitones, 25)
    }

}
