import Tonic
import XCTest

final class TonicTests: XCTestCase {

    func testNoteSet() {
        var set = NoteSet()
        for i in 0 ..< 128 {
            set.add(Note(pitch: Pitch(Int8(i))))
        }
        XCTAssertEqual(set.count, 128)
    }

    func testNoteIndex() {
        let c3 = Note.C
        let index = c3.intValue
        XCTAssertEqual(c3, Note(index: index))
    }

    func testPitch() {
        XCTAssertEqual(Pitch(64).semitones(to: Pitch(62)), 2)

        XCTAssertEqual(Pitch(60).note(in: Key.C), Note(.C))
    }

    func testPitchSet() {
        var set = PitchSet()
        set.add(Pitch(64))
        XCTAssertEqual(set.first, Pitch(64))

        let set2 = PitchSet(pitches: [Pitch(64)])

        XCTAssert(set.subtracting(set2).count == 0)
    }

    func testPitchRange() {
        let range = (Pitch(60) ... Pitch(64))
        XCTAssertEqual(range.lowerBound, Pitch(60))
    }
}
