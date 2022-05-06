import XCTest
@testable import Tonic

class KeyTests: XCTestCase {

    func testKeyNotes() {
        let cMajor = Key.C
        XCTAssertEqual(cMajor.notes.notes.map({$0.spelling.description}), ["C", "D", "E", "F", "G", "A", "B"])

        let cMinor = Key.c
        XCTAssertEqual(cMinor.notes.notes.map({$0.spelling.description}), ["C", "D", "E♭", "F", "G", "A♭", "B♭"])
    }

    func testKeyChords() {

        XCTAssertEqual(Key.C.chords.map { $0.name }, ["C", "Dm", "Em", "F", "G", "Am", "B°"])
        XCTAssertEqual(Key.Am.chords.map { $0.name }, ["Am", "B°", "C", "Dm", "Em", "F", "G"])
        XCTAssertEqual(Key.G.chords.map { $0.name }, ["G", "Am", "Bm", "C", "D", "Em", "F♯°"])
    }
}
