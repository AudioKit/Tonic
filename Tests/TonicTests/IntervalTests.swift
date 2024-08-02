import Tonic
import XCTest

final class IntervalTests: XCTestCase {
    func testIntervalBetween() {
        XCTAssertEqual(Interval.betweenNotes(.C, .D), .M2)
        XCTAssertEqual(Interval.betweenNotes(.C, .Ds), .A2)
        XCTAssertEqual(Interval.betweenNotes(.C, .G), .P5)
        XCTAssertEqual(Interval.betweenNotes(.G, .C), .P5)
        XCTAssertEqual(Interval.betweenNotes(.C, .Fs), .A4)
        XCTAssertEqual(Interval.betweenNotes(.C, .Gb), .d5)
        XCTAssertEqual(Interval.betweenNotes(.C, Note(.D, accidental: .doubleFlat)), .d2)
        XCTAssertEqual(Interval.betweenNotes(.D, Note(.F, accidental: .flat)), .d3)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.D, octave: 2)), .M9)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.C, octave: 2)), .P8)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.C, accidental: .flat, octave: 0)), .A1)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.C, accidental: .flat, octave: 1)), .d8)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.C, accidental: .sharp, octave: 2)), .A8)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.A, accidental: .doubleFlat, octave: 2)), .d13)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.C, accidental: .sharp, octave: 3)), .A15)
        XCTAssertEqual(Interval.betweenNotes(Note(.C, octave: 1), Note(.C, octave: 3)), .P15)
    }
}
