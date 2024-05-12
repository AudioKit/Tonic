// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// Chord type as defined by a set of intervals from a root note class
/// We use abreviated descriptions with extensions seperated by underscores
/// We don't like usiing underscores for enum cases any more than you do, however is a nice visual speration of extensions
public enum ChordType: String, CaseIterable, Codable {

	//MARK: - Triads
    /// Major Triad: Major Third, Perfect Fifth, e.g. `C`
    case major

    /// Minor Triad: Minor Third, Perfect Fifth, e.g. `Cm`
    case minor

    /// Diminished Triad: Minor Third, Diminished Fifth, e.g. `C°`
    case dim

    /// Major Flat Five Triad: Major Third, Diminished Fifth, e.g. `C♭5`
    case flat5

    /// Augmented Triad: Major Third, Augmented Fifth, e.g. `C⁺`
    case aug

    /// Suspended 2 Triad: Major Second, Perfect Fifth, e.g. `Csus2`
    case sus2

    /// Suspended 4 Triad: Perfect Fourth, Perfect Fifth, e.g. `Csus4`
    case sus4

	//MARK: - Sixths
    /// Major Sixth: Major Third, Perfect Fifth, Major Sixth, e.g. `C6`
    case maj6

    /// Minor Sixth: Minor Third, Perfect Fifth, Major Sixth, e.g. `Cm6`
    case min6

    /// Suspended 2nd Add Thirteen: Major Second, Perfect Fifth, Major Thirteenth, e.g. `Csus2(add13)`
    case sus2_add13

    /// Suspended 4th Add Thirteen: Major Fourth, Perfect Fifth, Major Sixth, e.g. `Csus4(add13)`
    case sus4_add13
    
    /// Suspended 2nd Add Flat Thirteen: Major Second, Perfect Fifth, Minor Thirteenth, e.g. `Csus2(add♭13)`
    case sus2_addFlat13

    /// Suspended 4th Add Flat Thirteen: Major Second, Perfect Fifth, Minor Thirteenth, e.g. `Csus4(add♭13)`
    case sus4_addFlat13
	
	//MARK: - Sevenths
	/// Major Seventh: Major Third, Perfect Fifth, Major Seventh, e.g. `Cmaj7`
	case maj7
	
	/// Dominant Seventh: Major Third, Perfect Fifth, Minor Seventh, e.g. `C7`
	case dom7

	/// Minor Seventh: Minor Third, Perfect Fifth, Minor Seventh, e.g. `Cmin7`
	case min7

    /// Half Diminished Seventh: Minor Third, Diminished Fifth, Minor Seventh, e.g. `Cø7`
    case halfDim7

    /// Diminished Seventh: Minor Third, Diminished Fifth, Minor Seventh, e.g. `C°7`
    case dim7

    #warning("This might be better described as a Minor Triad Add 11")
    /// Dominant Seventh Suspendend Second: Major Second, Perfect Fifth, Minor Seventh, e.g. `C7sus2`
    case dom7_sus2

    /// Dominant Seventh Suspendend Fourth: Perfect Fourth, Perfect Fifth, Minor Seventh, e.g. `C7sus4`
    case dom7_sus4
	
	/// Major Seventh Sharp Five: Major Third, Augmented Fifth, Major Seventh, e.g. `CMaj7(#5)`
	case maj7_sharp5

    /// Minor Major Seventh: Minor Third, Perfect Fifth, Major Seventh, e.g. `CmMaj7`
    case min_maj7
	
	/// Major Seventh Flat Five: Major Third, Diminished Fifth, Major Seventh, e.g. `Cmaj7(♭5)`
	case maj7_flat5
	
	/// Dominant Seventh Flat Five: Major Third, Diminished Fifth, Minor Seventh, e.g. `C7(♭5)`
	case dom7_flat5

	/// Dominant Sharp Five: Major Third, Augmented Fifth, Minor Seventh, e.g. `C7(♯5)`
	case dom7_sharp5

