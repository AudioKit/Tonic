
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

        print("chords in C major:")
        for chord in Key.C.chords {
            print(chord.name)
        }

        print("chords in A minor:")
        for chord in Key.Am.chords {
            print(chord.name)
        }

        print("chords in G major:")
        for chord in Key.G.chords {
            print(chord.name)
        }
    }
}
