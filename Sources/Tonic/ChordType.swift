// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// Chord type as defined by a set of intervals from a root note class
public enum ChordType: String, CaseIterable, Codable {

	//MARK: - Triads
    /// Major Triad: Major Third, Perfect Fifth, e.g. `C`
    case majorTriad

    /// Minor Triad: Minor Third, Perfect Fifth, e.g. `Cm`
    case minorTriad

    /// Diminished Triad: Minor Third, Diminished Fifth, e.g. `C°`
    case diminishedTriad

    /// Major Flat Five Triad: Major Third, Diminished Fifth, e.g. `C♭5`
    case flatFiveTriad

    /// Augmented Triad: Major Third, Augmented Fifth, e.g. `C⁺`
    case augmentedTriad

    /// Suspended 2 Triad: Major Second, Perfect Fifth, e.g. `Csus2`
    case suspendedSecondTriad

    /// Suspended 4 Triad: Perfect Fourth, Perfect Fifth, e.g. `Csus4`
    case suspendedFourthTriad

	//MARK: - Sixths
    /// Major Sixth: Major Third, Perfect Fifth, Major Sixth, e.g. `C6`
    case sixth

    /// Minor Sixth: Minor Third, Perfect Fifth, Major Sixth, e.g. `Cm6`
    case minorSixth

    /// Major Sixth Suspended Second: Major Second, Perfect Fifth, Major Sixth, e.g. `C6sus2`
    case sixthSuspendedSecond

    /// Major Sixth Suspended Fourth: Major Fourth, Perfect Fifth, Major Sixth, e.g. `C6sus4`
    case sixthSuspendedFourth
	
	//MARK: - Sevenths
	/// Major Seventh: Major Third, Perfect Fifth, Major Seventh, e.g. `Cmaj7`
	case majorSeventh
	
	/// Dominant Seventh: Major Third, Perfect Fifth, Minor Seventh, e.g. `C7`
	case dominantSeventh

	/// Minor Seventh: Minor Third, Perfect Fifth, Minor Seventh, e.g. `Cmin7`
	case minorSeventh

    /// Half Diminished Seventh: Minor Third, Diminished Fifth, Minor Seventh, e.g. `Cø7`
    case halfDiminishedSeventh

    /// Diminished Seventh: Minor Third, Diminished Fifth, Minor Seventh, e.g. `C°7`
    case diminishedSeventh

    /// Dominant Seventh Suspendend Second: Major Second, Perfect Fifth, Minor Seventh, e.g. `C7sus2`
    case dominantSeventhSuspendedSecond

    /// Dominant Seventh Suspendend Fourth: Perfect Fourth, Perfect Fifth, Minor Seventh, e.g. `C7sus4`
    case dominantSeventhSuspendedFourth
	
	/// Augmented Major Seventh: Major Third, Augmented Fifth, Major Seventh, e.g. `C+Maj7`
	case augmentedMajorSeventh

    /// Minor Major Seventh: Minor Third, Perfect Fifth, Major Seventh, e.g. `CmMaj7`
    case minorMajorSeventh
	
	/// Minor Seventh Flat Five: Major Third, Diminished Fifth, Major Seventh, e.g. `Cmaj7(♭5)`
	case majorSeventhFlatFive
	
	/// Dominant Flat Five: Major Third, Diminished Fifth, Minor Seventh, e.g. `C7(♭5)`
	case dominantSeventhFlatFive

	/// Dominant Sharp Five: Major Third, Augmented Fifth, Minor Seventh, e.g. `C7(♯5)`
	case dominantSeventhSharpFive

	//MARK: - Ninths
	/// Major Ninth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, e.g. `Cmaj9`
	case majorNinth
	
	/// Dominant Ninth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, e.g. `C9`
	case dominantNinth
	
	/// Minor Ninth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, e.g. `Cmin9`
	case minorNinth
	
    /// Half Diminished Flat Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, e.g. `Cø♭9`
    case halfDiminishedFlatNinth
	
	/// Diminished Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, e.g. `C°♭9`
	case diminishedFlatNinth

    /// Dominant Ninth Suspended Fourth: Perfect Fourth, Perfect Fifth, Major Ninth (Major Second), e.g. `C9sus4`
    case dominantNinthSuspendedFourth

    /// Flat Ninth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, e.g. `C7♭9`
    case dominantFlatNinth

