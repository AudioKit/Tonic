import Tonic
import XCTest

final class ScaleTests: XCTestCase {

    func testIntervals() {
        XCTAssertEqual(Scale.blues.intervals, [.P1, .m3, .P4, .d5, .P5, .m7])
        XCTAssertEqual(Scale.pentatonicMinor.intervals, [.P1, .m3, .P4, .P5, .m7])
        XCTAssertEqual(Scale.major.intervals, [.P1, .M2, .M3, .P4, .P5, .M6, .M7])
        XCTAssertEqual(Scale.minor.intervals, [.P1, .M2, .m3, .P4, .P5, .m6, .m7])
        XCTAssertEqual(Scale.lydian.intervals, [.P1, .M2, .M3, .A4, .P5, .M6, .M7])
        XCTAssertEqual(Scale.enigmatic.intervals, [.P1, .m2, .M3, .A4, .A5, .A6, .M7])
        XCTAssertEqual(Scale.locrian.intervals, [.P1, .m2, .m3, .P4, .d5, .m6, .m7])
        XCTAssertEqual(Scale.chromatic.intervals, [.P1, .m2, .M2, .m3, .M3, .P4, .d5, .P5, .m6, .M6, .m7, .M7])

        XCTAssertEqual(Scale.harmonicMinor.intervals, [.P1, .M2, .m3, .P4, .P5, .m6, .M7])
        XCTAssertEqual(Scale.phrygianDominant.intervals, [.P1, .m2, .M3, .P4, .P5, .m6, .m7])

        XCTAssertTrue(Scale.pentatonicMinor.isSubset(of: Scale.blues))
        XCTAssertTrue(Scale.pentatonicMinor.isSubset(of: Scale.minor))
        XCTAssertFalse(Scale.blues.isSubset(of: Scale.minor))
        XCTAssertTrue(Scale.minor.isSubset(of: Scale.chromatic))
    }

    func testScaleNotes() {
        let key = Key(root: .C, scale: .lydian)
        let notes: [NoteClass] = [.C, .D, .E, .Fs, .G, .A, .B]
        XCTAssertEqual(key.noteSet.noteClassSet.array, notes)

        let dKey = Key(root: .D, scale: .lydian)
        let dNotes: [NoteClass] = [.Cs, .D, .E, .Fs, .Gs, .A, .B]
        XCTAssertEqual(dKey.noteSet.noteClassSet.array, dNotes)

    }
}
