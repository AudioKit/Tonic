// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// Chord type as defined by a set of intervals from a root note class
public enum ChordType: String, CaseIterable {

    /// Major Triad: Major Third, Perfect Fifth
    case majorTriad

    /// Minor Triad: Minor Third, Perfect Fifth
    case minorTriad

    /// Diminished Triad: Minor Third, Diminished Fifth
    case diminishedTriad

    /// Major Flat Five Triad: Major Third, Diminished Fifth
    case flatFiveTriad

    /// Augmented Triad: Major Third, Augmented Fifth
    case augmentedTriad

    /// Suspended 2 Triad: Major Second, Perfect Fifth
    case suspendedSecondTriad

    /// Suspended 4 Triad: Perfect Fourth, Perfect Fifth
    case suspendedFourthTriad

    /// Major Sixth: Major Third, Perfect Fifth, Major Sixth
    case sixth

    /// Minor Sixth: Minor Third, Perfect Fifth, Major Sixth
    case minorSixth

    /// Major Sixth Suspended Second: Major Second, Perfect Fifth, Major Sixth
    case sixthSuspendedSecond

    /// Major Sixth Suspended Fourth: Major Fourth, Perfect Fifth, Major Sixth
    case sixthSuspendedFourth

    /// Half Diminished Seventh: Minor Third, Diminished Fifth, Minor Seventh
    case halfDiminishedSeventh

    /// Diminished Seventh: Minor Third, Diminished Fifth, Minor Seventh
    case diminishedSeventh

    /// Dominant Seventh: Major Third, Perfect Fifth, Minor Seventh
    case dominantSeventh

    /// Dominant Seventh Suspendend Second: Major Second, Perfect Fifth, Minor Seventh
    case dominantSeventhSuspendedSecond

    /// Dominant Seventh Suspendend Fourth: Perfect Fourth, Perfect Fifth, Minor Seventh
    case dominantSeventhSuspendedFourth

    /// Major Seventh: Major Third, Perfect Fifth, Major Seventh
    case majorSeventh

    /// Minor Seventh: Minor Third, Perfect Fifth, Minor Seventh
    case minorSeventh

    /// Minor Major Seventh: Minor Third, Perfect Fifth, Major Seventh
    case minorMajorSeventh

    /// Half Diminished Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth
    case halfDiminishedNinth

    /// Dominant Ninth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth
    case dominantNinth

    /// Dominant Ninth Suspended Fourth: Perfect Fourth, Perfect Fifth, Major Ninth (Major Second)
    case dominantNinthSuspendedFourth

    /// Flat Ninth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth
    case flatNinth

    /// Sharp Ninth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth
    case sharpNinth

    /// Major Ninth: Major Third, Perfect Fifth, Major Seventh, Major Ninth
    case majorNinth
    
    /// Minor Major Ninth: Minor Third, Perfect Fifth, Major Seventh, Major Ninth
    case minorMajorNinth

    /// Minor Ninth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth
    case minorNinth

    /// Minor Flat Ninth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth
    case minorFlatNinth

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

    /// Half Diminished Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh
    case halfDiminishedEleventh

    /// Minor Seventh Flat Five: Major Third, Diminished Fifth, Major Seventh
    case majorSeventhFlatFive

    /// Major Seventh Sharp Five: Major Third, Augmented Fifth, Major Seventh
    case majorSeventhSharpFive
    
    /// Minor Ninth Flat Five: Major Third, Diminished Fifth, Major Seventh, Major Nine
    case majorNinthFlatFive

    /// Major Ninth Sharp Five: Major Third, Augmented Fifth, Major Seventh, Major Nine
    case majorNinthSharpFive
    
    /// Dominant Ninth Flat Five: Major Third, Diminished Fifth, Minor Seventh, Major Nine
    case dominantNinthFlatFive

    /// Dominant Ninth Sharp Five: Major Third, Augmented Fifth, Minor Seventh, Major Nine
    case dominantNinthSharpFive

