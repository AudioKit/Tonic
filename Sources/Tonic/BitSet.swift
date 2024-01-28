// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// Interface to bit sets used to represent sets of pitches and sets of notes.
public protocol BitSet: Hashable, Codable {
    init()
    func isSet(bit: Int) -> Bool
    mutating func add(bit: Int)
    mutating func rm(bit: Int)
    func forEach(_ f: (Int) -> Void)
    var first: Int? { get }
    var count: Int { get }
    var totalBits: Int { get }
    func isSubset(of other: Self) -> Bool
    func union(_ other: __owned Self) -> Self
    func intersection(_ other: Self) -> Self
    func symmetricDifference(_ other: __owned Self) -> Self
    func subtracting(_ other: Self) -> Self
}

/// Bit set from a single UInt64.
public struct BitSet64: BitSet, OptionSet {
    public var rawValue: UInt64 = 0

    public init() {}

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    @inlinable
    @inline(__always)
    public func isSet(bit: Int) -> Bool {
        return (rawValue & (1 << bit)) != 0
    }

    @inlinable
    @inline(__always)
    public mutating func add(bit: Int) {
        rawValue |= 1 << bit
    }

    @inlinable
    @inline(__always)
    public mutating func rm(bit: Int) {
        rawValue &= ~(1 << bit)
    }

    @inlinable
    @inline(__always)
    public func forEach(_ f: (Int) -> Void) {
        if rawValue != 0 {
            for bit in 0 ..< 64 {
                if isSet(bit: bit) {
                    f(bit)
                }
            }
        }
    }

    @inlinable
    @inline(__always)
    public var first: Int? {
        rawValue != 0 ? rawValue.trailingZeroBitCount : nil
    }

    @inlinable
    @inline(__always)
    public var count: Int {
        rawValue.nonzeroBitCount
    }

    @inlinable
    @inline(__always)
    public var totalBits: Int {
        64
    }

    public func isSubset(of other: Self) -> Bool {
        return (rawValue & other.rawValue) == rawValue
    }
}

/// Bit set made by combining bit sets.
///
/// By building up bit sets using generics, we avoid extra
/// allocation that would occur if we used arrays.
public struct BitSet2x<B: BitSet>: BitSet {
    public var high = B()
    public var low = B()

    public init() {}

    @inlinable
    @inline(__always)
    public init(low: B, high: B) {
        self.low = low
        self.high = high
    }

    @inlinable
    @inline(__always)
    public func isSet(bit: Int) -> Bool {
        if bit < low.totalBits {
            return low.isSet(bit: bit)
        }
        return high.isSet(bit: bit - low.totalBits)
    }

    @inlinable
    @inline(__always)
    public mutating func add(bit: Int) {
        if bit < low.totalBits {
            low.add(bit: bit)
        } else {
            high.add(bit: bit - low.totalBits)
        }
    }

    @inlinable
    @inline(__always)
    public mutating func rm(bit: Int) {
        if bit < low.totalBits {
            low.rm(bit: bit)
        } else {
            high.rm(bit: bit - low.totalBits)
        }
    }

    @inlinable
    @inline(__always)
    public func forEach(_ f: (Int) -> Void) {
        low.forEach(f)
        high.forEach { f($0 + low.totalBits) }
    }

    @inlinable
    @inline(__always)
    public var first: Int? {
        if let lowfirst = low.first {
            return lowfirst
        }
        if let highfirst = high.first {
            return highfirst + low.totalBits
        }
        return nil
    }

    @inlinable
    @inline(__always)
    public var count: Int {
        low.count + high.count
    }

    @inlinable
    @inline(__always)
    public var totalBits: Int {
        2 * low.totalBits
    }

    @inlinable
    @inline(__always)
    public func contains(_ member: Int) -> Bool {
        isSet(bit: member)
    }

    public func isSubset(of other: Self) -> Bool {
        return low.isSubset(of: other.low) ? high.isSubset(of: other.high) : false
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

    public func subtracting(_ other: BitSet2x<B>) -> BitSet2x<B> {
        Self(low: low.subtracting(other.low), high: high.subtracting(other.high))
    }
}

public typealias BitSet128 = BitSet2x<BitSet64>
public typealias BitSet256 = BitSet2x<BitSet128>
public typealias BitSet512 = BitSet2x<BitSet256>

public protocol IntRepresentable {
    init(intValue: Int)
    var intValue: Int { get }
}

public struct BitSetAdapter<T: IntRepresentable, B: BitSet>: Hashable, Codable {
    public var bits: B

    public init() {
        bits = B()
    }

    init(bits: B) {
        self.bits = bits
    }

    @inlinable
    @inline(__always)
    public func contains(_ member: T) -> Bool {
        bits.isSet(bit: member.intValue)
    }

    @inlinable
    @inline(__always)
    public mutating func add(_ member: T) {
        bits.add(bit: member.intValue)
    }

    @inlinable
    @inline(__always)
    public mutating func remove(_ member: T) {
        bits.rm(bit: member.intValue)
    }

    @inlinable
    @inline(__always)
    public func forEach(_ f: (T) -> Void) {
        bits.forEach { f(T(intValue: $0)) }
    }

    @inlinable
    @inline(__always)
    public var first: T? {
        if let bit = bits.first {
            return T(intValue: bit)
        }
        return nil
    }

    @inlinable
    @inline(__always)
    public var count: Int {
        bits.count
    }

    public var array: [T] {
        var r: [T] = []
        forEach { r.append($0) }
        return r
    }

    public func isSubset(of other: Self) -> Bool {
        return bits.isSubset(of: other.bits)
    }

    public func union(_ other: __owned BitSetAdapter<T, B>) -> BitSetAdapter<T, B> {
        Self(bits: bits.union(other.bits))
    }

    public func intersection(_ other: BitSetAdapter<T, B>) -> BitSetAdapter<T, B> {
        Self(bits: bits.intersection(other.bits))
    }

    public func symmetricDifference(_ other: __owned BitSetAdapter<T, B>) -> BitSetAdapter<T, B> {
        Self(bits: bits.symmetricDifference(other.bits))
    }

    public func subtracting(_ other: BitSetAdapter<T, B>) -> BitSetAdapter<T, B> {
        Self(bits: bits.subtracting(other.bits))
    }
}
