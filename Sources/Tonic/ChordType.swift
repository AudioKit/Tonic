import Foundation

public enum ChordType: Int, CaseIterable {
    case majorTriad
    case minorTriad
    case diminishedTriad
    case augmentedTriad
    case suspendedTriad
    case majorSixth
    case dominantSeventh

    var intervals: [Interval] {
        switch self {
        case .majorTriad: return [.M3, .P5]
        case .minorTriad: return [.m3, .P5]
        case .diminishedTriad: return [.m3, .d5]
        case .augmentedTriad: return [.M3, .A5]
        case .suspendedTriad: return [.P4, .P5]
        case .majorSixth: return [.M3, .P5, .M6]
        case .dominantSeventh: return  [.M3, .P5, .m7]
        }
    }
}