	//MARK: - Ninths
	/// Major Ninth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, e.g. `Cmaj9`
	case maj9
	
	/// Dominant Ninth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, e.g. `C9`
	case dom9
	
	/// Minor Ninth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, e.g. `Cmin9`
	case min9
    
    /// Half Diminished Ninth: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, e.g. `Cø9`
    case halfDim9
	
    /// Half Diminished Flat Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, e.g. `Cø♭9`
    case halfDimFlat9
    
    /// Diminished Ninth: Minor Third, Diminished Fifth, Diminished Seventh, Major Ninth, e.g. `C°9`
    case dim9
	
	/// Diminished Flat Ninth: Minor Third, Diminished Fifth, Diminshed Seventh, Minor Ninth, e.g. `C°♭9`
	case dimFlat9

    /// Dominant Ninth Suspended Fourth: Perfect Fourth, Perfect Fifth, Major Ninth (Major Second), e.g. `C9sus4`
    case dom9_sus4

    /// Flat Ninth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, e.g. `C7♭9`
    case dom7_flat9

    /// Sharp Ninth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, e.g. `C7♯9`
    case dom7_sharp9
    
    /// Minor Major Ninth: Minor Third, Perfect Fifth, Major Seventh, Major Ninth, e.g. `CmMaj9`
    case min_maj9
    
    /// Minor Major Flat Ninth: Minor Third, Perfect Fifth, Major Seventh, Minor Ninth, e.g. `CmMaj(♭9)`
    case min_maj_flat9

    /// Minor Seventh Flat Ninth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, e.g. `Cm7♭9`
    case min7_flat9

    /// Major Add Nine: Major Third, Perfect Fifth, Major Ninth, e.g. `C(add9)`
    case maj_add9

    /// Minor Add Nine: Minor Third, Perfect Fifth, Major Ninth, e.g. `Cm(add9)`
    case min_add9
    
    /// Diminished Add Nine: Minor Third, Diminished Fifth, Major Ninth, e.g. `C°(add9)`
    case dim_add9
    
    /// Augmented Add Nine: Major Third, Augmented Fifth, Major Ninth, e.g. `C+(add9)`
    case aug_add9
    
    /// Major Add Flat Nine: Major Third, Perfect Fifth, Minor Ninth, e.g. `C(add♭9)`
    case maj_addFlat9

    /// Minor Add Flat Nine: Minor Third, Perfect Fifth, Minor Minor, e.g. `Cm(add♭9)`
    case min_addFlat9
    
    /// Diminished Add FlatNine: Minor Third, Diminished Fifth, Minor Ninth, e.g. `C°(add♭9)`
    case dim_addFlat9
    
    /// Augmented Add Nine: Major Third, Augmented Fifth, Minor Ninth, e.g. `C+(add♭9)`
    case aug_addFlat9
    
    /// Major Add Sharp Nine: Major Third, Perfect Fifth, Augmented Ninth, e.g. `C(add♯9)`
    case maj_addSharp9

    /// Minor Add Sharp Nine: Minor Third, Perfect Fifth, Augmented Minor, e.g. `Cm(add♯9)`
    case min_addSharp9
    
    /// Diminished Add Sharp Nine: Minor Third, Diminished Fifth, Augmented Ninth, e.g. `C°(add♯9)`
    case dim_addSharp9
    
    /// Augmented Add Sharp Nine: Major Third, Augmented Fifth, Augmented Ninth, e.g. `C+(add♯9)`
    case aug_addSharp9

    /// Six Over Nine: Major Third, Perfect Fifth, Major Sixth, Major Ninth, e.g. `C6/9`
    case maj_6_9
    
    /// Augmented Major Ninth: Major Third, Augmented Fifth, Major Seventh, Major Nine, e.g. `Cmaj9(♯5)`
    case maj9_sharp5
	
