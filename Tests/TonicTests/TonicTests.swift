import XCTest
@testable import Tonic

final class TonicTests: XCTestCase {
    func testNoteSpelling() {
        let c = Note(noteNumber: 60)
        XCTAssertEqual(c.spelling, "C")

        let dFlat = Note(noteNumber: 61, accidental: .flat)
        XCTAssertEqual(dFlat.spelling, "D♭")

        let cSharp = Note(noteNumber: 61, accidental: .sharp)
        XCTAssertEqual(cSharp.spelling, "C♯")
    }
}
