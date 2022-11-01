import Tonic
import XCTest

class KeyTests: XCTestCase {
    func testKeyNotes() {
        XCTAssertEqual(Key.C.noteSet.array.map { $0.noteClass.description },
                       ["C", "D", "E", "F", "G", "A", "B"])

        XCTAssertEqual(Key.Cm.noteSet.array.map { $0.noteClass.description },
                       ["C", "D", "E♭", "F", "G", "A♭", "B♭"])

        XCTAssertEqual(Key.Cs.noteSet.array.map { $0.noteClass.description },
                       ["C♯", "D♯", "E♯", "F♯", "G♯", "A♯", "B♯"])

        XCTAssertEqual(Key.Cb.noteSet.array.map { $0.noteClass.description },
                       ["C♭", "D♭", "E♭", "F♭", "G♭", "A♭", "B♭"])
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

    func testScalePrimaryTriads() {
        XCTAssertEqual(Key(root: .C, scale: .harmonicMinor).primaryTriads.map { $0.description },
                       ["Cm", "D°", "E♭⁺", "Fm", "G", "A♭", "B°"])
    }

    func testKeyChords() {
        XCTAssertEqual(Key.G.chords.count, 38)
        for triad in Key.G.primaryTriads {
            XCTAssert(Key.G.chords.contains(triad))
        }
    }

    func testKeyNoteSets() {
        XCTAssertEqual(Key.C.noteSet.intersection(Key.Cm.noteSet).array.map { $0.noteClass.description }, ["C", "D", "F", "G"])

        XCTAssertEqual(Key.C.noteSet.symmetricDifference(Key.Cm.noteSet).array.map { $0.noteClass.description }, ["E♭", "E", "A♭", "A", "B♭", "B"])
    }
}
