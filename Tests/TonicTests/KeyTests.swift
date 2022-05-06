
import XCTest
@testable import Tonic

class KeyTests: XCTestCase {

    func testKeyNotes() {
        let cMajor = Key.C
        XCTAssertEqual(cMajor.notes.notes.map({$0.spelling.description}), ["C", "D", "E", "F", "G", "A", "B"])

        let cMinor = Key.c
        XCTAssertEqual(cMinor.notes.notes.map({$0.spelling.description}), ["C", "D", "E♭", "F", "G", "A♭", "B♭"])
    }
}
