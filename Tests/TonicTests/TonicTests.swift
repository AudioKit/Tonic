import XCTest
@testable import Tonic

final class TonicTests: XCTestCase {
    func testNoteSpelling() {
        let c4 = Note()
        XCTAssertEqual(c4.noteNumber, 60)
        XCTAssertEqual(c4.spelling, "C")

        let c5 = Note(octave: 5)
        XCTAssertEqual(c5.noteNumber, 72)
        XCTAssertEqual(c5.spelling, "C")

        let dFlat = Note(letter: .D, accidental: .flat)
        XCTAssertEqual(dFlat.noteNumber, 61)
        XCTAssertEqual(dFlat.spelling, "D♭")

        let cSharp = Note(accidental: .sharp)
        XCTAssertEqual(cSharp.noteNumber, 61)
        XCTAssertEqual(cSharp.spelling, "C♯")

        let dDoubleFlat = Note(letter: .D, accidental: .doubleFlat)
        XCTAssertEqual(dDoubleFlat.noteNumber, 60)
        XCTAssertEqual(dDoubleFlat.spelling, "D𝄫")

        let cDoubleSharp = Note(accidental: .doubleSharp)
        XCTAssertEqual(cDoubleSharp.noteNumber, 62)
        XCTAssertEqual(cDoubleSharp.spelling, "C𝄪")
    }

    func testNoteShift() {
        let d = Note().shift(.M2)
        XCTAssertEqual(d.spelling, "D")

        let eFlat = Note().shift(.m3)
         XCTAssertEqual(eFlat.spelling, "E♭")

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
        XCTAssertEqual(Scale.chromatic.intervals, Interval.allCases)
    }

    func testKey() {
        let cMajor = Key(root: Note(letter: .C))
        print(cMajor.notes.map({$0.spelling}))

        let cMinor = Key(root: Note(letter: .C), scale: .minor)
        print(cMinor.notes.map({$0.spelling}))
    }

    func testChords() {
        let chord = Chord(notes: [Note(), Note(letter: .E), Note(letter: .G)])
        XCTAssertTrue(chord.isTriad)

        let majorChord = Chord(notes: [Note(noteNumber: 61), Note(noteNumber: 65), Note(noteNumber: 68)])
        let cSharpMajor = Key(root: Note(letter: .C, accidental: .sharp), scale: .major)
        let dFlatMajor = Key(root: Note(letter: .D, accidental: .flat), scale: .major)

        XCTAssertEqual(majorChord.notes(in: cSharpMajor),
                       [Note(letter: .C, accidental: .sharp),
                        Note(letter: .E, accidental: .sharp),
                        Note(letter: .G, accidental: .sharp)])
        XCTAssertEqual(majorChord.notes(in: dFlatMajor),
                       [Note(letter: .D, accidental: .flat),
                        Note(letter: .F),
                        Note(letter: .A, accidental: .flat)])
        XCTAssertEqual(majorChord.name(in: cSharpMajor), "C♯")
        XCTAssertEqual(majorChord.name(in: dFlatMajor), "D♭")

        let aSharpMinor = Key(root: Note(letter: .A, accidental: .sharp), scale: .minor)
        let bFlatMinor = Key(root: Note(letter: .B, accidental: .flat), scale: .minor)
        let minorChord = Chord(notes: [Note(noteNumber: 58), Note(noteNumber: 61), Note(noteNumber: 65)])
        
        XCTAssertEqual(minorChord.notes(in: aSharpMinor),
                       [Note(letter: .A, accidental: .sharp, octave: 3),
                        Note(letter: .C, accidental: .sharp),
                        Note(letter: .E, accidental: .sharp)])
        XCTAssertEqual(minorChord.notes(in: bFlatMinor),
                       [Note(letter: .B, accidental: .flat, octave: 3),
                        Note(letter: .D, accidental: .flat),
                        Note(letter: .F)])
        XCTAssertEqual(minorChord.name(in: aSharpMinor), "A♯m")
        XCTAssertEqual(minorChord.name(in: bFlatMinor), "B♭m")
    }

    func testInversions() {
        let chord = Chord(notes: [Note(), Note(letter: .E), Note(letter: .G)])
        XCTAssertTrue(chord.isTriad)

        let majorChord = Chord(notes: [Note(noteNumber: 68), Note(noteNumber: 73), Note(noteNumber: 77)])
        let cSharpMajor = Key(root: Note(letter: .C, accidental: .sharp), scale: .major)
        let dFlatMajor = Key(root: Note(letter: .D, accidental: .flat), scale: .major)

        XCTAssertEqual(majorChord.name(in: cSharpMajor), "C♯")
        XCTAssertEqual(majorChord.name(in: dFlatMajor), "D♭")

        let aSharpMinor = Key(root: Note(letter: .A, accidental: .sharp), scale: .minor)
        let bFlatMinor = Key(root: Note(letter: .B, accidental: .flat), scale: .minor)
        let minorChord = Chord(notes: [Note(noteNumber: 61), Note(noteNumber: 65), Note(noteNumber: 70)])
        XCTAssertEqual(minorChord.name(in: aSharpMinor), "A♯m")
        XCTAssertEqual(minorChord.name(in: bFlatMinor), "B♭m")
    }

    func testGenerateTriads() {
        let chords = generateTriads()
        for chord in chords {
            print(chord.notes.map { $0.spelling }.joined(separator: " "))
        }
        XCTAssert(chords.allSatisfy({ $0.isTriad }))
        print(chords.count)
    }

    func testChordHausdorff() {
        let C = Chord(notes: [Note(), Note(letter: .E), Note(letter: .G)])

        XCTAssertEqual(C.hausdorff(to: C), 0)

        let Cm = Chord(notes: [Note(), Note(letter: .E, accidental: .flat), Note(letter: .G)])

        XCTAssertEqual(C.hausdorff(to: Cm), 1)
    }
}
