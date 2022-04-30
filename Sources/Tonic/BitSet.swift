
import Foundation

public protocol BitSet: Hashable {
    init()
    func isSet(bit: Int) -> Bool
    mutating func add(bit: Int)
    func forEach(_ f: (Int) -> ())
    var count: Int { get }
    var totalBits: Int { get }
}

public struct BitSet64: BitSet {
    private var bits: UInt64 = 0

    public init() {}
    
    public func isSet(bit: Int) -> Bool {
        return (bits & (1 << bit)) != 0
    }
    
    public mutating func add(bit: Int) {
        bits |= 1 << bit
    }

    public func forEach(_ f: (Int) -> ()) {
        if bits != 0 {
            for bit in 0..<64 {
                if isSet(bit: bit) {
                    f(bit)
                }
            }
        }
    }

    public var count: Int {
        bits.nonzeroBitCount
    }
    
    public var totalBits: Int {
        64
    }
}

public struct BitSet2x<B: BitSet>: BitSet {
    private var high = B()
    private var low = B()

    public init() {}
    
    public func isSet(bit: Int) -> Bool {
        if bit < low.totalBits {
            return low.isSet(bit: bit)
        } else {
            return high.isSet(bit: bit - low.totalBits)
        }
    }

    public mutating func add(bit: Int) {
        if bit < low.totalBits {
            low.add(bit: bit)
        } else {
            high.add(bit: bit - low.totalBits)
        }
    }

    public func forEach(_ f: (Int) -> ()) {
        low.forEach(f)
        high.forEach({ f($0+low.totalBits) })
    }

    public var count: Int {
        low.count + high.count
    }
    
    public var totalBits: Int {
        2 * low.totalBits
    }

}

public typealias BitSet128 = BitSet2x<BitSet64>
public typealias BitSet256 = BitSet2x<BitSet128>
public typealias BitSet512 = BitSet2x<BitSet256>
