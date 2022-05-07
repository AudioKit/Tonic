import XCTest
@testable import Tonic

class KeyTests: XCTestCase {

    func testKeyNotes() {
        let cMajor = Key.C
        XCTAssertEqual(cMajor.noteSet.notes.map { $0.noteClass.description },
                       ["C", "D", "E", "F", "G", "A", "B"])

        let cMinor = Key.c
        XCTAssertEqual(cMinor.noteSet.notes.map { $0.noteClass.description },
                       ["C", "D", "E♭", "F", "G", "A♭", "B♭"])
    }

    func testKeyChords2() {
        XCTAssertEqual(Key.C.chords2.map { $0.description },
                       ["C", "Dm", "Em", "F", "G", "Am", "B°"])
        XCTAssertEqual(Key.Am.chords2.map { $0.description },
                       ["Am", "B°", "C", "Dm", "Em", "F", "G"])
        XCTAssertEqual(Key.G.chords2.map { $0.description },
                       ["G", "Am", "Bm", "C", "D", "Em", "F♯°"])
        XCTAssertEqual(Key.Cs.chords2.map { $0.description },
                       ["C♯", "D♯m", "E♯m", "F♯", "G♯", "A♯m", "B♯°"])
        XCTAssertEqual(Key.Cb.chords2.map { $0.description },
                       ["C♭", "D♭m", "E♭m", "F♭", "G♭", "A♭m", "B♭°"])
    }

    func testKeyNoteSets() {
        XCTAssertEqual(Key.C.noteSet.intersection(Key.Cm.noteSet).notes.map { $0.noteClass.description }, ["C", "D", "F", "G"])

        XCTAssertEqual(Key.C.noteSet.symmetricDifference(Key.Cm.noteSet).notes.map { $0.noteClass.description }, ["E♭", "E", "A♭", "A", "B♭", "B"])
    }

}
