import XCTest
import Tonic

final class TonicTests: XCTestCase {
    func testNoteSpelling() {
        let c4 = Note(.C)
        XCTAssertEqual(c4.noteNumber, 60)
        XCTAssertEqual(c4.spelling, "C")

        let c5 = Note(octave: 5)
        XCTAssertEqual(c5.noteNumber, 72)
        XCTAssertEqual(c5.spelling, "C")

        let dFlat = Note(.D, accidental: .flat)
        XCTAssertEqual(dFlat.noteNumber, 61)
        XCTAssertEqual(dFlat.spelling, "D♭")

        let cSharp = Note(accidental: .sharp)
        XCTAssertEqual(cSharp.noteNumber, 61)
        XCTAssertEqual(cSharp.spelling, "C♯")

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

    func testScales() {
        print("blues intervals \(Scale.blues.intervals)")
        print("pentatonic intervals \(Scale.pentatonicMinor.intervals)")
        print("major scale intervales \(Scale.major.intervals)")
        print("minor scale intervals \(Scale.minor.intervals)")
        print("chromatic scale intervals \(Scale.chromatic.intervals)")

        XCTAssertTrue(Scale.pentatonicMinor.isSubset(of: Scale.blues))
        XCTAssertTrue(Scale.pentatonicMinor.isSubset(of: Scale.minor))
        XCTAssertFalse(Scale.blues.isSubset(of: Scale.minor))
        XCTAssertTrue(Scale.minor.isSubset(of: Scale.chromatic))
    }

    func testKey() {
        let cMajor = Key.C
        print(cMajor.notes.map({$0.spelling}))

        let cMinor = Key.c
        print(cMinor.notes.map({$0.spelling}))
    }

    func testChords() {
        let chord = Chord(notes: [Note(.C), Note(.E), Note(.G)])
        XCTAssertTrue(chord.isTriad)

        let majorChord = Chord(noteNumbers: [61, 65, 68])
        let cSharpMajor = Key.Cs
        let dFlatMajor = Key.Db

        XCTAssertEqual(majorChord.notes(in: cSharpMajor),
                       [Note(.C, accidental: .sharp),
                        Note(.E, accidental: .sharp),
                        Note(.G, accidental: .sharp)])
        XCTAssertEqual(majorChord.notes(in: dFlatMajor),
                       [Note(.D, accidental: .flat),
                        Note(.F),
                        Note(.A, accidental: .flat)])
        XCTAssertEqual(majorChord.name(in: cSharpMajor), "C♯")
        XCTAssertEqual(majorChord.name(in: dFlatMajor), "D♭")

        let aSharpMinor = Key.as
        let bFlatMinor = Key.bb
        let minorChord = Chord(noteNumbers: [58, 61, 65])
        
        XCTAssertEqual(minorChord.notes(in: aSharpMinor),
                       [Note(.A, accidental: .sharp, octave: 3),
                        Note(.C, accidental: .sharp),
                        Note(.E, accidental: .sharp)])
        XCTAssertEqual(minorChord.notes(in: bFlatMinor),
                       [Note(.B, accidental: .flat, octave: 3),
                        Note(.D, accidental: .flat),
                        Note(.F)])
        XCTAssertEqual(minorChord.name(in: aSharpMinor), "A♯m")
        XCTAssertEqual(minorChord.name(in: bFlatMinor), "B♭m")
    }

    func testInversions() {
        let chord = Chord(notes: [Note(.C), Note(.E), Note(.G)])
        XCTAssertTrue(chord.isTriad)

        let majorChord = Chord(noteNumbers: [68, 73, 77])
        let cSharpMajor = Key.Cs
        let dFlatMajor = Key.Db

        XCTAssertEqual(majorChord.name(in: cSharpMajor), "C♯")
        XCTAssertEqual(majorChord.name(in: dFlatMajor), "D♭")

        let minorChord = Chord(noteNumbers: [61, 65, 70])
        let aSharpMinor = Key.as
        let bFlatMinor = Key.bb

        XCTAssertEqual(minorChord.name(in: aSharpMinor), "A♯m")
        XCTAssertEqual(minorChord.name(in: bFlatMinor), "B♭m")
    }

    func testDiminishedChords() {

        let dimChord = Chord(noteNumbers: [59, 62, 65])
        let cMajor = Key.C

        XCTAssertEqual(dimChord.notes(in: cMajor), [Note(.B, octave: 3), Note(.D), Note(.F)])
        XCTAssertEqual(dimChord.name(in: cMajor), "B°")
    }

    func testAugmentedChords() {

        let augChord = Chord(noteNumbers: [60, 64, 68])
        let cMajor = Key.C

        XCTAssertEqual(augChord.notes(in: cMajor), [Note(.C), Note(.E), Note(.G, accidental: .sharp)])
        XCTAssertEqual(augChord.name(in: cMajor), "C⁺")

        let augChord2 = Chord(noteNumbers: [61, 65, 69])
        let cSharpMajor = Key.Cs
        XCTAssertEqual(augChord2.notes(in: cSharpMajor), [Note(.C, accidental: .sharp), Note(.E, accidental: .sharp), Note(.A)])
        XCTAssertEqual(augChord2.name(in: cSharpMajor), "A⁺")

        let dFlatMajor = Key.Db
        XCTAssertEqual(augChord2.notes(in: dFlatMajor), [Note(.D, accidental: .flat), Note(.F), Note(.A)])
        XCTAssertEqual(augChord2.name(in: dFlatMajor), "D♭⁺")
    }

    func testChordHausdorff() {
        let C = Chord(notes: [Note(.C), Note(.E), Note(.G)])

        XCTAssertEqual(C.hausdorff(to: C), 0)

        let Cm = Chord(notes: [Note(.C), Note(.E, accidental: .flat), Note(.G)])

        XCTAssertEqual(C.hausdorff(to: Cm), 1)
    }
    
    func testNoteIndex() {
        let c4 = Note(.C)
        let index = c4.index
        print("index: \(index)")
        XCTAssertEqual(c4, Note(index: index))
    }
    
    func testBitSet() {
        for i in 0..<512 {
            var set = BitSet512()
            set.add(bit: i)
            XCTAssertTrue(set.isSet(bit: i))
        }
    }

    func testNoteSet() {
        var set = NoteSet()
        for i in 0..<128 {
            set.add(note: Note(noteNumber: Int8(i)))
        }
        XCTAssertEqual(set.count, 128)
    }

    func testCreateNotesPerf() {
        measure {
            for _ in 0..<1000 {
                // Sum the indices so the compiler can't optimize
                // away note creation.
                var index_sum = 0
                for i in 0..<128 {
                    index_sum += Note(noteNumber: Int8(i)).index
                }
                if index_sum != 23779 {
                    print("index_sum: \(index_sum)")
                    abort()
                }
            }
        }
    }

    func testNoteSetPerf() {
        measure {
            for _ in 0..<1000 {
                var set = NoteSet()
                for i in 0..<128 {
                    set.add(note: Note(noteNumber: Int8(i)))
                }
                assert(set.count == 128)
            }
        }
    }

    func testSetOfNotesPerf() {
        measure {
            for _ in 0..<1000 {
                var set = Set<Note>()
                for i in 0..<128 {
                    set.insert(Note(noteNumber: Int8(i)))
                }
                assert(set.count == 128)
            }
        }
    }
}
