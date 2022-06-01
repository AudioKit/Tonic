import XCTest
@testable import Tonic

final class TonicTests: XCTestCase {

    func testScales() {
        XCTAssertEqual(Scale.blues.intervals, [.m3, .P4, .d5, .P5, .m7])
        XCTAssertEqual(Scale.pentatonicMinor.intervals, [.m3, .P4, .P5, .m7])
        XCTAssertEqual(Scale.major.intervals, [.M2, .M3, .P4, .P5, .M6, .M7])
        XCTAssertEqual(Scale.minor.intervals, [.M2, .m3, .P4, .P5, .m6, .m7])
        XCTAssertEqual(Scale.chromatic.intervals, [.m2, .M2, .m3, .M3, .P4, .d5, .P5, .m6, .M6, .m7, .M7])

        XCTAssertTrue(Scale.pentatonicMinor.isSubset(of: Scale.blues))
        XCTAssertTrue(Scale.pentatonicMinor.isSubset(of: Scale.minor))
        XCTAssertFalse(Scale.blues.isSubset(of: Scale.minor))
        XCTAssertTrue(Scale.minor.isSubset(of: Scale.chromatic))
    }

    func testNoteSet() {
        var set = NoteSet()
        for i in 0..<128 {
            set.add(Note(pitch: Pitch(Int8(i))))
        }
        XCTAssertEqual(set.count, 128)
    }

    func testNoteIndex() {
        let c4 = Note.C
        let index = c4.intValue
        XCTAssertEqual(c4, Note(index: index))
    }

    func testPitch() {
        XCTAssertEqual(Pitch(64).semitones(to: Pitch(62)), 2)

        XCTAssertEqual(Pitch(60).note(in: Key.C), Note(.C))
    }

    func testPitchSet() {
        var set = PitchSet()
        set.add(Pitch(64))
        XCTAssertEqual(set.first, Pitch(64))
    }

}