    /// Major Ninth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh
    case majorNinthSharpEleventh

    /// Dominant Flat Five: Major Third, Diminished Fifth, Minor Seventh
    case dominantFlatFive

    /// Dominant Sharp Five: Major Third, Augmented Fifth, Minor Seventh
    case dominantSharpFive

    /// Dominant Flat Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh
    case dominantFlatNinthSharpEleventh

    /// Dominant Sharp Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh
    case dominantSharpNinthSharpEleventh

    /// Minor Seventh Flat Ninth Add Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh
    case minorSeventhFlatNinthAddEleventh

    /// Major Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Perfect Thirteenth
    case majorThirteenth

    /// Minor Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Perfect Thirteenth
    case minorThirteenth

    /// Minor Seventh Flat Ninth Add Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Diminished Thirteenth
    case minorFlatThirteenthFlatNinth

    /// Major Ninth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh, Perfect Thirteenth
    case majorThirteenthSharpEleventh

    /// Dominant Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Perfect Thirteenth
    case dominantThirteenth

    /// Minor Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Diminished Thirteenth
    case minorEleventhFlatThirteenth

    /// Half Diminished Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Diminished Thirteenth
    case halfDiminishedFlatThirteenth



    public var intervals: [Interval] {
        switch self {
            case .majorTriad:                       return [.M3, .P5]
            case .minorTriad:                       return [.m3, .P5]
            case .diminishedTriad:                  return [.m3, .d5]
            case .flatFiveTriad:                    return [.M3, .d5]
            case .augmentedTriad:                   return [.M3, .A5]
            case .suspendedSecondTriad:             return [.M2, .P5]
            case .suspendedFourthTriad:             return [.P4, .P5]
            case .sixth:                            return [.M3, .P5, .M6]
            case .minorSixth:                       return [.m3, .P5, .M6]
            case .sixthSuspendedSecond:             return [.M2, .P5, .M6]
            case .sixthSuspendedFourth:             return [.P4, .P5, .M6]
            case .halfDiminishedSeventh:            return [.m3, .d5, .m7]
            case .diminishedSeventh:                return [.m3, .d5, .d7]
            case .dominantSeventh:                  return [.M3, .P5, .m7]
            case .dominantSeventhSuspendedSecond:   return [.M2, .P5, .m7]
            case .dominantSeventhSuspendedFourth:   return [.P4, .P5, .m7]
            case .majorSeventh:                     return [.M3, .P5, .M7]
            case .minorSeventh:                     return [.m3, .P5, .m7]
            case .minorMajorSeventh:                return [.m3, .P5, .M7]
            case .halfDiminishedNinth:              return [.m3, .d5, .m7, .m9]
            case .dominantNinth:                    return [.M3, .P5, .m7, .M9]
            case .dominantNinthSuspendedFourth:     return [.P4, .P5, .M9]
            case .flatNinth:                        return [.M3, .P5, .m7, .m9]
            case .sharpNinth:                       return [.M3, .P5, .m7, .A9]
            case .majorNinth:                       return [.M3, .P5, .M7, .M9]
            case .minorMajorNinth:                  return [.m3, .P5, .M7, .M9]
            case .minorFlatNinth:                   return [.m3, .P5, .m7, .m9]
            case .minorNinth:                       return [.m3, .P5, .m7, .M9]
            case .majorAddNine:                     return [.M3, .P5, .M9]
            case .minorAddNine:                     return [.m3, .P5, .M9]
            case .sixOverNine:                      return [.M3, .P5, .M6, .M9]
            case .majorEleventh:                    return [.M3, .P5, .M7, .M9, .P11]
            case .dominantEleventh:                 return [.M3, .P5, .m7, .M9, .P11]
            case .minorEleventh:                    return [.m3, .P5, .m7, .M9, .P11]
            case .halfDiminishedEleventh:           return [.m3, .d5, .m7, .m9, .P11]
            case .majorSeventhFlatFive:             return [.M3, .d5, .M7]
            case .majorSeventhSharpFive:            return [.M3, .A5, .M7]
            case .majorNinthSharpEleventh:          return [.M3, .P5, .M7, .M9, .A11]
            case .dominantFlatNinthSharpEleventh:   return [.M3, .P5, .m7, .m9, .A11]
            case .dominantFlatFive:                 return [.M3, .d5, .m7]
            case .dominantSharpFive:                return [.M3, .A5, .m7]
            case .dominantSharpNinthSharpEleventh:  return [.M3, .P5, .m7, .A9, .A11]
            case .minorSeventhFlatNinthAddEleventh: return [.m3, .P5, .m7, .m9, .P11]
            case .majorThirteenth:                  return [.M3, .P5, .M7, .M9, .P11, .M13]
            case .minorThirteenth:                  return [.m3, .P5, .m7, .M9, .P11, .M13]
            case .minorFlatThirteenthFlatNinth:     return [.m3, .P5, .m7, .m9, .P11, .m13]
            case .majorThirteenthSharpEleventh:     return [.M3, .P5, .M7, .M9, .A11, .M13]
            case .dominantThirteenth:               return [.M3, .P5, .m7, .M9, .P11, .M13]
            case .minorEleventhFlatThirteenth:      return [.m3, .P5, .m7, .M9, .P11, .m13]
            case .halfDiminishedFlatThirteenth:     return [.m3, .d5, .m7, .m9, .P11, .m13]
            case .majorNinthFlatFive:               return [.M3, .d5, .M7, .M9]
            case .majorNinthSharpFive:              return [.M3, .A5, .M7, .M9]
            case .dominantNinthFlatFive:            return [.M3, .d5, .m7, .M9]
            case .dominantNinthSharpFive:           return [.M3, .A5, .m7, .M9]
                
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
            case .flatFiveTriad:                    return "♭5"
            case .augmentedTriad:                   return "⁺"
            case .suspendedSecondTriad:             return "sus2"
            case .suspendedFourthTriad:             return "sus4"
            case .sixth:                            return "6"
            case .minorSixth:                       return "m6"
            case .sixthSuspendedSecond:             return "6sus2"
            case .sixthSuspendedFourth:             return "6sus4"
            case .halfDiminishedSeventh:            return "ø7"
            case .diminishedSeventh:                return "°7"
            case .dominantSeventh:                  return "7"
            case .dominantSeventhSuspendedSecond:   return "7sus2"
            case .dominantSeventhSuspendedFourth:   return "7sus4"
            case .majorSeventh:                     return "maj7"
            case .minorSeventh:                     return "m7"
            case .minorMajorSeventh:                return "mMaj7"
            case .halfDiminishedNinth:              return "ø9"
            case .dominantNinth:                    return "9"
            case .dominantNinthSuspendedFourth:     return "9sus4"
            case .flatNinth:                        return "7♭9"
            case .sharpNinth:                       return "7♯9"
            case .majorNinth:                       return "maj9"
            case .minorFlatNinth:                   return "m7♭9"
            case .minorNinth:                       return "m9"
            case .minorMajorNinth:                  return "mMaj9"
            case .majorAddNine:                     return "add9"
            case .minorAddNine:                     return "mAdd9"
            case .sixOverNine:                      return "6/9"
            case .majorEleventh:                    return "maj11"
            case .dominantEleventh:                 return "11"
            case .minorEleventh:                    return "m11"
            case .halfDiminishedEleventh:           return "ø11"
            case .majorSeventhFlatFive:             return "maj7♭5"
            case .majorSeventhSharpFive:            return "maj7♯5"
            case .majorNinthSharpEleventh:          return "maj9♯11"
            case .dominantFlatFive:                 return "7♭5"
            case .dominantSharpFive:                return "7♯5"
            case .dominantFlatNinthSharpEleventh:   return "7♭9♯11"
            case .dominantSharpNinthSharpEleventh:  return "7♯9♯11"
            case .minorSeventhFlatNinthAddEleventh: return "m7♭9(add11)"
            case .majorThirteenth:                  return "maj13"
            case .minorThirteenth:                  return "m13"
            case .minorFlatThirteenthFlatNinth:     return "m♭13♭9"
            case .majorThirteenthSharpEleventh:     return "maj13♯11"
            case .dominantThirteenth:               return "13"
            case .minorEleventhFlatThirteenth:      return "m11♭13"
            case .halfDiminishedFlatThirteenth:     return "ø♭13"
            case .majorNinthFlatFive:               return "maj9♭5"
            case .majorNinthSharpFive:              return "maj9♯5"
            case .dominantNinthFlatFive:            return "9♭5"
            case .dominantNinthSharpFive:           return "9♯5"
        }
    }