    /// Sharp Ninth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, e.g. `C7♯9`
    case dominantSharpNinth
    
    /// Minor Major Ninth: Minor Third, Perfect Fifth, Major Seventh, Major Ninth, e.g. `CmMaj9`
    case minorMajorNinth

    /// Minor Flat Ninth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, e.g. `Cm7♭9`
    case minorFlatNinth

    /// Major Add Nine: Major Third, Perfect Fifth, Major Ninth, e.g. `Cadd9`
    case majorAddNine

    /// Minor Add Nine: Minor Third, Perfect Fifth, Major Ninth, e.g. `Cm(add9)`
    case minorAddNine

    /// Six Over Nine: Major Third, Perfect Fifth, Major Sixth, Major Ninth, e.g. `C6/9`
    case sixOverNine
    
    /// Augmented Major Ninth: Major Third, Augmented Fifth, Major Seventh, Major Nine, e.g. `C+maj9`
    case augmentedMajorNinth
	
	/// Major Ninth Flat Five: Major Third, Diminished Fifth, Major Seventh, Major Nine, e.g. `Cmaj9(♭5)`
	case majorNinthFlatFive
	
	/// Dominant Ninth Flat Five: Major Third, Diminished Fifth, Minor Seventh, Major Nine, e.g. `C9(♭5)`
	case dominantNinthFlatFive

	/// Dominant Ninth Sharp Five: Major Third, Augmented Fifth, Minor Seventh, Major Nine, e.g. `C9(♯5)`
	case dominantNinthSharpFive

	//MARK: - Elevenths
    /// Major Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, e.g. `Cmaj11`
    case majorEleventh

    /// Dominant Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `C11`
    case dominantEleventh

    /// Minor Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `Cm11`
    case minorEleventh

    /// Half Diminished Ninth: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `Cø11`
    case halfDiminishedEleventh

    /// Major Ninth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh, e.g. `Cmaj9(♯11)`
    case majorNinthSharpEleventh
    
    /// Dominant Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, e.g. `C9(♯11)`
    case dominantNinthSharpEleventh
    
    /// Minor Ninth Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, e.g. `Cm9(♯11)`
    case minorNinthSharpEleventh
	
	/// Major Ninth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Augmented Eleventh, e.g. `Cmaj7♭9(♯11)`
	case majorFlatNinthSharpEleventh

    /// Dominant Flat Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, e.g. `C7♭9(♯11)`
    case dominantFlatNinthSharpEleventh
	
	/// Minor Flat Ninth Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, e.g. `Cm7♭9(♯11)`
	case minorFlatNinthSharpEleventh
	
    /// Dominant Sharp Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, e.g. `C7♯9(♯11)`
    case dominantSharpNinthSharpEleventh

    /// Minor Seventh Flat Ninth  Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, e.g. `Cm7♭9(11)`
    case minorSeventhFlatNinthEleventh
	
	/// Major Seventh  Add Eleventh: Major Third, Perfect Fifth, Major Seventh, Perfect Eleventh, e.g. `Cmaj7(add11)`
	case majorSeventhAddEleventh
	
	/// Major Seventh  Add Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Augmented Eleventh, e.g. `Cmaj7(add♯11)`
	case majorSeventhAddSharpEleventh
	
	/// Dominant Seventh Add Eleventh: Major Third, Perfect Fifth, Minor Seventh, Perfect Eleventh, e.g. `C7(add11)`
	case dominantSeventhAddEleventh
	
	/// Dominant Seventh Add Sharp Eleventh: Major Third, Perfect Fifth, minor Seventh, Augmented Eleventh, e.g. `C7(add♯11)`
	case dominantSeventhAddSharpEleventh
	
	/// Minor Seventh Add Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Perfect Eleventh, e.g. `Cm7(add11)`
	case minorSeventhAddEleventh
	
	/// Minor Seventh Add Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Augmented Eleventh, e.g. `Cm7(add♯11)`
	case minorSeventhAddSharpEleventh

	//MARK: - Thirteenths
	
    /// Major Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13`
    case majorThirteenth
	
	/// Dominant Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13`
	case dominantThirteenth

    /// Minor Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13`
    case minorThirteenth
	
	/// Half Diminished Thirteenth: Minor Third, Dimished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth e.g. `Cø13`
	case halfDiminishedThirteenth
	
	/// Minor Thirteenth Flat Five: Minor Third, Dimished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13(♭5)`
	case minorThirteenthFlatFive
	
