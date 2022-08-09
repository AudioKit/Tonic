
import Tonic
import XCTest

class BitSetTests: XCTestCase {
    func testBitSet() {
        for i in 0 ..< 512 {
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

    func testBitSet_SetAlgebra() {
        var set0 = BitSet512()
        set0.add(bit: 0)

        var set1 = BitSet512()
        set1.add(bit: 1)

        XCTAssertTrue(set0.contains(0))
        XCTAssertTrue(set1.contains(1))

        let union = set0.union(set1)
        XCTAssertEqual(union.count, 2)

        let isect = set0.intersection(set1)
        XCTAssertEqual(isect.count, 0)

        let diff = set0.symmetricDifference(set1)
        XCTAssertEqual(diff.count, 2)

        XCTAssertFalse(set0.isSubset(of: set1))

        set0.add(bit: 511)
        XCTAssertTrue(set0.contains(511))

        let empty = BitSet512()
        XCTAssertNil(empty.first)

        let set2 = union.subtracting(set0)
        XCTAssertEqual(set1, set2)
    }
}
