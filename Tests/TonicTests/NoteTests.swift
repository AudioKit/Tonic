import Tonic
import XCTest

final class NoteTests: XCTestCase {
    func testNoteOctave() {
        let middleC = Note.C
        XCTAssertEqual(middleC.noteNumber, 60)
        XCTAssertEqual(middleC.description, "C3")

        let cb3 = Note(.C, accidental: .flat, octave: 3)
        XCTAssertEqual(cb3.noteNumber, 71)
        XCTAssertEqual(cb3.description, "C♭3")

        let c4 = Note(.C, octave: 4)
        XCTAssertEqual(c4.noteNumber, 72)
        XCTAssertEqual(c4.description, "C4")
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
        XCTAssertEqual(cb4.noteNumber, 83)
        XCTAssertEqual(cb4.description, "C♭4")
    }

    func testNoteSpelling() {
        let dFlat = Note.Db
        XCTAssertEqual(dFlat.noteNumber, 61)
        XCTAssertEqual(dFlat.description, "D♭3")
        XCTAssertEqual(dFlat.spelling(in: Key.C).description, "C♯")
        XCTAssertEqual(dFlat.spelling(in: Key.F).description, "D♭")

        let cSharp = Note.Cs
        XCTAssertEqual(cSharp.noteNumber, 61)
        XCTAssertEqual(cSharp.description, "C♯3")
        XCTAssertEqual(cSharp.spelling(in: Key.Ab).description, "D♭")

        let dDoubleFlat = Note(.D, accidental: .doubleFlat)
        XCTAssertEqual(dDoubleFlat.noteNumber, 60)
        XCTAssertEqual(dDoubleFlat.description, "D𝄫3")

        let cDoubleSharp = Note(accidental: .doubleSharp)
        XCTAssertEqual(cDoubleSharp.noteNumber, 62)
        XCTAssertEqual(cDoubleSharp.description, "C𝄪3")
    }

    func testComparison() {
        XCTAssert(Note.C < Note.Cs)
    }

    func testNoteShift() {
        let d = Note(.C).shiftUp(.M2)
        XCTAssertEqual(d!.description, "D3")

        let eFlat = Note(.C).shiftUp(.m3)
        XCTAssertEqual(eFlat!.description, "E♭3")

        let db = Note(.C).shiftDown(.M7)
        XCTAssertEqual(db!.description, "D♭2")

        let ebbb = Note(.F, accidental: .doubleFlat).shiftDown(.M2)
        XCTAssertNil(ebbb)

        let c = Note(.D).shiftDown(.M2)
        XCTAssertEqual(c!.description, "C3")

        let cs = Note(.D).shiftDown(.m2)
        XCTAssertEqual(cs!.description, "C♯3")

        let eb = Note(.B).shiftUp(.d4)
        XCTAssertEqual(eb!.description, "E♭4")

        let fs = Note(.C).shiftUp(.A4)
        XCTAssertEqual(fs!.description, "F♯3")

        let asharp = Note(.C).shiftUp(.A6)
        XCTAssertEqual(asharp!.description, "A♯3")

        let c6 = Note(.G).shiftUp(.P11)
        XCTAssertEqual(c6!.description, "C5")

        let g = Note(.C, octave: 6).shiftDown(.P11)
        XCTAssertEqual(g!.description, "G4")
    }

    func testNoteShiftBSharp() {
        let c1Case1 = Note(.C, accidental: .natural, octave: 1).shiftUp(.P1)
        XCTAssertEqual(c1Case1!.description, "C1")

        let c1Case2 = Note(.A, accidental: .flat, octave: 0).shiftUp(.M3)
        XCTAssertEqual(c1Case2!.description, "C1")

        let bsharp0 = Note(.G, accidental: .sharp, octave: 0).shiftUp(.M3)
        XCTAssertEqual(bsharp0!.description, "B♯1")

        var notesAugmentedTriadShiftUpIntoE: [Note] = []
        for interval in ChordType.aug.intervals {
            if let shifted = Note(.E, accidental: .natural, octave: 0).shiftUp(interval) {
                notesAugmentedTriadShiftUpIntoE.append(shifted)
            }
        }
        XCTAssertEqual(notesAugmentedTriadShiftUpIntoE[0].description, "G♯0")
        XCTAssertEqual(notesAugmentedTriadShiftUpIntoE[1].description, "B♯1")

        var notesMinorTriadShiftUpIntoA: [Note] = []
        for interval in ChordType.minor.intervals {
            if let shifted = Note(.A, accidental: .natural, octave: 0).shiftUp(interval) {
                notesMinorTriadShiftUpIntoA.append(shifted)
            }
        }
        XCTAssertEqual(notesMinorTriadShiftUpIntoA[0].description, "C1")
        XCTAssertEqual(notesMinorTriadShiftUpIntoA[1].description, "E1")
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
        XCTAssertEqual(Note.C.semitones(to: Note(.G, octave: 2)), 5)
    }

    func testNoteIntValue() {
        let lowest = Note(pitch: Pitch(0), key: .C).intValue
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
