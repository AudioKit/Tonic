import XCTest
@testable import Tonic

final class NoteTests: XCTestCase {

    func testNoteOctave() {
        let c4 = Note.C
        XCTAssertEqual(c4.noteNumber, 60)
        XCTAssertEqual(c4.description, "C4")

        let c5 = Note(.C, octave: 5)
        XCTAssertEqual(c5.noteNumber, 72)
        XCTAssertEqual(c5.description, "C5")
    }

    func testNoteSpelling() {
        let dFlat = Note.Db
        XCTAssertEqual(dFlat.noteNumber, 61)
        XCTAssertEqual(dFlat.description, "D♭4")
        XCTAssertEqual(dFlat.spelling(in: Key.C).description, "C♯")
        XCTAssertEqual(dFlat.spelling(in: Key.F).description, "D♭")

        let cSharp = Note.Cs
        XCTAssertEqual(cSharp.noteNumber, 61)
        XCTAssertEqual(cSharp.description, "C♯4")
        XCTAssertEqual(cSharp.spelling(in: Key.Ab).description, "D♭")

        let dDoubleFlat = Note(.D, accidental: .doubleFlat)
        XCTAssertEqual(dDoubleFlat.noteNumber, 60)
        XCTAssertEqual(dDoubleFlat.description, "D𝄫4")

        let cDoubleSharp = Note(accidental: .doubleSharp)
        XCTAssertEqual(cDoubleSharp.noteNumber, 62)
        XCTAssertEqual(cDoubleSharp.description, "C𝄪4")
    }

    func testNoteShift() {
        let d = Note(.C).shiftUp(.M2)
        XCTAssertEqual(d!.description, "D4")

        let eFlat = Note(.C).shiftUp(.m3)
         XCTAssertEqual(eFlat!.description, "E♭4")

        let c = Note(.D).shiftDown(.M2)
        XCTAssertEqual(c!.description, "C4")

        let cs = Note(.D).shiftDown(.m2)
        XCTAssertEqual(cs!.description, "C♯4")
    }

    func testNoteIntValue() {

        let lowest = Note(.C, octave: -1).intValue
        let highest = Note(pitch: Pitch(127), key: .C).intValue

        for i in lowest..<highest {
            let n = Note(intValue: i)
            XCTAssertEqual(n.intValue, i)
        }

    }

    func testNoteSetFirst() {

        let chord = Chord(notes: [.C, .E, .G])
        let set = chord.noteSet

        XCTAssertEqual(set.first, Note(.C))

    }

}
