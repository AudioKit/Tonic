import Tonic
import XCTest

final class PerformanceTests: XCTestCase {
    func testCreateNotesPerf() {
        measure {
            for _ in 0 ..< 1000 {
                // Sum the indices so the compiler can't optimize
                // away note creation.
                var index_sum = 0
                for i in 0 ..< 128 {
                    index_sum += Note(pitch: Pitch(Int8(i))).intValue
                }
                if index_sum != 23779 {
                    //print("index_sum: \(index_sum)")
                    abort()
                }
            }
        }
    }

    func testPitchSetPerf() {
        measure {
            for _ in 0 ..< 10000 {
                var set = PitchSet()
                for i in 0 ..< 128 {
                    set.add(Pitch(Int8(i)))
                }
                assert(set.count == 128)
            }
        }
    }

    func testSetOfPitchesPerf() {
        measure {
            for _ in 0 ..< 10000 {
                var set = Set<Pitch>()
                for i in 0 ..< 128 {
                    set.insert(Pitch(Int8(i)))
                }
                assert(set.count == 128)
            }
        }
    }

    func testNoteSetPerf() {
        measure {
            for _ in 0 ..< 1000 {
                var set = NoteSet()
                for i in 0 ..< 128 {
                    set.add(Note(pitch: Pitch(Int8(i))))
                }
                assert(set.count == 128)
            }
        }
    }

    func testSetOfNotesPerf() {
        measure {
            for _ in 0 ..< 1000 {
                var set = Set<Note>()
                for i in 0 ..< 128 {
                    set.insert(Note(pitch: Pitch(Int8(i))))
                }
                assert(set.count == 128)
            }
        }
    }
}
