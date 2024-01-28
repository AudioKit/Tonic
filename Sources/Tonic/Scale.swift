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

/// Automatic synthesis of Codable would use OptionSets RawRepresentable Conformance to de- and encode objects.
/// Unfortunatly this will lead to the loss of the "description" property. That's why we decided to create explicit codable support.
extension Scale: Codable {
    private enum CodingKeys: String, CodingKey {
        case intervals
        case description
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let intervals = try container.decode([Interval].self, forKey: .intervals)
        let description = try container.decode(String.self, forKey: .description)
        self = .init(intervals: intervals, description: description)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(intervals, forKey: .intervals)
        try container.encode(description, forKey: .description)
    }
}