	/// Major Ninth Flat Five: Major Third, Diminished Fifth, Major Seventh, Major Nine, e.g. `Cmaj9(♭5)`
	case maj9_flat5
	
	/// Dominant Ninth Flat Five: Major Third, Diminished Fifth, Minor Seventh, Major Nine, e.g. `C9(♭5)`
	case dom9_flat5

	/// Dominant Ninth Sharp Five: Major Third, Augmented Fifth, Minor Seventh, Major Nine, e.g. `C9(♯5)`
	case dom9_sharp5

	//MARK: - Elevenths
    /// Major Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, e.g. `Cmaj11`
    case maj11

    /// Dominant Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `C11`
    case dom11

    /// Minor Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `Cm11`
    case min11

    /// Half Diminished Eleventh: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `Cø11`
    case halfDim11
    
    /// Diminished Ninth: Minor Third, Diminished Fifth, Diminished Seventh, Major Ninth, Perfect Eleventh, e.g. `C°11`
    case dim11
    
    /// Major Eleventh Flat Five: Major Third, Diminished Fifth, Major Seventh, Major Ninth, Perfect Eleventh, e.g. `Cmaj11(♭5)`
    case maj11_flat5
    
    /// Major Eleventh Sharp Five: Major Third, Augmented Fifth, Major Seventh, Major Ninth, Perfect Eleventh, e.g. `Cmaj11(♯5)`
    case maj11_sharp5
    
    /// Dominant Eleventh Flat Five: Major Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `C11(♭5)`
    case dom11_flat5
    
    /// Dominant Eleventh Sharp Five: Major Third, Augmented Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `C11(♯5)`
    case dom11_sharp5

    /// Major Ninth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh, e.g. `Cmaj9(♯11)`
    case maj9_sharp11
    
    /// Dominant Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, e.g. `C9(♯11)`
    case dom9_sharp11
    
    /// Minor Ninth Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, e.g. `Cm9(♯11)`
    case min9_sharp11
    
    /// Major Ninth  Flat Five Sharp Eleventh: Major Third, Diminished Fifth, Major Seventh, Major Ninth, Augmented Eleventh, e.g. `Cmaj9(♭5)(♯11)`
    case maj9_flat5_sharp11
    
    /// Major Ninth Sharp Five Sharp Eleventh: Major Third, Augmented Fifth, Major Seventh, Major Ninth, Augmented Eleventh, e.g. `Cmaj9(♯5)(♯11)`
    case maj9_sharp5_sharp11
    
    /// Dominant Ninth Flat Five Sharp Eleventh: Major Third, Diminished Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, e.g. `C9(♭5)(♯11)`
    case dom9_flat5_sharp11
    
    /// Dominant Ninth Sharp Five Sharp Eleventh: Major Third, Augmented Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, e.g. `C9(♯5)(♯11)`
    case dom9_sharp5_sharp11
	
	/// Major Ninth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Augmented Eleventh, e.g. `Cmaj7♭9(♯11)`
	case maj7_flat9_sharp11

    /// Dominant Flat Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, e.g. `C7♭9(♯11)`
    case dom7_flat9_sharp11
	
	/// Minor Flat Ninth Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, e.g. `Cm7♭9(♯11)`
	case min7_flat9_sharp11
	
    /// Dominant Sharp Ninth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, e.g. `C7♯9(♯11)`
    case dom7_sharp9_sharp11

    /// Minor Seventh Flat Ninth  Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, e.g. `Cm7♭9(11)`
    case min7_flat9_11
	
	/// Major Seventh  Add Eleventh: Major Third, Perfect Fifth, Major Seventh, Perfect Eleventh, e.g. `Cmaj7(add11)`
	case maj7_add11
	
	/// Major Seventh  Add Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Augmented Eleventh, e.g. `Cmaj7(add♯11)`
	case maj7_addSharp11
	
	/// Dominant Seventh Add Eleventh: Major Third, Perfect Fifth, Minor Seventh, Perfect Eleventh, e.g. `C7(add11)`
	case dom7_add11
	
