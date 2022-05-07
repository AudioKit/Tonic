import XCTest
@testable import Tonic

class Chord2Tests: XCTestCase {

    func testChords() {
        XCTAssertTrue(Chord2.C.isTriad)
        XCTAssertEqual(Chord2.Cs.description, "C♯")
        XCTAssertEqual(Chord2.Db.description, "D♭")
        XCTAssertEqual(Chord2.Asm.description, "A♯m")
        XCTAssertEqual(Chord2.Bbm.description, "B♭m")
    }

    func testDiminishedChords() {
        XCTAssertEqual(Chord2.Adim.description, "A°")
        XCTAssertEqual(Chord2.Bdim.description, "B°")
    }

    func testAugmentedChords() {
        XCTAssertEqual(Chord2.Caug.description, "C⁺")
        XCTAssertEqual(Chord2.Aaug.description, "A⁺")
        XCTAssertEqual(Chord2(.Db, type: .augmentedTriad).description, "D♭⁺")
    }
}
