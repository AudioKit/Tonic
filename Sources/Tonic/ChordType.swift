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
    case dominantNinth
    case flatNinth
    case sharpNinth
    case majorNinth
    case minorNinth
    case majorAddNine
    case minorAddNine
    case sixOverNine
    case majorEleventh
    case dominantEleventh
    case minorEleventh
    case majorNinthSharpEleventh
    case dominantFlatNinthSharpEleventh
    case dominantSharpNinthSharpEleventh
    case minorSeventhFlatNinthAddEleventh


    var intervals: [Interval] {
        switch self {
        case .majorTriad:                       return [.M3, .P5]
        case .minorTriad:                       return [.m3, .P5]
        case .diminishedTriad:                  return [.m3, .d5]
        case .augmentedTriad:                   return [.M3, .A5]
        case .suspendedTriad:                   return [.P4, .P5]
        case .minorSixth:                       return [.m3, .P5, .M6]
        case .dominantSeventh:                  return [.M3, .P5, .m7]
        case .majorSeventh:                     return [.M3, .P5, .M7]
        case .minorSeventh:                     return [.m3, .P5, .m7]
        case .minorMajorSeventh:                return [.m3, .P5, .M7]
        case .dominantNinth:                    return [.M3, .P5, .m7, .M9]
        case .flatNinth:                        return [.M3, .P5, .m7, .m9]
        case .sharpNinth:                       return [.M3, .P5, .m7, .A9]
        case .majorNinth:                       return [.M3, .P5, .M7, .M9]
        case .minorNinth:                       return [.m3, .P5, .m7, .M9]
        case .majorAddNine:                     return [.M3, .P5, .M9]
        case .minorAddNine:                     return [.m3, .P5, .M9]
        case .sixOverNine:                      return [.M3, .P5, .M6, .M9]
        case .majorEleventh:                    return [.M3, .P5, .M7, .M9, .P11]
        case .dominantEleventh:                 return [.M3, .P5, .m7, .M9, .P11]
        case .minorEleventh:                    return [.m3, .P5, .m7, .M9, .P11]
        case .majorNinthSharpEleventh:          return [.M3, .P5, .M7, .M9, .A11]
        case .dominantFlatNinthSharpEleventh:   return [.M3, .P5, .m7, .m9, .A11]
        case .dominantSharpNinthSharpEleventh:  return [.M3, .P5, .m7, .A9, .A11]
        case .minorSeventhFlatNinthAddEleventh: return [.m3, .P5, .m7, .m9, .P11]
        }
    }

}

extension ChordType: CustomStringConvertible{

    public var description: String {
        switch self {
        case .majorTriad:                       return ""
        case .minorTriad:                       return "m"
        case .diminishedTriad:                  return "°"
        case .augmentedTriad:                   return "⁺"
        case .suspendedTriad:                   return "sus"
        case .minorSixth:                       return "m6"
        case .dominantSeventh:                  return "7"
        case .majorSeventh:                     return "maj7"
        case .minorSeventh:                     return "m7"
        case .minorMajorSeventh:                return "mMaj7"
        case .dominantNinth:                    return "9"
        case .flatNinth:                        return "7♭9"
        case .sharpNinth:                       return "7♯9"
        case .majorNinth:                       return "maj9"
        case .minorNinth:                       return "m9"
        case .majorAddNine:                     return "add9"
        case .minorAddNine:                     return "madd9"
        case .sixOverNine:                      return "6/9"
        case .majorEleventh:                    return "maj11"
        case .dominantEleventh:                 return "11"
        case .minorEleventh:                    return "m11"
        case .majorNinthSharpEleventh:          return "maj9♯11"
        case .dominantFlatNinthSharpEleventh:   return "7b9#11"
        case .dominantSharpNinthSharpEleventh:  return "7#9#11"
        case .minorSeventhFlatNinthAddEleventh: return "m7b9(add11)"
        }
    }

}
