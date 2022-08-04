import XCTest
import Tonic

class ChordTests: XCTestCase {

    func testChords() {
        XCTAssertTrue(Chord.C.isTriad)
        XCTAssertEqual(Chord.Cs.description, "C♯")
        XCTAssertEqual(Chord.Db.description, "D♭")
        XCTAssertEqual(Chord.Asm.description, "A♯m")
        XCTAssertEqual(Chord.Bbm.description, "B♭m")

        XCTAssertEqual(Chord.Adim.description, "A°")
        XCTAssertEqual(Chord.Bdim.description, "B°")

        XCTAssertEqual(Chord.Caug.description, "C⁺")
        XCTAssertEqual(Chord.Aaug.description, "A⁺")
        XCTAssertEqual(Chord(.Db, type: .augmentedTriad).description, "D♭⁺")

        XCTAssertEqual(Chord.Asus.description, "Asus")
        XCTAssertEqual(Chord.Bsus.description, "Bsus")
    }

    func testRomanNumerals() {
        XCTAssertEqual(Key.C.primaryTriads.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["I", "ii", "iii", "IV", "V", "vi", "vii°"])
        XCTAssertEqual(Key.C.primaryTriads.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["III", "iv", "v", "VI", "VII", "i", "ii°"])
        XCTAssertEqual(Key.C.primaryTriads.map { $0.romanNumeralNotation(in: Key.G) ?? "" },
                       ["IV", "", "vi", "", "I", "ii", ""])
        XCTAssertEqual(Key.Am.primaryTriads.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["i", "ii°", "III", "iv", "v", "VI", "VII"])
        XCTAssertEqual(Key.Am.primaryTriads.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["vi", "vii°", "I", "ii", "iii", "IV", "V"])
    }

    func testTriadNaming() {
        let Cs = Chord(notes: [.Cs, .Es, .Gs])
        XCTAssertEqual(Cs?.description, "C♯")

        let Csm = Chord(notes: [.Cs, .E, .Gs])
        XCTAssertEqual(Csm?.description, "C♯m")

        let Db = Chord(notes: [.Db, .F, .Ab])
        XCTAssertEqual(Db?.description, "D♭")
    }

    func testSeventhNaming() {
        let Am7 = Chord(notes: [.C, .E, .G, .A])
        XCTAssertEqual(Am7?.description, "Am7")

        let C7 = Chord(notes: [.C, .E, .G, .Bb])
        XCTAssertEqual(C7?.description, "C7")

        let Cmaj7 = Chord(notes: [.C, .E, .G, .B])
        XCTAssertEqual(Cmaj7?.description, "Cmaj7")
    }

    func testNinthNaming() {
        let Cadd9 = Chord(notes: [.C, .E, .G, .D])
        XCTAssertEqual(Cadd9?.description, "Cadd9")

        let C69 = Chord(notes: [.C, .E, .G, .A, .D])
        XCTAssertEqual(C69?.description, "C6/9")
    }

    func testEleventhNaming() {
        let Cmaj11 = Chord(notes: [.C, .E, .G, .B, .D, .F])
        XCTAssertEqual(Cmaj11?.description, "Cmaj11")

        let G11 = Chord(notes: [.G, .B, .D, .F, .A, .C])
        XCTAssertEqual(G11?.description, "G11")

    }

    func testInversions() {
        let chord = Chord(notes:  [.C, .E, .G])!
        XCTAssertEqual(chord.inversion, 0)
        XCTAssertTrue(chord.isTriad)

        let firstInversion = Chord(notes: [.C, .E, Note(.A, octave: 6)])!
        XCTAssertEqual(firstInversion.inversion, 1)
        XCTAssertEqual(firstInversion.description, "Am")

        let secondInversion = Chord(notes: [Note(.E, octave: 1), .A, .C])!
        XCTAssertEqual(secondInversion.inversion, 2)
        XCTAssertEqual(secondInversion.description, "Am")
    }

    func testTriadsWithRedundantNotes() {
        let chord = Chord(notes:  [.C, .E, .G, Note(.C, octave: 5)])!
        XCTAssertEqual(chord.description, "C")
    }
}

