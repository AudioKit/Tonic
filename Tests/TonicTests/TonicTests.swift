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
    }

    func testKey() {
        let cMajor = Key(root: Note(.C))
        print(cMajor.notes.map({$0.spelling}))

        let cMinor = Key(root: Note(.C), scale: .minor)
        print(cMinor.notes.map({$0.spelling}))
    }

    func testChords() {
        let chord = Chord(notes: [Note(), Note(.E), Note(.G)])
        XCTAssertTrue(chord.isTriad)

        let majorChord = Chord(noteNumbers: [61, 65, 68])
        let cSharpMajor = Key(root: Note(.C, accidental: .sharp), scale: .major)
        let dFlatMajor = Key(root: Note(.D, accidental: .flat), scale: .major)

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

        let aSharpMinor = Key(root: Note(.A, accidental: .sharp), scale: .minor)
        let bFlatMinor = Key(root: Note(.B, accidental: .flat), scale: .minor)
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
        let chord = Chord(notes: [Note(), Note(.E), Note(.G)])
        XCTAssertTrue(chord.isTriad)

        let majorChord = Chord(noteNumbers: [68, 73, 77])
        let cSharpMajor = Key(root: Note(.C, accidental: .sharp), scale: .major)
        let dFlatMajor = Key(root: Note(.D, accidental: .flat), scale: .major)

        XCTAssertEqual(majorChord.name(in: cSharpMajor), "C♯")
        XCTAssertEqual(majorChord.name(in: dFlatMajor), "D♭")

        let minorChord = Chord(noteNumbers: [61, 65, 70])
        let aSharpMinor = Key(root: Note(.A, accidental: .sharp), scale: .minor)
        let bFlatMinor = Key(root: Note(.B, accidental: .flat), scale: .minor)

        XCTAssertEqual(minorChord.name(in: aSharpMinor), "A♯m")
        XCTAssertEqual(minorChord.name(in: bFlatMinor), "B♭m")
    }

    func testChordHausdorff() {
        let C = Chord(notes: [Note(), Note(.E), Note(.G)])

        XCTAssertEqual(C.hausdorff(to: C), 0)

        let Cm = Chord(notes: [Note(), Note(.E, accidental: .flat), Note(.G)])

        XCTAssertEqual(C.hausdorff(to: Cm), 1)
    }
}
