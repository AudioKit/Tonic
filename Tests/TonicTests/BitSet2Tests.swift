
import XCTest
import Tonic

class BitSet2Tests: XCTestCase {

    func testBitSet() {

        var set = BitSet64_2<Pitch>()

        let p42 = Pitch(intValue: 42)
        set.add(p42)
        XCTAssertTrue(set.contains(p42))
        XCTAssertEqual(set.first, p42)

    }

    func testNoteSet() {
        var set = NoteSet2()
        set.add(Note(.C))

        XCTAssertEqual(Note(.C).intValue, 177)
        XCTAssertEqual(Note(intValue: 49).intValue, 49)

        XCTAssertTrue(set.contains(Note(.C)))
    }

}