	/// Major Thirteenth Flat Ninth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13(♭9)`
	case majorThirteenthFlatNinth
	
	/// Dominant Thirteenth Flat Ninth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13(♭9)`
	case dominantThirteenthFlatNinth
	
	/// Minor Thirteenth Flat Ninth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13(♭9)`
	case minorThirteenthFlatNinth

	/// Minor Thirteenth Flat Five Flat Ninth: Minor Third, Dimished Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13♭5(♭9)`
	case minorThirteenthFlatFiveFlatNinth
	
	/// Major Thirteenth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh, Major Thirteenth, e.g. `Cmaj13(♯11)`
	case majorThirteenthSharpEleventh
	
	/// Dominant Thirteenth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, Major Thirteenth, e.g. `C13(♯11)`
	case dominantThirteenthSharpEleventh
	
	/// Minor Thirteenth Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, Major Thirteenth, e.g. `Cm13(♯11)`
	case minorThirteenthSharpEleventh
	
	/// Major Seventh Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cmaj7(♭13)`
	case majorSeventhFlatThirteenth
	
	/// Dominant Seventh Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `C7(♭13)`
	case dominantSeventhFlatThirteenth
	
	/// Minor Seventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cmin7(♭13)`
	case minorSeventhFlatThirteenth
	
	/// Half Diminished Seventh Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cø7(♭13)`
	case halfDimishedSeventhFlatThirteenth
	
	/// Major Seventh Flat Ninth Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cmaj7♭9(♭13)`
	case majorSeventhFlatNinthFlatThirteenth
	
	/// Dominant Seventh Flat Ninth Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth,, e.g. `C7♭9(♭13)`
	case dominantSeventhFlatNinthFlatThirteenth
	
	/// Minor Seventh Flat Ninth Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth,, e.g. `Cmin7♭9(♭13)`
	case minorSeventhFlatNinthFlatThirteenth

	/// Minor Seventh Flat Five Flat Ninth Flat Thirteenth: Minor Third, Dimished Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth,, e.g. `Cmin7♭5♭9(♭13)`
	case minorSeventhFlatFiveFlatNinthFlatThirteenth
	
	/// Major Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmaj7♭9♯11(♭13)`
	case majorSeventhFlatNinthSharpEleventhFlatThirteenth
	
	/// Dominant Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `C7♭9♯11(♭13)`
	case dominantSeventhFlatNinthSharpEleventhFlatThirteenth
	
	/// Minor Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmin7♭9♯11(♭13)`
	case minorSeventhFlatNinthSharpEleventhFlatThirteenth
	
