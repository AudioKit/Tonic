import XCTest
import Tonic

final class IntervalTests: XCTestCase {
    func testIntervalBetween() {
        XCTAssertEqual(Interval.betweenNotes(.C, .D), .M2)
        XCTAssertEqual(Interval.betweenNotes(.C, .G), .P5)
        XCTAssertEqual(Interval.betweenNotes(.G, .C), .P5)
        XCTAssertEqual(Interval.betweenNotes(.C, .Fb), .d4)
    }

}
