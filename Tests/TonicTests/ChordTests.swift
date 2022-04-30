import XCTest
@testable import Tonic

final class ChordTests: XCTestCase {

    func testChords() {
        let chord = Chord(notes: [Note(.C), Note(.E), Note(.G)])
        XCTAssertTrue(chord.isTriad)

        let Cs = Chord(notes: [Note(.C, accidental: .sharp),
                               Note(.E, accidental: .sharp),
                               Note(.G, accidental: .sharp)])

        XCTAssertEqual(Cs.name, "C♯")

        let Db = Chord(notes: [Note(.D, accidental: .flat),
                               Note(.F),
                               Note(.A, accidental: .flat)])

        XCTAssertEqual(Db.name, "D♭")

        let Asm = Chord(notes: [Note(.A, accidental: .sharp),
                                Note(.C, accidental: .sharp),
                                Note(.E, accidental: .sharp)])

        XCTAssertEqual(Asm.name, "A♯m")

        let Bbm = Chord(notes: [Note(.B, accidental: .flat),
                                Note(.D, accidental: .flat),
                                Note(.F)])

        XCTAssertEqual(Bbm.name, "B♭m")
    }

    func testInversions() {
        let chord = Chord(notes: [Note(.C), Note(.E), Note(.G)])
        XCTAssertTrue(chord.isTriad)

        let firstInversion = Chord(notes: [Note(.C), Note(.E), Note(.A, octave: 6)])
        XCTAssertEqual(firstInversion.name, "Am")

        let secondInversion = Chord(notes: [Note(.E, octave: 1), Note(.A), Note(.C)])
        XCTAssertEqual(secondInversion.name, "Am")
    }

    func testDiminishedChords() {

        let aDim = Chord(notes: [Note(.A), Note(.C), Note(.E, accidental: .flat)])
        XCTAssertEqual(aDim.name, "A°")

        let bDim = Chord(notes: [Note(.B), Note(.D), Note(.F)])
        XCTAssertEqual(bDim.name, "B°")


    }

    func testAugmentedChords() {

        let cAug = Chord(notes: [Note(.C), Note(.E), Note(.G, accidental: .sharp)])
        XCTAssertEqual(cAug.name, "C⁺")

        let aAug = Chord(notes: [Note(.A), Note(.C, accidental: .sharp), Note(.E, accidental: .sharp)])
        XCTAssertEqual(aAug.name, "A⁺")

        let dbAug = Chord(notes: [Note(.D, accidental: .flat), Note(.F), Note(.A)])
        XCTAssertEqual(dbAug.name, "D♭⁺")
    }

    func testChordHausdorff() {
        let C = Chord(notes: [Note(.C), Note(.E), Note(.G)])

        XCTAssertEqual(C.hausdorff(to: C), 0)

        let Cm = Chord(notes: [Note(.C), Note(.E, accidental: .flat), Note(.G)])

        XCTAssertEqual(C.hausdorff(to: Cm), 1)
    }
}
