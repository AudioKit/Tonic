import XCTest
@testable import Tonic

class KeyTests: XCTestCase {

    func testKeyNotes() {
        let cMajor = Key.C
        XCTAssertEqual(cMajor.noteSet.array.map { $0.noteClass.description },
                       ["C", "D", "E", "F", "G", "A", "B"])

        let cMinor = Key.c
        XCTAssertEqual(cMinor.noteSet.array.map { $0.noteClass.description },
                       ["C", "D", "E♭", "F", "G", "A♭", "B♭"])
    }

    func testKeyPrimaryTriads() {
        XCTAssertEqual(Key.C.primaryTriads.map { $0.description },
                       ["C", "Dm", "Em", "F", "G", "Am", "B°"])
        XCTAssertEqual(Key.Am.primaryTriads.map { $0.description },
                       ["Am", "B°", "C", "Dm", "Em", "F", "G"])
        XCTAssertEqual(Key.G.primaryTriads.map { $0.description },
                       ["G", "Am", "Bm", "C", "D", "Em", "F♯°"])
        XCTAssertEqual(Key.Cs.primaryTriads.map { $0.description },
                       ["C♯", "D♯m", "E♯m", "F♯", "G♯", "A♯m", "B♯°"])
        XCTAssertEqual(Key.Cb.primaryTriads.map { $0.description },
                       ["C♭", "D♭m", "E♭m", "F♭", "G♭", "A♭m", "B♭°"])
    }

    func testKeyChords() {
        XCTAssertEqual(Key.G.chords.count, 19)
        for triad in Key.G.primaryTriads {
            XCTAssert(Key.G.chords.contains(triad))
        }
    }

    func testKeyNoteSets() {
        XCTAssertEqual(Key.C.noteSet.intersection(Key.Cm.noteSet).array.map { $0.noteClass.description }, ["C", "D", "F", "G"])

        XCTAssertEqual(Key.C.noteSet.symmetricDifference(Key.Cm.noteSet).array.map { $0.noteClass.description }, ["E♭", "E", "A♭", "A", "B♭", "B"])
    }

}
