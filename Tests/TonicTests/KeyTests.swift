import XCTest
@testable import Tonic

class KeyTests: XCTestCase {

    func testKeyNotes() {
        let cMajor = Key.C
        XCTAssertEqual(cMajor.noteSet.notes.map { $0.spelling.description },
                       ["C", "D", "E", "F", "G", "A", "B"])

        let cMinor = Key.c
        XCTAssertEqual(cMinor.noteSet.notes.map { $0.spelling.description },
                       ["C", "D", "E♭", "F", "G", "A♭", "B♭"])
    }

    func testKeyChords() {
        XCTAssertEqual(Key.C.chords.map { $0.name },
                       ["C", "Dm", "Em", "F", "G", "Am", "B°"])
        XCTAssertEqual(Key.Am.chords.map { $0.name },
                       ["Am", "B°", "C", "Dm", "Em", "F", "G"])
        XCTAssertEqual(Key.G.chords.map { $0.name },
                       ["G", "Am", "Bm", "C", "D", "Em", "F♯°"])
        XCTAssertEqual(Key.Cs.chords.map { $0.name },
                       ["C♯", "D♯m", "E♯m", "F♯", "G♯", "A♯m", "B♯°"])
        XCTAssertEqual(Key.Cb.chords.map { $0.name },
                       ["C♭", "D♭m", "E♭m", "F♭", "G♭", "A♭m", "B♭°"])
    }

    func testKeyChordsContain() {
        XCTAssertEqual(Key.C.chords.filter { $0.contains(note: Note(.C)) }.map { $0.name },
                       ["C", "F", "Am"])
    }

    func testKeyNoteSets() {
        XCTAssertEqual(Key.C.noteSet.intersection(Key.Cm.noteSet).notes.map { $0.spelling.description }, ["C", "D", "F", "G"])

        XCTAssertEqual(Key.C.noteSet.symmetricDifference(Key.Cm.noteSet).notes.map { $0.spelling.description }, ["E♭", "E", "A♭", "A", "B♭", "B"])
    }

}
