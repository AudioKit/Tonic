import XCTest
@testable import Tonic

final class TonicTests: XCTestCase {
    func testNoteSpelling() {
        let note = Note(midiNoteNumber: 60, accientalShift: 0)
        XCTAssertEqual(note.spelling, "C")

        let note2 = Note(midiNoteNumber: 61, accientalShift: -1)
        XCTAssertEqual(note2.spelling, "D♭")

        let note3 = Note(midiNoteNumber: 61, accientalShift: 1)
        XCTAssertEqual(note3.spelling, "C♯")
    }
}