	/// Dominant Seventh Add Sharp Eleventh: Major Third, Perfect Fifth, minor Seventh, Augmented Eleventh, e.g. `C7(add♯11)`
	case dom7_addSharp11
	
	/// Minor Seventh Add Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Perfect Eleventh, e.g. `Cm7(add11)`
	case min7_add11
	
	/// Minor Seventh Add Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Augmented Eleventh, e.g. `Cm7(add♯11)`
	case min7_addSharp11
    
    /// Half Diminished Seventh Add Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Perfect Eleventh, e.g. `Cø7(add11)`
    case halfDim7_add11

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
	
	/// Major Thirteenth Sharp Ninth: Major Third, Perfect Fifth, Major Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13(♯9)`
	case majorThirteenthSharpNinth
	
	/// Dominant Thirteenth Sharp Ninth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13(♯9)`
	case dominantThirteenthSharpNinth
	
	/// Minor Thirteenth Sharp Ninth: Minor Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13(♯9)`
	case minorThirteenthSharpNinth

	/// Minor Thirteenth Flat Five Sharp Ninth: Minor Third, Dimished Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13♭5(♯9)`
	case minorThirteenthFlatFiveSharpNinth
	
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
	
	/// Major Seventh Sharp Ninth Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cmaj7♯9(♭13)`
	case majorSeventhSharpNinthFlatThirteenth
	
	/// Dominant Seventh Sharp Ninth Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth,, e.g. `C7♯9(♭13)`
	case dominantSeventhSharpNinthFlatThirteenth
	
	/// Minor Seventh Sharp Ninth Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth,, e.g. `Cmin7♯9(♭13)`
	case minorSeventhSharpNinthFlatThirteenth

	/// Minor Seventh Flat Five Sharp Ninth Flat Thirteenth: Minor Third, Dimished Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth,, e.g. `Cmin7♭5♯9(♭13)`
	case minorSeventhFlatFiveSharpNinthFlatThirteenth
	
	/// Major Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmaj7♭9♯11(♭13)`
	case majorSeventhFlatNinthSharpEleventhFlatThirteenth
	
	/// Dominant Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `C7♭9♯11(♭13)`
	case dominantSeventhFlatNinthSharpEleventhFlatThirteenth
	
	/// Minor Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmin7♭9♯11(♭13)`
	case minorSeventhFlatNinthSharpEleventhFlatThirteenth
	
	/// Minor Seventh Flat Five Flat Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Dimished Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth,, e.g. `Cmin7♭5♭9♯11(♭13)`
	case minorSeventhFlatFiveFlatNinthSharpEleventhFlatThirteenth
	
	/// Major Seventh Sharp Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Augmented Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmaj7♯9♯11(♭13)`
	case majorSeventhSharpNinthSharpEleventhFlatThirteenth
	
	/// Dominant Seventh Sharp Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `C7♯9♯11(♭13)`
    case dominantSeventhSharpNinthSharpEleventhFlatThirteenth
    case dom7sharp9sharp11flat13
    case dom7_sharp9_sharp11_flat13
    case dom7Sharp9Sharp11Flat13
	
	/// Minor Seventh Sharp Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmin7♯9♯11(♭13)`
	case minorSeventhSharpNinthSharpEleventhFlatThirteenth
	
	/// Minor Seventh Flat Five Sharp Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Dimished Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth,, e.g. `Cmin7♭5♯9♯11(♭13)`
	case minorSeventhFlatFiveSharpNinthSharpEleventhFlatThirteenth
	
	/// Major Seventh Add Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Thirteenth, e.g. `Cmaj7(add13)`
	case majorSeventhAddThirteenth
	
	/// Dominant Seventh Add Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Major Thirteenth, e.g. `C7(add13)`
	case dominantSeventhAddThirteenth
	
	/// Minor Seventh Add Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Major Thirteenth, e.g. `Cmin7(add13)`
	case minorSeventhAddThirteenth
	
