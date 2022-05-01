import XCTest
@testable import Tonic

final class NoteTests: XCTestCase {

    func testNoteOctave() {
        let c4 = Note.C
        XCTAssertEqual(c4.noteNumber, 60)
        XCTAssertEqual(c4.spelling, "C")

        let c5 = Note(.C, octave: 5)
        XCTAssertEqual(c5.noteNumber, 72)
        XCTAssertEqual(c5.spelling, "C")
    }

    func testNoteSpelling() {
        let dFlat = Note.Db
        XCTAssertEqual(dFlat.noteNumber, 61)
        XCTAssertEqual(dFlat.spelling, "D♭")
        XCTAssertEqual(dFlat.spelling(in: Key.C), "C♯")
        XCTAssertEqual(dFlat.spelling(in: Key.F), "D♭")

        let cSharp = Note.Cs
        XCTAssertEqual(cSharp.noteNumber, 61)
        XCTAssertEqual(cSharp.spelling, "C♯")
        XCTAssertEqual(cSharp.spelling(in: Key.Ab), "D♭")

        let dDoubleFlat = Note(.D, accidental: .doubleFlat)
        XCTAssertEqual(dDoubleFlat.noteNumber, 60)
        XCTAssertEqual(dDoubleFlat.spelling, "D𝄫")

        let cDoubleSharp = Note(accidental: .doubleSharp)
        XCTAssertEqual(cDoubleSharp.noteNumber, 62)
        XCTAssertEqual(cDoubleSharp.spelling, "C𝄪")
    }

    func testNoteShift() {
        let d = Note(.C).shiftUp(.M2)
        XCTAssertEqual(d!.spelling, "D")

        let eFlat = Note(.C).shiftUp(.m3)
         XCTAssertEqual(eFlat!.spelling, "E♭")

        let c = Note(.D).shiftDown(.M2)
        XCTAssertEqual(c!.spelling, "C")

        let cs = Note(.D).shiftDown(.m2)
        XCTAssertEqual(cs!.spelling, "C♯")
    }

}
