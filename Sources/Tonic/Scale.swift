
import Foundation

/// A set of intervals from the root (tonic).
public struct Scale: OptionSet {
    public let rawValue: Int

    public var intervals: [Interval] {

        var result: [Interval] = []
        for i in 0..<11 {
            if (rawValue >> i) & 1 != 0 {
                result.append(Interval(rawValue: i)!)
            }
        }
        return result
    }

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public init(intervals: [Interval]) {
        var r = 0
        for interval in intervals {
            r |= (1 << interval.rawValue)
        }
        self.rawValue = r
    }

    public static let pentatonicMinor = Scale(intervals: [.m3, .P4, .P5, .m7])
    public static let blues = Scale(intervals: [.m3, .P4, .d5, .P5, .m7])
    public static let minor = Scale(rawValue: 0b1011010110)
    public static let major = Scale(rawValue: 0b10101011010)
    public static let chromatic = Scale(rawValue: 0b11111111111)
}