	/// Half Diminished Seventh Add Thirteenth: Minor Third, Diminished Fifth, Major Seventh, Major Thirteenth, e.g. `Cø7(add13)`
	case halfDiminishedSeventhAddThirteenth
	
	/// Major Seventh Add Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Thirteenth, e.g. `Cmaj7(add♭13)`
	case majorSeventhAddFlatThirteenth
	
	/// Dominant Seventh Add Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Minor Thirteenth, e.g. `C7(add♭13)`
	case dominantSeventhAddFlatThirteenth
	
	/// Minor Seventh Add Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Minor Thirteenth, e.g. `Cmin7(add♭13)`
	case minorSeventhAddFlatThirteenth
	
	/// Half Diminished Seventh Add Thirteenth: Minor Third, Diminished Fifth, Major Seventh, Major Thirteenth, e.g. `Cø7(add13)`
	case halfDiminishedSeventhAddFlatThirteenth
	
	/// Major Seventh Add Ninth Add Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Major Thirteenth, e.g. `Cmaj7(add9)(add13)`
	case majorSeventhAddNinthAddThirteenth
    
    /// Major Seventh Add Flat Ninth Add Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Major Thirteenth, e.g. `Cmaj7(add♭9)(add13)`
    case majorSeventhAddFlatNinthAddThirteenth
    
    /// Major Seventh Add Flat Ninth Add Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Minor Thirteenth, e.g. `Cmaj7(add♭9)(add13)`
    case majorSeventhAddFlatNinthAddThirteenth
	
    /// Major Seventh Flat Ninth Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm♭9`
    case minorFlatThirteenthFlatNinth


    /// Minor Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Diminished Thirteenth
    case minorEleventhFlatThirteenth

    /// Half Diminished Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Diminished Thirteenth
    case halfDiminishedFlatThirteenth



    public var intervals: [Interval] {
        switch self {
            case .major:                       return [.M3, .P5]
            case .minor:                       return [.m3, .P5]
            case .dim:                  return [.m3, .d5]
            case .flat5:                    return [.M3, .d5]
            case .aug:                   return [.M3, .A5]
            case .sus2:             return [.M2, .P5]
            case .sus4:             return [.P4, .P5]
            case .maj6:                            return [.M3, .P5, .M6]
            case .min6:                       return [.m3, .P5, .M6]
            case .sus2_add13:             return [.M2, .P5, .M6]
            case .sus4_add13:             return [.P4, .P5, .M6]
            case .halfDim7:            return [.m3, .d5, .m7]
            case .dim7:                return [.m3, .d5, .d7]
            case .dom7:                  return [.M3, .P5, .m7]
            case .dom7_sus2:   return [.M2, .P5, .m7]
            case .dom7_sus4:   return [.P4, .P5, .m7]
            case .maj7:                     return [.M3, .P5, .M7]
            case .min7:                     return [.m3, .P5, .m7]
            case .min_maj7:                return [.m3, .P5, .M7]
            case .halfDimFlat9:              return [.m3, .d5, .m7, .m9]
            case .dom9:                    return [.M3, .P5, .m7, .M9]
            case .dom9_sus4:     return [.P4, .P5, .M9]
            case .dom7_flat9:                return [.M3, .P5, .m7, .m9]
            case .dom7_sharp9:               return [.M3, .P5, .m7, .A9]
            case .maj9:                       return [.M3, .P5, .M7, .M9]
            case .min_maj9:                  return [.m3, .P5, .M7, .M9]
            case .min7_flat9:                   return [.m3, .P5, .m7, .m9]
            case .min9:                       return [.m3, .P5, .m7, .M9]
            case .maj_add9:                     return [.M3, .P5, .M9]
            case .min_add9:                     return [.m3, .P5, .M9]
            case .maj_6_9:                      return [.M3, .P5, .M6, .M9]
            case .maj11:                    return [.M3, .P5, .M7, .M9, .P11]
            case .dom11:                 return [.M3, .P5, .m7, .M9, .P11]
            case .min11:                    return [.m3, .P5, .m7, .M9, .P11]
            case .halfDim11:           return [.m3, .d5, .m7, .M9, .P11]
            case .maj7_flat5:             return [.M3, .d5, .M7]
            case .maj7_sharp5:            return [.M3, .A5, .M7]
            case .maj9_sharp11:          return [.M3, .P5, .M7, .M9, .A11]
            case .dom9_sharp11:       return [.M3, .P5, .m7, .M9, .A11]
            case .dom7_flat9_sharp11:   return [.M3, .P5, .m7, .m9, .A11]
            case .dom7_flat5:          return [.M3, .d5, .m7]
            case .dom7_sharp5:         return [.M3, .A5, .m7]
            case .dom7_sharp9_sharp11:  return [.M3, .P5, .m7, .A9, .A11]
            case .min7_flat9_11: 	return [.m3, .P5, .m7, .m9, .P11]
            case .majorThirteenth:                  return [.M3, .P5, .M7, .M9, .P11, .M13]
            case .minorThirteenth:                  return [.m3, .P5, .m7, .M9, .P11, .M13]
            case .minorFlatThirteenthFlatNinth:     return [.m3, .P5, .m7, .m9, .P11, .m13]
            case .majorThirteenthSharpEleventh:     return [.M3, .P5, .M7, .M9, .A11, .M13]
            case .dominantThirteenth:               return [.M3, .P5, .m7, .M9, .P11, .M13]
            case .minorEleventhFlatThirteenth:      return [.m3, .P5, .m7, .M9, .P11, .m13]
            case .halfDiminishedFlatThirteenth:     return [.m3, .d5, .m7, .m9, .P11, .m13]
            case .maj9_flat5:               return [.M3, .d5, .M7, .M9]
            case .augmentedMajorNinth:              return [.M3, .A5, .M7, .M9]
            case .dom9_flat5:            return [.M3, .d5, .m7, .M9]
            case .dom9_sharp5:           return [.M3, .A5, .m7, .M9]
                
        }
    }
}

