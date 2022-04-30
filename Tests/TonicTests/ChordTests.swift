import XCTest
@testable import Tonic

final class ChordTests: XCTestCase {

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
}
