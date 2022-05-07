
import Foundation

public protocol IntRepresentable {
    init(intValue: Int)
    var intValue: Int { get }
}

public protocol BitSet2 {
    associatedtype Element: IntRepresentable

    init()
    func contains(_: Element) -> Bool
    mutating func add(_: Element)
    mutating func rm(_: Element)
    var totalBits: Int { get }
}

/// Bit set from a single UInt64.
public struct BitSet64_2<T: IntRepresentable>: BitSet2 {

    public typealias Element = T

    public var rawValue: UInt64 = 0

    public init() {}

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    public func contains(_ member: T) -> Bool {
        return (rawValue & (1 << member.intValue)) != 0
    }

    public mutating func add(_ bit: T) {
        rawValue |= 1 << bit.intValue
    }

    public mutating func rm(_ bit: T) {
        rawValue &= ~(1 << bit.intValue)
    }

    public func forEach(_ f: (Element) -> ()) {
        if rawValue != 0 {
            for bit in 0..<64 {
                let e = Element(intValue: bit)
                if contains(e) {
                    f(e)
                }
            }
        }
    }

    public var first: Element? {
        if rawValue != 0 {
            for bit in 0..<64 {
                let e = Element(intValue: bit)
                if contains(e) {
                    return e
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

extension BitSet64_2: OptionSet {

    public mutating func insert(_ newMember: __owned T) -> (inserted: Bool, memberAfterInsert: T) {
        if contains(newMember) {
            return (false, newMember)
        }
        add(newMember)
        return (true, newMember)
    }

    public mutating func remove(_ member: T) -> T? {
        if contains(member) {
            rm(member)
            return member
        }
        return nil
    }

    public mutating func update(with newMember: __owned T) -> T? {
        if contains(newMember) {
            return newMember
        }
        add(newMember)
        return nil
    }

}

/// Bit set made by combining bit sets. By building up bit sets using generics, we avoid extra
/// allocation that would occur if we used arrays.
public struct BitSet2x_2<B: BitSet2>: BitSet2 {

    private var high = B()
    private var low = B()

    public typealias Element = B.Element

    public init() {}

    public init(low: B, high: B) {
        self.low = low
        self.high = high
    }

    public func contains(_ bit: Element) -> Bool {
        if bit.intValue < low.totalBits {
            return low.contains(bit)
        } else {
            return high.contains(Element(intValue: bit.intValue - low.totalBits))
        }
    }

    public mutating func add(_ bit: Element) {
        if bit.intValue < low.totalBits {
            low.add(bit)
        } else {
            high.add(Element(intValue: bit.intValue - low.totalBits))
        }
    }

    public mutating func rm(_ bit: Element) {
        if bit.intValue < low.totalBits {
            low.rm(bit)
        } else {
            high.rm(Element(intValue: bit.intValue - low.totalBits))
        }
    }

    public var totalBits: Int {
        2 * low.totalBits
    }

}

