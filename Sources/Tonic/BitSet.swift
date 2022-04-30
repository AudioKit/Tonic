
import Foundation

protocol BitSet: Hashable {
    init()
    func isSet(bit: Int) -> Bool
    mutating func add(bit: Int)
    func forEach(_ f: (Int) -> ())
    var count: Int { get }
    var totalBits: Int { get }
}

struct BitSet64: BitSet {
    private var bits: UInt64 = 0
    
    func isSet(bit: Int) -> Bool {
        return (bits & (1 << bit)) != 0
    }
    
    mutating func add(bit: Int) {
        bits |= 1 << bit
    }

    func forEach(_ f: (Int) -> ()) {
        if bits != 0 {
            for bit in 0..<64 {
                if isSet(bit: bit) {
                    f(bit)
                }
            }
        }
    }

    var count: Int {
        bits.nonzeroBitCount
    }
    
    var totalBits: Int {
        64
    }
}

struct BitSet2x<B: BitSet>: BitSet {
    private var high = B()
    private var low = B()
    
    func isSet(bit: Int) -> Bool {
        if bit < low.totalBits {
            return low.isSet(bit: bit)
        } else {
            return high.isSet(bit: bit - low.totalBits)
        }
    }

    mutating func add(bit: Int) {
        if bit < low.totalBits {
            low.add(bit: bit)
        } else {
            high.add(bit: bit - low.totalBits)
        }
    }

    func forEach(_ f: (Int) -> ()) {
        low.forEach(f)
        high.forEach({ f($0+low.totalBits) })
    }

    var count: Int {
        low.count + high.count
    }
    
    var totalBits: Int {
        2 * low.totalBits
    }

}

typealias BitSet128 = BitSet2x<BitSet64>
typealias BitSet256 = BitSet2x<BitSet128>
typealias BitSet512 = BitSet2x<BitSet256>