extension ChordType: CustomStringConvertible {
    /// Adornment to the Root NoteClass (letter+accidental) that defines the chord type
    public var description: String {
        switch self {
            case .major:                       return ""
            case .minor:                       return "m"
            case .dim:                  return "°"
            case .flat5:                    return "♭5"
            case .aug:                   return "⁺"
            case .sus2:             return "sus2"
            case .sus4:             return "sus4"
            case .maj6:                            return "6"
            case .min6:                       return "m6"
            case .sus2_add13:             return "6sus2"
            case .sus4_add13:             return "6sus4"
            case .halfDim7:            return "ø7"
            case .dim7:                return "°7"
            case .dom7:                  return "7"
            case .dom7_sus2:   return "7sus2"
            case .dom7_sus4:   return "7sus4"
            case .maj7:                     return "maj7"
            case .min7:                     return "m7"
            case .min_maj7:                return "mMaj7"
			case .maj7_flat5:             return "maj7(♭5)"
			case .maj7_sharp5:            return "maj7(♯5)"
			case .dom7_flat5:                 return "7♭5"
			case .dom7_sharp5:                return "7♯5"
            case .halfDimFlat9:              return "ø9"
            case .dom9:                    return "9"
            case .dom9_sus4:     return "9sus4"
            case .dom7_flat9:                return "7♭9"
            case .dom7_sharp9:               return "7♯9"
            case .maj9:                       return "maj9"
            case .min7_flat9:                   return "m7♭9"
            case .min9:                       return "m9"
            case .min_maj9:                  return "mMaj9"
            case .maj_add9:                     return "add9"
            case .min_add9:                     return "m(add9)"
            case .maj_6_9:                      return "6/9"
			case .maj9_flat5:               return "maj9(♭5)"
			case .augmentedMajorNinth:              return "maj9(♯5)"
            case .maj11:                    return "maj11"
            case .dom11:                 return "11"
            case .min11:                    return "m11"
            case .halfDim11:           return "ø11"
            case .maj9_sharp11:          return "maj9(♯11)"
            case .dom7_flat9_sharp11:   return "7♭9♯11"
            case .dom7_sharp9_sharp11:  return "7♯9♯11"
            case .min7_flat9_11: 	return "m7♭9(11)"
            case .majorThirteenth:                  return "maj13"
            case .minorThirteenth:                  return "m13"
            case .minorFlatThirteenthFlatNinth:     return "m♭13♭9"
            case .majorThirteenthSharpEleventh:     return "maj13♯11"
            case .dominantThirteenth:               return "13"
            case .minorEleventhFlatThirteenth:      return "m11♭13"
            case .halfDiminishedFlatThirteenth:     return "ø♭13"
            case .dom9_flat5:            return "9♭5"
            case .dom9_sharp5:           return "9♯5"
            case .dom9_sharp11:       return "9(♯11)"
        }
    }

