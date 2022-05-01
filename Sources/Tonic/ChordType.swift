import Foundation

/// A set of intervals from the root (tonic).
public struct ChordType: OptionSet {
    public let rawValue: Int

    var intervals: [Interval] {

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

    init(intervals: [Interval]) {
        var r = 0
        for interval in intervals {
            r |= (1 << interval.rawValue)
        }
        self.rawValue = r
    }

    public static let majorTriad = ChordType(intervals: [.M3, .P5])
    public static let minorTriad = ChordType(intervals: [.m3, .P5])
    public static let diminishedTriad = ChordType(intervals: [.m3, .d5])
    public static let augmentedTriad = ChordType(intervals: [.M3, .A5])

    public static let majorSixth = ChordType(intervals: [.M3, .P5, .M6])
    public static let dominantSeventh = ChordType(intervals: [.M3, .P5, .m7])
}