    /// Adornment to the Root NoteClass (letter+accidental) that defines the chord type
    /// using specialized Chord Symbol Fonts Norfolk or Pori from
    /// NotationExpress: https://www.notationcentral.com/product/norfolk-fonts-for-sibelius/
    public var chordFontDescription: String {
        switch self {
            case .majorTriad:                       return ""
            case .minorTriad:                       return "m"
            case .diminishedTriad:                  return "º"
            case .flatFiveTriad:                    return "b5"
            case .augmentedTriad:                   return "&"
            case .suspendedSecondTriad:             return "“2"
            case .suspendedFourthTriad:             return "“4"
            case .sixth:                            return "6"
            case .minorSixth:                       return "m6"
            case .sixthSuspendedSecond:             return "6sus2"
            case .sixthSuspendedFourth:             return "6sus4"
            case .halfDiminishedSeventh:            return "Ø7"
            case .diminishedSeventh:                return "º7"
            case .dominantSeventh:                  return "7"
            case .dominantSeventhSuspendedSecond:   return "7sus2"
            case .dominantSeventhSuspendedFourth:   return "7sus4"
            case .majorSeventh:                     return "^7"
            case .minorSeventh:                     return "m7"
            case .minorMajorSeventh:                return "m^7"
            case .halfDiminishedNinth:              return "Ø9"
            case .dominantNinth:                    return "9"
            case .dominantNinthSuspendedFourth:     return "9sus4"
            case .flatNinth:                        return "7b9"
            case .sharpNinth:                       return "7#9"
            case .majorNinth:                       return "^9"
            case .minorMajorNinth:                  return "m^9"
            case .minorFlatNinth:                   return "m7b9"
            case .minorNinth:                       return "m9"
            case .majorAddNine:                     return "@9"
            case .minorAddNine:                     return "m@9"
            case .sixOverNine:                      return "%"
            case .majorEleventh:                    return "^11"
            case .dominantEleventh:                 return "11"
            case .minorEleventh:                    return "m11"
            case .halfDiminishedEleventh:           return "Ø11"
            case .majorSeventhFlatFive:             return "^7b5"
            case .majorSeventhSharpFive:            return "^7#5"
            case .majorNinthSharpEleventh:          return "^9#11"
            case .dominantFlatFive:                 return "7b5"
            case .dominantSharpFive:                return "7#5"
            case .dominantFlatNinthSharpEleventh:   return "7âÅ"
            case .dominantSharpNinthSharpEleventh:  return "7åÅ"
            case .minorSeventhFlatNinthAddEleventh: return "m7b9(@11)"
            case .majorThirteenth:                  return "^13"
            case .minorThirteenth:                  return "m13"
            case .minorFlatThirteenthFlatNinth:     return "máÆ"
            case .majorThirteenthSharpEleventh:     return "^13#11"
            case .dominantThirteenth:               return "13"
            case .minorEleventhFlatThirteenth:      return "m11b13"
            case .halfDiminishedFlatThirteenth:     return "Øb13"
            case .majorNinthFlatFive:               return "^9b5"
            case .majorNinthSharpFive:              return "^9#5"
            case .dominantNinthFlatFive:            return "9b5"
            case .dominantNinthSharpFive:           return "9#5"
        }
    }
}
