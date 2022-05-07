import XCTest
@testable import Tonic

final class ChordTests: XCTestCase {

    func testChords() {
        let chord = Chord(notes: [Note(.C), Note(.E), Note(.G)])
        XCTAssertTrue(chord.isTriad)

        let Cs = Chord(notes: [.Cs, .Es, .Gs])

        XCTAssertEqual(Cs.name, "C♯")

        let Db = Chord(notes: [.Db, .F, .Ab])

        XCTAssertEqual(Db.name, "D♭")

        let Asm = Chord(notes: [.As, .Cs, .Es])

        XCTAssertEqual(Asm.name, "A♯m")

        let Bbm = Chord(notes: [.Bb, .Db, .F])

        XCTAssertEqual(Bbm.name, "B♭m")
    }

    func testNaming() {

        let pitches = PitchSet(numbers: [61, 65, 68])

        let Cs = pitches.chord(in: .Cs)
        let Db = pitches.chord(in: .Db)

        XCTAssertEqual(Cs.notes, [.Cs, .Es, .Gs])
        XCTAssertEqual(Db.notes, [.Db, .F, .Ab])
        XCTAssertEqual(Cs.name, "C♯")
        XCTAssertEqual(Db.name, "D♭")

    }

    func testInversions() {
        let chord = Chord(notes:  [.C, .E, .G])
        XCTAssertEqual(chord.inversion, 0)
        XCTAssertTrue(chord.isTriad)

        let firstInversion = Chord(notes: [.C, .E, Note(.A, octave: 6)])
        XCTAssertEqual(firstInversion.inversion, 1)
        XCTAssertEqual(firstInversion.name, "Am")

        let secondInversion = Chord(notes: [Note(.E, octave: 1), .A, .C])
        XCTAssertEqual(secondInversion.inversion, 2)
        XCTAssertEqual(secondInversion.name, "Am")
    }

    func testDiminishedChords() {

        let aDim = Chord(notes: [.A, .C, .Eb])
        XCTAssertEqual(aDim.name, "A°")

        let bDim = Chord(notes: [.B, .D, .F])
        XCTAssertEqual(bDim.name, "B°")


    }

    func testAugmentedChords() {

        let cAug = Chord(notes: [.C, .E, .Gs])
        XCTAssertEqual(cAug.name, "C⁺")

        let aAug = Chord(notes: [.A, .Cs, .Es])
        XCTAssertEqual(aAug.name, "A⁺")

        let dbAug = Chord(notes: [.Db, .F, .A])
        XCTAssertEqual(dbAug.name, "D♭⁺")
    }

    func testRomanNumerals() {
        XCTAssertEqual(Key.C.chords.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["I", "ii", "iii", "IV", "V", "vi", "vii°"])
        XCTAssertEqual(Key.C.chords.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["III", "iv", "v", "VI", "VII", "i", "ii°"])
        XCTAssertEqual(Key.C.chords.map { $0.romanNumeralNotation(in: Key.G) ?? "" },
                       ["IV", "", "vi", "", "I", "ii", ""])
        XCTAssertEqual(Key.Am.chords.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["i", "ii°", "III", "iv", "v", "VI", "VII"])
        XCTAssertEqual(Key.Am.chords.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["vi", "vii°", "I", "ii", "iii", "IV", "V"])
    }

    func testChordHausdorff() {
        let C = Chord(notes: [.C, .E, .G])

        XCTAssertEqual(C.hausdorff(to: C), 0)

        let Cm = Chord(notes: [.C, .Eb, .G])

        XCTAssertEqual(C.hausdorff(to: Cm), 1)
    }
}
