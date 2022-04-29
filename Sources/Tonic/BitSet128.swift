
import Foundation

struct BitSet128 {
    private var high: UInt64 = 0
    private var low: UInt64 = 0

    func isSet(bit: Int) -> Bool {
        if bit < 64 {
            return (low & (1 << bit)) != 0
        } else {
            return (high & (1 << (bit - 64))) != 0
        }
    }

    mutating func add(bit: Int) {
        if bit < 64 {
            low |= 1 << bit
        } else {
            high |= 1 << (bit - 64)
        }
    }

    func forEach(_ f: (Int) -> ()) {
        for bit in 0..<128 {
            if isSet(bit: bit) {
                f(bit)
            }
        }
    }

    var count: Int {
        low.nonzeroBitCount + high.nonzeroBitCount
    }
}
