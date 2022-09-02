// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// A set of intervals from the root (tonic).
public struct Scale: OptionSet, Hashable {
    public let rawValue: Int

    public let description: String

    public var intervals: [Interval] {
        var result: [Interval] = []
        for i in 0 ..< Interval.allCases.count {
            if (rawValue >> i) & 1 != 0 {
                result.append(Interval(rawValue: i)!)
            }
        }
        return result
    }

    public init(rawValue: Int) {
        self.rawValue = rawValue
        description = ""
    }

    public init(intervals: [Interval], description: String) {
        self.description = description
        var r = 0
        for interval in intervals {
            r |= (1 << interval.rawValue)
        }
        rawValue = r
    }
}
