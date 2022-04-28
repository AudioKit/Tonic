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

        let dDoubleFlat = Note(noteNumber: 60, accidental: .doubleFlat)
        XCTAssertEqual(dDoubleFlat.spelling, "D𝄫")

        let cDoubleSharp = Note(noteNumber: 62, accidental: .doubleSharp)
        XCTAssertEqual(cDoubleSharp.spelling, "C𝄪")
    }

    func testBluesScale() {
        print("blues intervals \(Scale.blues.intervals)")
        print("pentatonic intervals \(Scale.pentatonic.intervals)")

        XCTAssertTrue(Scale.pentatonic.isSubset(of: Scale.blues))
    }
}
