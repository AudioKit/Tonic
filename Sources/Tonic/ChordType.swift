import Foundation

public enum ChordType: Int, CaseIterable {
    case majorTriad
    case minorTriad
    case diminishedTriad
    case augmentedTriad
    case suspendedTriad
    case minorSixth
    case dominantSeventh
    case majorSeventh
    case minorSeventh
    case minorMajorSeventh

    var intervals: [Interval] {
        switch self {
        case .majorTriad: return [.M3, .P5]
        case .minorTriad: return [.m3, .P5]
        case .diminishedTriad: return [.m3, .d5]
        case .augmentedTriad: return [.M3, .A5]
        case .suspendedTriad: return [.P4, .P5]
        case .minorSixth: return [.m3, .P5, .M6]
        case .dominantSeventh: return  [.M3, .P5, .m7]
        case .majorSeventh: return  [.M3, .P5, .M7]
        case .minorSeventh: return  [.m3, .P5, .m7]
        case .minorMajorSeventh: return  [.m3, .P5, .M7]
        }
    }

}

extension ChordType: CustomStringConvertible{

    public var description: String {
        switch self {
        case .majorTriad: return ""
        case .minorTriad: return "m"
        case .diminishedTriad: return "°"
        case .augmentedTriad: return "⁺"
        case .suspendedTriad: return "sus"
        case .minorSixth: return "m6"
        case .dominantSeventh: return "7"
        case .majorSeventh: return "maj7"
        case .minorSeventh: return "m7"
        case .minorMajorSeventh: return "mMaj7"
        }
    }

}
