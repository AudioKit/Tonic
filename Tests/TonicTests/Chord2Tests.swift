import XCTest
@testable import Tonic

class Chord2Tests: XCTestCase {

    func testChords() {
        XCTAssertTrue(Chord2.C.isTriad)
        XCTAssertEqual(Chord2.Cs.description, "C♯")
        XCTAssertEqual(Chord2.Db.description, "D♭")
        XCTAssertEqual(Chord2.Asm.description, "A♯m")
        XCTAssertEqual(Chord2.Bbm.description, "B♭m")
    }

    func testDiminishedChords() {
        XCTAssertEqual(Chord2.Adim.description, "A°")
        XCTAssertEqual(Chord2.Bdim.description, "B°")
    }

    func testAugmentedChords() {
        XCTAssertEqual(Chord2.Caug.description, "C⁺")
        XCTAssertEqual(Chord2.Aaug.description, "A⁺")
        XCTAssertEqual(Chord2(.Db, type: .augmentedTriad).description, "D♭⁺")
    }

    func testRomanNumerals() {
        XCTAssertEqual(Key.C.chords2.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["I", "ii", "iii", "IV", "V", "vi", "vii°"])
        XCTAssertEqual(Key.C.chords2.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["III", "iv", "v", "VI", "VII", "i", "ii°"])
        XCTAssertEqual(Key.C.chords2.map { $0.romanNumeralNotation(in: Key.G) ?? "" },
                       ["IV", "", "vi", "", "I", "ii", ""])
        XCTAssertEqual(Key.Am.chords2.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["i", "ii°", "III", "iv", "v", "VI", "VII"])
        XCTAssertEqual(Key.Am.chords2.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["vi", "vii°", "I", "ii", "iii", "IV", "V"])
    }

    func testNaming() {

        let Cs = Chord2(notes: [.Cs, .Es, .Gs])!
        XCTAssertEqual(Cs.description, "C♯")

        let Csm = Chord2(notes: [.Cs, .E, .Gs])!
        XCTAssertEqual(Csm.description, "C♯m")

        let Db = Chord2(notes: [.Db, .F, .Ab])!
        XCTAssertEqual(Db.description, "D♭")

    }

    func testInversions() {
        let chord = Chord2(notes:  [.C, .E, .G])!
        XCTAssertEqual(chord.inversion, 0)
        XCTAssertTrue(chord.isTriad)

        let firstInversion = Chord2(notes: [.C, .E, Note(.A, octave: 6)])!
        XCTAssertEqual(firstInversion.inversion, 1)
        XCTAssertEqual(firstInversion.description, "Am")

        let secondInversion = Chord2(notes: [Note(.E, octave: 1), .A, .C])!
        XCTAssertEqual(secondInversion.inversion, 2)
        XCTAssertEqual(secondInversion.description, "Am")
    }
}

