import Tonic
import XCTest

final class NoteTests: XCTestCase {
    func testNoteOctave() {
        let c4 = Note.C
        XCTAssertEqual(c4.noteNumber, 60)
        XCTAssertEqual(c4.description, "C4")

        let cb4 = Note(.C, accidental: .flat, octave: 4)
        XCTAssertEqual(cb4.noteNumber, 59)
        XCTAssertEqual(cb4.description, "C♭4")

        let c5 = Note(.C, octave: 5)
        XCTAssertEqual(c5.noteNumber, 72)
        XCTAssertEqual(c5.description, "C5")
    }

    // From: https://github.com/AudioKit/Tonic/issues/16
    //
    // AMERICAN STANDARD PITCH NOTATION (ASPN)
    // https://viva.pressbooks.pub/openmusictheory/chapter/aspn/
    // "Accidentals applied to a note do not have an effect on its ASPN number. For example, B♯3 and C4 have different octave numbers despite being enharmonically equivalent, because the B♯ is still considered part of the lower octave."
    func testThatOctaveRefersToAccidentalLessBaseNote() {
        let bs3 = Note(.B, accidental: .sharp, octave: 3)
        XCTAssertEqual(bs3.noteNumber, 60)
        XCTAssertEqual(bs3.description, "B♯3")

        let cb4 = Note(.C, accidental: .flat, octave: 4)
        XCTAssertEqual(cb4.noteNumber, 59)
        XCTAssertEqual(cb4.description, "C♭4")
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

    func testComparison() {
        XCTAssert(Note.C < Note.Cs)
    }

    func testNoteShift() {
        let d = Note(.C).shiftUp(.M2)
        XCTAssertEqual(d!.description, "D4")

        let eFlat = Note(.C).shiftUp(.m3)
        XCTAssertEqual(eFlat!.description, "E♭4")

        let db = Note(.C).shiftDown(.M7)
        XCTAssertEqual(db!.description, "D♭3")

        let ebbb = Note(.F, accidental: .doubleFlat).shiftDown(.M2)
        XCTAssertNil(ebbb)

        let c = Note(.D).shiftDown(.M2)
        XCTAssertEqual(c!.description, "C4")

        let cs = Note(.D).shiftDown(.m2)
        XCTAssertEqual(cs!.description, "C♯4")

        let eb = Note(.B).shiftUp(.d4)
        XCTAssertEqual(eb!.description, "E♭5")

        let fs = Note(.C).shiftUp(.A4)
        XCTAssertEqual(fs!.description, "F♯4")

        let asharp = Note(.C).shiftUp(.A6)
        XCTAssertEqual(asharp!.description, "A♯4")

        let c6 = Note(.G).shiftUp(.P11)
        XCTAssertEqual(c6!.description, "C6")

        let g = Note(.C, octave: 6).shiftDown(.P11)
        XCTAssertEqual(g!.description, "G4")

        var notesAugmentedTriadShiftUpIntoE: [Note] = []
        for interval in ChordType.augmentedTriad.intervals {
            if let shifted = Note(.E, accidental: .natural, octave: 0).shiftUp(interval) {
                notesAugmentedTriadShiftUpIntoE.append(shifted)
            }
        }
        XCTAssertEqual(notesAugmentedTriadShiftUpIntoE[0].description, "G♯0")
        XCTAssertEqual(notesAugmentedTriadShiftUpIntoE[1].description, "B♯0")
    }

    func testNoteShiftLimits() {
        let ebbb = Note(.F, accidental: .doubleFlat).shiftDown(.M2)
        XCTAssertNil(ebbb)

        let fsss = Note(.E, accidental: .doubleSharp).shiftUp(.M2)
        XCTAssertNil(fsss)
    }

    func testNoteDistance() {
        XCTAssertEqual(Note.C.semitones(to: Note.D), 2)
        XCTAssertEqual(Note.C.semitones(to: Note.G), 7)
        XCTAssertEqual(Note.C.semitones(to: Note(.G, octave: 3)), 5)
    }

    func testNoteIntValue() {
        let lowest = Note(.C, octave: -1).intValue
        let highest = Note(pitch: Pitch(127), key: .C).intValue

        for i in lowest ..< highest {
            let n = Note(intValue: i)
            XCTAssertEqual(n.intValue, i)
        }
    }

    func testNoteSet() {
        var set0 = NoteSet()
        var set1 = NoteSet()
        set0.add(Note.C)
        set1.add(Note.D)

        XCTAssertTrue(set0.contains(Note.C))
        XCTAssertEqual(set0.first, Note.C)

        let u = set0.union(set1)
        XCTAssertEqual(u.count, 2)

        set0.remove(Note.C)
        XCTAssertTrue(set0.array.isEmpty)

        let empty = NoteSet()
        XCTAssertNil(empty.first)
    }
}
