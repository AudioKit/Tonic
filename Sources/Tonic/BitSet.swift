import Foundation

/// Interface to bit sets used to represent sets of pitches and sets of notes.
public protocol BitSet: Hashable, SetAlgebra {
    init()
    func isSet(bit: Int) -> Bool
    mutating func add(bit: Int)
    mutating func rm(bit: Int)
    func forEach(_ f: (Int) -> ())
    var first: Int? { get }
    var count: Int { get }
    var totalBits: Int { get }
}

/// Bit set from a single UInt64.
public struct BitSet64: BitSet, OptionSet {

    public var rawValue: UInt64 = 0

    public init() {}

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }
    
    public func isSet(bit: Int) -> Bool {
        return (rawValue & (1 << bit)) != 0
    }
    
    public mutating func add(bit: Int) {
        rawValue |= 1 << bit
    }

    public mutating func rm(bit: Int) {
        rawValue &= ~(1 << bit)
    }

    public func forEach(_ f: (Int) -> ()) {
        if rawValue != 0 {
            for bit in 0..<64 {
                if isSet(bit: bit) {
                    f(bit)
                }
            }
        }
    }

    public var first: Int? {
        if rawValue != 0 {
            for bit in 0..<64 {
                if isSet(bit: bit) {
                    return bit
                }
            }
        }
        return nil
    }

    public var count: Int {
        rawValue.nonzeroBitCount
    }
    
    public var totalBits: Int {
        64
    }
}

/// Bit set made by combining bit sets. By building up bit sets using generics, we avoid extra
/// allocation that would occur if we used arrays.
public struct BitSet2x<B: BitSet>: BitSet {
    private var high = B()
    private var low = B()

    public init() {}

    public init(low: B, high: B) {
        self.low = low
        self.high = high
    }
    
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

    public mutating func rm(bit: Int) {
        if bit < low.totalBits {
            low.rm(bit: bit)
        } else {
            high.rm(bit: bit - low.totalBits)
        }
    }

    public func forEach(_ f: (Int) -> ()) {
        low.forEach(f)
        high.forEach({ f($0+low.totalBits) })
    }

    public var first: Int? {
        if let lowfirst = low.first {
            return lowfirst
        }
        return high.first
    }

    public var count: Int {
        low.count + high.count
    }
    
    public var totalBits: Int {
        2 * low.totalBits
    }

    public func contains(_ member: Int) -> Bool {
        isSet(bit: member)
    }

    public func union(_ other: __owned BitSet2x<B>) -> BitSet2x<B> {
        Self(low: low.union(other.low), high: high.union(other.high))
    }

    public func intersection(_ other: BitSet2x<B>) -> BitSet2x<B> {
        Self(low: low.intersection(other.low), high: high.intersection(other.high))
    }

    public func symmetricDifference(_ other: __owned BitSet2x<B>) -> BitSet2x<B> {
        Self(low: low.symmetricDifference(other.low), high: high.symmetricDifference(other.high))
    }

    public mutating func insert(_ newMember: __owned Int) -> (inserted: Bool, memberAfterInsert: Int) {
        if contains(newMember) {
            return (false, newMember)
        }
        add(bit: newMember)
        return (true, newMember)
    }

    public mutating func remove(_ member: Int) -> Int? {
        if contains(member) {
            rm(bit: member)
            return member
        }
        return nil
    }

    public mutating func update(with newMember: __owned Int) -> Int? {
        if contains(newMember) {
            return newMember
        }
        add(bit: newMember)
        return nil
    }

    public mutating func formUnion(_ other: __owned BitSet2x<B>) {
        low.formUnion(other.low)
        high.formUnion(other.high)
    }

    public mutating func formIntersection(_ other: BitSet2x<B>) {
        low.formIntersection(other.low)
        high.formIntersection(other.high)
    }

    public mutating func formSymmetricDifference(_ other: __owned BitSet2x<B>) {
        low.formSymmetricDifference(other.low)
        high.formSymmetricDifference(other.high)
    }

}

public typealias BitSet128 = BitSet2x<BitSet64>
public typealias BitSet256 = BitSet2x<BitSet128>
public typealias BitSet512 = BitSet2x<BitSet256>