    /// Major Seventh Flat Ninth Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm♭9`
    case minorFlatThirteenthFlatNinth


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
            case .halfDiminishedFlatNinth:              return [.m3, .d5, .m7, .m9]
            case .dominantNinth:                    return [.M3, .P5, .m7, .M9]
            case .dominantNinthSuspendedFourth:     return [.P4, .P5, .M9]
            case .dominantFlatNinth:                return [.M3, .P5, .m7, .m9]
            case .dominantSharpNinth:               return [.M3, .P5, .m7, .A9]
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
            case .halfDiminishedEleventh:           return [.m3, .d5, .m7, .M9, .P11]
            case .majorSeventhFlatFive:             return [.M3, .d5, .M7]
            case .augmentedMajorSeventh:            return [.M3, .A5, .M7]
            case .majorNinthSharpEleventh:          return [.M3, .P5, .M7, .M9, .A11]
            case .dominantNinthSharpEleventh:       return [.M3, .P5, .m7, .M9, .A11]
            case .dominantFlatNinthSharpEleventh:   return [.M3, .P5, .m7, .m9, .A11]
            case .dominantSeventhFlatFive:          return [.M3, .d5, .m7]
            case .dominantSeventhSharpFive:         return [.M3, .A5, .m7]
            case .dominantSharpNinthSharpEleventh:  return [.M3, .P5, .m7, .A9, .A11]
            case .minorSeventhFlatNinthEleventh: 	return [.m3, .P5, .m7, .m9, .P11]
            case .majorThirteenth:                  return [.M3, .P5, .M7, .M9, .P11, .M13]
            case .minorThirteenth:                  return [.m3, .P5, .m7, .M9, .P11, .M13]
            case .minorFlatThirteenthFlatNinth:     return [.m3, .P5, .m7, .m9, .P11, .m13]
            case .majorThirteenthSharpEleventh:     return [.M3, .P5, .M7, .M9, .A11, .M13]
            case .dominantThirteenth:               return [.M3, .P5, .m7, .M9, .P11, .M13]
            case .minorEleventhFlatThirteenth:      return [.m3, .P5, .m7, .M9, .P11, .m13]
            case .halfDiminishedFlatThirteenth:     return [.m3, .d5, .m7, .m9, .P11, .m13]
            case .majorNinthFlatFive:               return [.M3, .d5, .M7, .M9]
            case .augmentedMajorNinth:              return [.M3, .A5, .M7, .M9]
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
			case .majorSeventhFlatFive:             return "maj7(♭5)"
			case .augmentedMajorSeventh:            return "maj7(♯5)"
			case .dominantSeventhFlatFive:                 return "7♭5"
			case .dominantSeventhSharpFive:                return "7♯5"
            case .halfDiminishedFlatNinth:              return "ø9"
            case .dominantNinth:                    return "9"
            case .dominantNinthSuspendedFourth:     return "9sus4"
            case .dominantFlatNinth:                return "7♭9"
            case .dominantSharpNinth:               return "7♯9"
            case .majorNinth:                       return "maj9"
            case .minorFlatNinth:                   return "m7♭9"
            case .minorNinth:                       return "m9"
            case .minorMajorNinth:                  return "mMaj9"
            case .majorAddNine:                     return "add9"
            case .minorAddNine:                     return "m(add9)"
            case .sixOverNine:                      return "6/9"
			case .majorNinthFlatFive:               return "maj9(♭5)"
			case .augmentedMajorNinth:              return "maj9(♯5)"
            case .majorEleventh:                    return "maj11"
            case .dominantEleventh:                 return "11"
            case .minorEleventh:                    return "m11"
            case .halfDiminishedEleventh:           return "ø11"
            case .majorNinthSharpEleventh:          return "maj9(♯11)"
            case .dominantFlatNinthSharpEleventh:   return "7♭9♯11"
            case .dominantSharpNinthSharpEleventh:  return "7♯9♯11"
            case .minorSeventhFlatNinthEleventh: 	return "m7♭9(11)"
            case .majorThirteenth:                  return "maj13"
            case .minorThirteenth:                  return "m13"
            case .minorFlatThirteenthFlatNinth:     return "m♭13♭9"
            case .majorThirteenthSharpEleventh:     return "maj13♯11"
            case .dominantThirteenth:               return "13"
            case .minorEleventhFlatThirteenth:      return "m11♭13"
            case .halfDiminishedFlatThirteenth:     return "ø♭13"
            case .dominantNinthFlatFive:            return "9♭5"
            case .dominantNinthSharpFive:           return "9♯5"
            case .dominantNinthSharpEleventh:       return "9(♯11)"
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
			case .majorSeventhFlatFive:             return "^7b5"
			case .augmentedMajorSeventh:            return "^7#5"
            case .halfDiminishedFlatNinth:              return "Ø9"
            case .dominantNinth:                    return "9"
            case .dominantNinthSuspendedFourth:     return "9sus4"
            case .dominantFlatNinth:                return "7b9"
            case .dominantSharpNinth:               return "7#9"
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
            case .majorNinthSharpEleventh:          return "^9#11"
            case .dominantSeventhFlatFive:          return "7b5"
            case .dominantSeventhSharpFive:         return "7#5"
            case .dominantFlatNinthSharpEleventh:   return "7âÅ"
            case .dominantSharpNinthSharpEleventh:  return "7åÅ"
            case .minorSeventhFlatNinthEleventh: 	return "m7b9(11)"
            case .majorThirteenth:                  return "^13"
            case .minorThirteenth:                  return "m13"
            case .minorFlatThirteenthFlatNinth:     return "máÆ"
            case .majorThirteenthSharpEleventh:     return "^13#11"
            case .dominantThirteenth:               return "13"
            case .minorEleventhFlatThirteenth:      return "m11b13"
            case .halfDiminishedFlatThirteenth:     return "Øb13"
            case .majorNinthFlatFive:               return "^9b5"
            case .augmentedMajorNinth:              return "^9#5"
            case .dominantNinthFlatFive:            return "9b5"
            case .dominantNinthSharpFive:           return "9#5"
            case .dominantNinthSharpEleventh:       return "9(#11)"
        }
    }
}
