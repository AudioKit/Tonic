import XCTest
@testable import Tonic

final class NoteTests: XCTestCase {

    func testNoteOctave() {
        let c4 = Note.C
        XCTAssertEqual(c4.noteNumber, 60)
        XCTAssertEqual(c4.spelling.description, "C")

        let c5 = Note(.C, octave: 5)
        XCTAssertEqual(c5.noteNumber, 72)
        XCTAssertEqual(c5.spelling.description, "C")
    }

    func testNoteSpelling() {
        let dFlat = Note.Db
        XCTAssertEqual(dFlat.noteNumber, 61)
        XCTAssertEqual(dFlat.spelling.description, "D♭")
        XCTAssertEqual(dFlat.spelling(in: Key.C).description, "C♯")
        XCTAssertEqual(dFlat.spelling(in: Key.F).description, "D♭")

        let cSharp = Note.Cs
        XCTAssertEqual(cSharp.noteNumber, 61)
        XCTAssertEqual(cSharp.spelling.description, "C♯")
        XCTAssertEqual(cSharp.spelling(in: Key.Ab).description, "D♭")

        let dDoubleFlat = Note(.D, accidental: .doubleFlat)
        XCTAssertEqual(dDoubleFlat.noteNumber, 60)
        XCTAssertEqual(dDoubleFlat.spelling.description, "D𝄫")

        let cDoubleSharp = Note(accidental: .doubleSharp)
        XCTAssertEqual(cDoubleSharp.noteNumber, 62)
        XCTAssertEqual(cDoubleSharp.spelling.description, "C𝄪")
    }

    func testNoteShift() {
        let d = Note(.C).shiftUp(.M2)
        XCTAssertEqual(d!.spelling.description, "D")

        let eFlat = Note(.C).shiftUp(.m3)
         XCTAssertEqual(eFlat!.spelling.description, "E♭")

        let c = Note(.D).shiftDown(.M2)
        XCTAssertEqual(c!.spelling.description, "C")

        let cs = Note(.D).shiftDown(.m2)
        XCTAssertEqual(cs!.spelling.description, "C♯")
    }

}