    /// Adornment to the Root NoteClass (letter+accidental) that defines the chord type
    /// using specialized Chord Symbol Fonts Norfolk or Pori from
    /// NotationExpress: https://www.notationcentral.com/product/norfolk-fonts-for-sibelius/
    public var chordFontDescription: String {
        switch self {
            case .major:                       return ""
            case .minor:                       return "m"
            case .dim:                  return "º"
            case .flat5:                    return "b5"
            case .aug:                   return "&"
            case .sus2:             return "“2"
            case .sus4:             return "“4"
            case .maj6:                            return "6"
            case .min6:                       return "m6"
            case .sus2_add13:             return "6sus2"
            case .sus4_add13:             return "6sus4"
            case .halfDim7:            return "Ø7"
            case .dim7:                return "º7"
            case .dom7:                  return "7"
            case .dom7_sus2:   return "7sus2"
            case .dom7_sus4:   return "7sus4"
            case .maj7:                     return "^7"
            case .min7:                     return "m7"
            case .min_maj7:                return "m^7"
			case .maj7_flat5:             return "^7b5"
			case .maj7_sharp5:            return "^7#5"
            case .halfDimFlat9:              return "Ø9"
            case .dom9:                    return "9"
            case .dom9_sus4:     return "9sus4"
            case .dom7_flat9:                return "7b9"
            case .dom7_sharp9:               return "7#9"
            case .maj9:                       return "^9"
            case .min_maj9:                  return "m^9"
            case .min7_flat9:                   return "m7b9"
            case .min9:                       return "m9"
            case .maj_add9:                     return "@9"
            case .min_add9:                     return "m@9"
            case .maj_6_9:                      return "%"
            case .maj11:                    return "^11"
            case .dom11:                 return "11"
            case .min11:                    return "m11"
            case .halfDim11:           return "Ø11"
            case .maj9_sharp11:          return "^9#11"
            case .dom7_flat5:          return "7b5"
            case .dom7_sharp5:         return "7#5"
            case .dom7_flat9_sharp11:   return "7âÅ"
            case .dom7_sharp9_sharp11:  return "7åÅ"
            case .min7_flat9_11: 	return "m7b9(11)"
            case .majorThirteenth:                  return "^13"
            case .minorThirteenth:                  return "m13"
            case .minorFlatThirteenthFlatNinth:     return "máÆ"
            case .majorThirteenthSharpEleventh:     return "^13#11"
            case .dominantThirteenth:               return "13"
            case .minorEleventhFlatThirteenth:      return "m11b13"
            case .halfDiminishedFlatThirteenth:     return "Øb13"
            case .maj9_flat5:               return "^9b5"
            case .augmentedMajorNinth:              return "^9#5"
            case .dom9_flat5:            return "9b5"
            case .dom9_sharp5:           return "9#5"
            case .dom9_sharp11:       return "9(#11)"
        }
    }
}
