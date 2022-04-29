
import Foundation

// See https://en.wikipedia.org/wiki/Hamming_weight
func popcount64b(_ xx: UInt64) -> Int
{
    var x = xx
    var count = 0;
    while x != 0 {
        x &= x - 1
        count += 1
    }
    return count
}

struct Chord {

    // Since we don't have a UInt128
    var highNotes: UInt64
    var lowNotes: UInt64

    var isTriad: Bool {
        popcount64b(lowNotes) + popcount64b(highNotes) == 3
    }
}
