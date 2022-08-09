import Foundation

/// Chord type as defined by a set of intervals from a root note class
public enum ChordType: Int, CaseIterable {
    /// Major Triad: Major Third, Perfect Fifth
    case majorTriad

    /// Minor Triad: Minor Third, Perfect Fifth
    case minorTriad

    /// Diminished Triad: Minor Third, Diminished Fifth
    case diminishedTriad

    /// Augmented Triad: Major Third, Augmented Fifth
    case augmentedTriad

    /// Suspended Triad: Perfect Fourth, Perfect Fifth
    case suspendedTriad

    /// Minor Sixth: Minor Third, Perfect Fifth, Major Sixth
    case minorSixth

    /// Dominant Seventh: Major Third, Perfect Fifth, Minor Seventh
    case dominantSeventh

    /// Major Seventh: Major Third, Perfect Fifth, Major Seventh
    case majorSeventh

    /// Minor Seventh: Minor Third, Perfect Fifth, Minor Seventh
    case minorSeventh

    /// Minor Major Seventh: Minor Third, Perfect Fifth, Major Seventh
    case minorMajorSeventh

    /// Dominant Ninth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth
    case dominantNinth

    /// Flat Ninth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth
    case flatNinth

    /// Sharp Ninth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth
    case sharpNinth

    /// Major Ninth: Major Third, Perfect Fifth, Major Seventh, Major Ninth
    case majorNinth

    /// Minor Ninth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth
    case minorNinth

    /// Major Add Nine: Major Third, Perfect Fifth, Major Ninth
    case majorAddNine

    /// Minor Add Nine: Minor Third, Perfect Fifth, Major Ninth
    case minorAddNine

    /// Six Over Nine: Major Third, Perfect Fifth, Major Sixth, Major Ninth
    case sixOverNine

    /// Major Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh
    case majorEleventh

    /// Dominant Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh
    case dominantEleventh

    /// Minor Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh
    case minorEleventh

    /// Minor Seventh Flat Fifth: Major Third, Diminished Fifth, Major Seventh
    case majorSeventhFlatFifth

    /// Minor Seventh Sharp Fifth: Major Third, Augmented Fifth, Major Seventh
    case minorSeventhSharpFifth

    /// Major Ninth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh
    case majorNinthSharpEleventh

    /// Dominant Flat Fifth: Major Third, Diminished Fifth, Minor Seventh
    case dominantFlatFifth

    /// Dominant Sharp Fifth: Major Third, Augmented Fifth, Minor Seventh
    case dominantSharpFifth

    /// Dominant Flat Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh
    case dominantFlatNinthSharpEleventh

    /// Dominant Sharp Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh
    case dominantSharpNinthSharpEleventh

    /// Minor Seventh Flat Ninth Add Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh
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
        case .majorSeventhFlatFifth:            return [.M3, .d5, .M7]
        case .minorSeventhSharpFifth:           return [.M3, .A5, .M7]
        case .majorNinthSharpEleventh:          return [.M3, .P5, .M7, .M9, .A11]
        case .dominantFlatNinthSharpEleventh:   return [.M3, .P5, .m7, .m9, .A11]
        case .dominantFlatFifth:                return [.M3, .d5, .m7]
        case .dominantSharpFifth:               return [.M3, .A5, .m7]
        case .dominantSharpNinthSharpEleventh:  return [.M3, .P5, .m7, .A9, .A11]
        case .minorSeventhFlatNinthAddEleventh: return [.m3, .P5, .m7, .m9, .P11]
        }
    }
}

extension ChordType: CustomStringConvertible {
    /// Adornment to the Root NoteClass (letter+accidental) that defines the chord type
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
        case .majorSeventhFlatFifth:            return "Maj7♭5"
        case .minorSeventhSharpFifth:           return "Maj7♯5"
        case .majorNinthSharpEleventh:          return "maj9♯11"
        case .dominantFlatFifth:                return "7♭5"
        case .dominantSharpFifth:               return "7♯5"
        case .dominantFlatNinthSharpEleventh:   return "7♭9♯11"
        case .dominantSharpNinthSharpEleventh:  return "7♯9♯11"
        case .minorSeventhFlatNinthAddEleventh: return "m7♭9(add11)"
        }
    }
}
