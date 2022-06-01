
import XCTest
@testable import Tonic

class BitSetTests: XCTestCase {

    func testBitSet() {
        for i in 0..<512 {
            var set = BitSet512()
            set.add(bit: i)
            XCTAssertTrue(set.isSet(bit: i))
        }

        var set = BitSet512()
        XCTAssertEqual(set.first, nil)
        set.add(bit: 42)
        XCTAssertEqual(set.first, 42)
        set.rm(bit: 42)
        XCTAssertEqual(set.first, nil)
    }

}
