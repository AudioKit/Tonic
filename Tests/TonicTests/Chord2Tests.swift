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

}
