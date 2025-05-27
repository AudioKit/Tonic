// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// Chord type as defined by a set of intervals from a root note class
/// We use abreviated descriptions with extensions seperated by underscores
/// We don't like usiing underscores for enum cases any more than you do, however is a nice visual speration of extensions
public enum ChordType: String, Sendable, CaseIterable, Codable {

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
    
    /// Major Ninth Suspended Fourth: Perfect Fourth, Perfect Fifth, Major Seventh, Major Ninth, e.g. `Cmaj9sus4`
    case maj9_sus4

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
    
    /// Dominant Eleventh Suspended Second: Major Second, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, e.g. `C11sus2`
    case dom11_sus2

    //MARK: - Thirteenths
    /// Major Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13`
    case maj13

    /// Dominant Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13`
    case dom13

    /// Minor Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13`
    case min13

    /// Half Diminished Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth e.g. `Cø13`
    case halfDim13

    /// Minor Thirteenth Flat Five: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13(♭5)`
    case min13_flat5

    /// Major Thirteenth Flat Ninth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13(♭9)`
    case maj13_flat9

    /// Dominant Thirteenth Flat Ninth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13(♭9)`
    case dom13_flat9

    /// Minor Thirteenth Flat Ninth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13(♭9)`
    case min13_flat9

    /// Minor Thirteenth Flat Five Flat Ninth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13♭5(♭9)`
    case min13_flat5_flat9

    /// Major Thirteenth Sharp Ninth: Major Third, Perfect Fifth, Major Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13(♯9)`
    case maj13_sharp9

    /// Dominant Thirteenth Sharp Ninth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13(♯9)`
    case dom13_sharp9

    /// Minor Thirteenth Sharp Ninth: Minor Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13(♯9)`
    case min13_sharp9

    /// Minor Thirteenth Flat Five Sharp Ninth: Minor Third, Diminished Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13♭5(♯9)`
    case min13_flat5_sharp9

    /// Major Thirteenth Sharp Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh, Major Thirteenth, e.g. `Cmaj13(♯11)`
    case maj13_sharp11

    /// Dominant Thirteenth Sharp Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, Major Thirteenth, e.g. `C13(♯11)`
    case dom13_sharp11

    /// Minor Thirteenth Sharp Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, Major Thirteenth, e.g. `Cm13(♯11)`
    case min13_sharp11

    /// Major Seventh Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cmaj7(♭13)`
    case maj7_flat13

    /// Dominant Seventh Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `C7(♭13)`
    case dom7_flat13

    /// Minor Seventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm7(♭13)`
    case min7_flat13

    /// Half Diminished Seventh Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cø7(♭13)`
    case halfDim7_flat13

    /// Major Seventh Flat Ninth Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cmaj7♭9(♭13)`
    case maj7_flat9_flat13

    /// Dominant Seventh Flat Ninth Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `C7♭9(♭13)`
    case dom7_flat9_flat13

    /// Minor Seventh Flat Ninth Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm7♭9(♭13)`
    case min7_flat9_flat13

    /// Minor Seventh Flat Five Flat Ninth Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm7♭5♭9(♭13)`
    case min7_flat5_flat9_flat13

    /// Major Seventh Sharp Ninth Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cmaj7♯9(♭13)`
    case maj7_sharp9_flat13

    /// Dominant Seventh Sharp Ninth Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `C7♯9(♭13)`
    case dom7_sharp9_flat13

    /// Minor Seventh Sharp Ninth Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm7♯9(♭13)`
    case min7_sharp9_flat13

    /// Minor Seventh Flat Five Sharp Ninth Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm7♭5♯9(♭13)`
    case min7_flat5_sharp9_flat13

    /// Major Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmaj7♭9♯11(♭13)`
    case maj7_flat9_sharp11_flat13

    /// Dominant Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `C7♭9♯11(♭13)`
    case dom7_flat9_sharp11_flat13

    /// Minor Seventh Flat Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cm7♭9♯11(♭13)`
    case min7_flat9_sharp11_flat13

    /// Minor Seventh Flat Five Flat Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cm7♭5♭9♯11(♭13)`
    case min7_flat5_flat9_sharp11_flat13

    /// Major Seventh Sharp Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Augmented Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cmaj7♯9♯11(♭13)`
    case maj7_sharp9_sharp11_flat13

    /// Dominant Seventh Sharp Ninth Sharp Eleventh Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `C7♯9♯11(♭13)`
    case dom7_sharp9_sharp11_flat13

    /// Minor Seventh Sharp Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cm7♯9♯11(♭13)`
    case min7_sharp9_sharp11_flat13

    /// Minor Seventh Flat Five Sharp Ninth Sharp Eleventh Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, Minor Thirteenth, e.g. `Cm7♭5♯9♯11(♭13)`
    case min7_flat5_sharp9_sharp11_flat13

    /// Major Seventh Add Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Thirteenth, e.g. `Cmaj7(add13)`
    case maj7_add13

    /// Dominant Seventh Add Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Major Thirteenth, e.g. `C7(add13)`
    case dom7_add13

    /// Minor Seventh Add Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Major Thirteenth, e.g. `Cm7(add13)`
    case min7_add13

    /// Half Diminished Seventh Add Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Major Thirteenth, e.g. `Cø7(add13)`
    case halfDim7_add13

    /// Major Seventh Add Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Thirteenth, e.g. `Cmaj7(add♭13)`
    case maj7_addFlat13

    /// Dominant Seventh Add Flat Thirteenth: Major Third, Perfect Fifth, Minor Seventh, Minor Thirteenth, e.g. `C7(add♭13)`
    case dom7_addFlat13

    /// Minor Seventh Add Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Minor Thirteenth, e.g. `Cm7(add♭13)`
    case min7_addFlat13

    /// Half Diminished Seventh Add Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Minor Thirteenth, e.g. `Cø7(add♭13)`
    case halfDim7_addFlat13

    /// Major Seventh Add Ninth Add Thirteenth: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Major Thirteenth, e.g. `Cmaj7(add9)(add13)`
    case maj7_add9_add13

    /// Major Seventh Add Flat Ninth Add Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Major Thirteenth, e.g. `Cmaj7(add♭9)(add13)`
    case maj7_addFlat9_add13

    /// Major Seventh Add Flat Ninth Add Flat Thirteenth: Major Third, Perfect Fifth, Major Seventh, Minor Ninth, Minor Thirteenth, e.g. `Cmaj7(add♭9)(add♭13)`
    case maj7_addFlat9_addFlat13

    /// Minor Flat Thirteenth Flat Ninth: Minor Third, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm♭13♭9`
    case min_flat13_flat9

    /// Minor Eleventh Flat Thirteenth: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cm11(♭13)`
    case min11_flat13

    /// Half Diminished Flat Thirteenth: Minor Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Minor Thirteenth, e.g. `Cø(♭13)`
    case halfDim_flat13

    // Additional 13th chord types
    /// Dominant Thirteenth Flat Five: Major Third, Diminished Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13(♭5)`
    case dom13_flat5

    /// Dominant Thirteenth Sharp Five: Major Third, Augmented Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13(♯5)`
    case dom13_sharp5

    /// Major Thirteenth Flat Five: Major Third, Diminished Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13(♭5)`
    case maj13_flat5

    /// Major Thirteenth Sharp Five: Major Third, Augmented Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13(♯5)`
    case maj13_sharp5

    /// Dominant Thirteenth Flat Nine Sharp Eleven: Major Third, Perfect Fifth, Minor Seventh, Minor Ninth, Augmented Eleventh, Major Thirteenth, e.g. `C13(♭9)(♯11)`
    case dom13_flat9_sharp11

    /// Dominant Thirteenth Sharp Nine Sharp Eleven: Major Third, Perfect Fifth, Minor Seventh, Augmented Ninth, Augmented Eleventh, Major Thirteenth, e.g. `C13(♯9)(♯11)`
    case dom13_sharp9_sharp11

    /// Major Thirteenth Add Eleventh: Major Third, Perfect Fifth, Major Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13(add11)`
    case maj13_add11

    /// Dominant Thirteenth Add Eleventh: Major Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13(add11)`
    case dom13_add11

    /// Minor Thirteenth Add Eleventh: Minor Third, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `Cm13(add11)`
    case min13_add11
    
    //MARK: - Sixths
    /// Major Sixth: Major Third, Perfect Fifth, Major Sixth, e.g. `C6`
    case maj6

    /// Minor Sixth: Minor Third, Perfect Fifth, Major Sixth, e.g. `Cm6`
    case min6
    
    //MARK: - Sus
    /// Suspended 2 Triad: Major Second, Perfect Fifth, e.g. `Csus2`
    case sus2

    /// Suspended 4 Triad: Perfect Fourth, Perfect Fifth, e.g. `Csus4`
    case sus4
    
    //MARK: - Seventh Sus
    /// Dominant Seventh Suspendend Second: Major Second, Perfect Fifth, Minor Seventh, e.g. `C7sus2`
    case dom7_sus2

    /// Dominant Seventh Suspendend Fourth: Perfect Fourth, Perfect Fifth, Minor Seventh, e.g. `C7sus4`
    case dom7_sus4
    
    /// Major Seventh Suspended Second: Major Second, Perfect Fifth, Major Seventh, e.g. `Cmaj7sus2`
    case maj7_sus2

    /// Major Seventh Suspended Fourth: Perfect Fourth, Perfect Fifth, Major Seventh, e.g. `Cmaj7sus4`
    case maj7_sus4
    
    /// Dominant Ninth Suspended Fourth: Perfect Fourth, Perfect Fifth, Major Ninth (Major Second), e.g. `C9sus4`
    case dom9_sus4
    
    /// Suspended Fourth Add Nine: Perfect Fourth, Perfect Fifth, Major Ninth, e.g. `Csus4(add9)`
    case sus4_add9

    /// Suspended Second Add Eleven: Major Second, Perfect Fifth, Perfect Eleventh, e.g. `Csus2(add11)`
    case sus2_add11

    /// Suspended Fourth Add Flat Nine: Perfect Fourth, Perfect Fifth, Minor Ninth, e.g. `Csus4(addb9)`
    case sus4_addFlat9

    /// Suspended Fourth Add Sharp Nine: Perfect Fourth, Perfect Fifth, Augmented Ninth, e.g. `Csus4(add#9)`
    case sus4_addSharp9

    /// Suspended Second Add Sharp Eleven: Major Second, Perfect Fifth, Augmented Eleventh, e.g. `Csus2(add#11)`
    case sus2_addSharp11
    
    /// Major Thirteenth Suspended Second: Major Second, Perfect Fifth, Major Seventh, Perfect Eleventh, Major Thirteenth, e.g. `Cmaj13sus2`
    case maj13_sus2

    /// Major Thirteenth Suspended Fourth: Perfect Fourth, Perfect Fifth, Major Seventh, Major Ninth, Major Thirteenth, e.g. `Cmaj13sus4`
    case maj13_sus4
    
    /// Dominant Thirteenth Suspended Second: Major Second, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13sus2`
    case dom13_sus2

    /// Dominant Thirteenth Suspended Fourth: Perfect Fourth, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13sus4`
    case dom13_sus4
    
    /// Dominant Seventh Suspended Fourth Flat Ninth: Perfect Fourth, Perfect Fifth, Minor Seventh, Minor Ninth, e.g. `C7sus4(♭9)`
    case dom7_sus4_flat9

    /// Dominant Seventh Suspended Fourth Sharp Ninth: Perfect Fourth, Perfect Fifth, Minor Seventh, Augmented Ninth, e.g. `C7sus4(♯9)`
    case dom7_sus4_sharp9

    /// Dominant Seventh Suspended Second Sharp Eleventh: Major Second, Perfect Fifth, Minor Seventh, Augmented Eleventh, e.g. `C7sus2(♯11)`
    case dom7_sus2_sharp11

    /// Dominant Seventh Suspended Fourth Flat Thirteenth: Perfect Fourth, Perfect Fifth, Minor Seventh, Minor Thirteenth, e.g. `C7sus4(♭13)`
    case dom7_sus4_flat13

    /// Dominant Seventh Suspended Fourth Sharp Thirteenth: Perfect Fourth, Perfect Fifth, Minor Seventh, Augmented Thirteenth, e.g. `C7sus4(♯13)`
    case dom7_sus4_sharp13

    /// Dominant Ninth Suspended Fourth Flat Thirteenth: Perfect Fourth, Perfect Fifth, Minor Seventh, Major Ninth, Minor Thirteenth, e.g. `C9sus4(♭13)`
    case dom9_sus4_flat13

    /// Dominant Ninth Suspended Fourth Sharp Eleventh: Perfect Fourth, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, e.g. `C9sus4(♯11)`
    case dom9_sus4_sharp13

    /// Dominant Eleventh Suspended Second Flat Ninth: Major Second, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, e.g. `C11sus2(♭9)`
    case dom11_sus2_flat9

    /// Dominant Eleventh Suspended Second Sharp Ninth: Major Second, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, e.g. `C11sus2(♯9)`
    case dom11_sus2_flat13

    /// Dominant Eleventh Suspended Second Sharp Thirteenth: Major Second, Perfect Fifth, Minor Seventh, Major Ninth, Perfect Eleventh, Augmented Thirteenth, e.g. `C11sus2(♯13)`
    case dom11_sus2_sharp13

    /// Dominant Thirteenth Suspended Fourth Flat Ninth: Perfect Fourth, Perfect Fifth, Minor Seventh, Minor Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13sus4(♭9)`
    case dom13_sus4_flat9

    /// Dominant Thirteenth Suspended Fourth Sharp Ninth: Perfect Fourth, Perfect Fifth, Minor Seventh, Augmented Ninth, Perfect Eleventh, Major Thirteenth, e.g. `C13sus4(♯9)`
    case dom13_sus4_sharp9

    /// Dominant Thirteenth Suspended Second Sharp Eleventh: Major Second, Perfect Fifth, Minor Seventh, Major Ninth, Augmented Eleventh, Major Thirteenth, e.g. `C13sus2(♯11)`
    case dom13_sus2_sharp11

    /// Major Seventh Suspended Fourth Flat Ninth: Perfect Fourth, Perfect Fifth, Major Seventh, Minor Ninth, e.g. `Cmaj7sus4(♭9)`
    case maj7_sus4_flat9

    /// Major Seventh Suspended Fourth Sharp Ninth: Perfect Fourth, Perfect Fifth, Major Seventh, Augmented Ninth, e.g. `Cmaj7sus4(♯9)`
    case maj7_sus4_sharp9

    /// Major Seventh Suspended Second Sharp Eleventh: Major Second, Perfect Fifth, Major Seventh, Augmented Eleventh, e.g. `Cmaj7sus2(♯11)`
    case maj7_sus2_sharp11

    /// Major Ninth Suspended Fourth Flat Thirteenth: Perfect Fourth, Perfect Fifth, Major Seventh, Major Ninth, Minor Thirteenth, e.g. `Cmaj9sus4(♭13)`
    case maj9_sus4_flat13

    /// Major Ninth Suspended Fourth Sharp Eleventh: Perfect Fourth, Perfect Fifth, Major Seventh, Major Ninth, Augmented Eleventh, e.g. `Cmaj9sus4(♯11)`
    case maj9_sus4_sharp11

    /// Major Eleventh Suspended Second Flat Ninth: Major Second, Perfect Fifth, Major Seventh, Minor Ninth, Perfect Eleventh, e.g. `Cmaj11sus2(♭9)`
    case maj11_sus2_flat9

    /// Major Eleventh Suspended Second Sharp Ninth: Major Second, Perfect Fifth, Major Seventh, Augmented Ninth, Perfect Eleventh, e.g. `Cmaj11sus2(♯9)`
    case maj11_sus2_sharp9
    
    /// Suspended 2nd Add Thirteen: Major Second, Perfect Fifth, Major Thirteenth, e.g. `Csus2(add13)`
    case sus2_add13

    /// Suspended 4th Add Thirteen: Major Fourth, Perfect Fifth, Major Sixth, e.g. `Csus4(add13)`
    case sus4_add13
    
    /// Suspended 2nd Add Flat Thirteen: Major Second, Perfect Fifth, Minor Thirteenth, e.g. `Csus2(add♭13)`
    case sus2_addFlat13

    /// Suspended 4th Add Flat Thirteen: Major Second, Perfect Fifth, Minor Thirteenth, e.g. `Csus4(add♭13)`
    case sus4_addFlat13
    
    /// Suspended Second Add Sharp Thirteen: Major Second, Perfect Fifth, Augmented Thirteenth, e.g. `Csus2(add#13)`
    case sus2_addSharp13

    /// Suspended Fourth Add Sharp Thirteen: Perfect Fourth, Perfect Fifth, Augmented Thirteenth, e.g. `Csus4(add#13)`
    case sus4_addSharp13

    public var intervals: [Interval] {
        switch self {
            case .major:                       
                return [.M3, .P5]
            case .minor:                       
                return [.m3, .P5]
            case .dim:                         
                return [.m3, .d5]
            case .flat5:                       
                return [.M3, .d5]
            case .aug:
                return [.M3, .A5]
            case .sus2:                        
                return [.M2, .P5]
            case .sus4:
                return [.P4, .P5]
            case .maj6:
                return [.M3, .P5, .M6]
            case .min6:
                return [.m3, .P5, .M6]
            case .sus2_add13:
                return [.M2, .P5, .M13]
            case .sus4_add13:
                return [.P4, .P5, .M13]
            case .sus2_addFlat13:
                return [.M2, .P5, .m13]
            case .sus4_addFlat13:
                return [.P4, .P5, .m13]
            case .maj7:
                return [.M3, .P5, .M7]
            case .dom7:
                return [.M3, .P5, .m7]
            case .min7:
                return [.m3, .P5, .m7]
            case .halfDim7:
                return [.m3, .d5, .m7]
            case .dim7:
                return [.m3, .d5, .d7]
            case .dom7_sus2:
                return [.M2, .P5, .m7]
            case .dom7_sus4:
                return [.P4, .P5, .m7]
            case .maj7_sharp5:
                return [.M3, .A5, .M7]
            case .min_maj7:
                return [.m3, .P5, .M7]
            case .maj7_flat5:
                return [.M3, .d5, .M7]
            case .dom7_flat5:
                return [.M3, .d5, .m7]
            case .dom7_sharp5:
                return [.M3, .A5, .m7]
            case .maj9:
                return [.M3, .P5, .M7, .M9]
            case .dom9:
                return [.M3, .P5, .m7, .M9]
            case .min9:
                return [.m3, .P5, .m7, .M9]
            case .halfDim9:
                return [.m3, .d5, .m7, .M9]
            case .halfDimFlat9:
                return [.m3, .d5, .m7, .m9]
            case .dim9:
                return [.m3, .d5, .d7, .M9]
            case .dimFlat9:
                return [.m3, .d5, .d7, .m9]
            case .dom9_sus4:
                return [.P4, .P5, .m7, .M9]
            case .dom7_flat9:
                return [.M3, .P5, .m7, .m9]
            case .dom7_sharp9:
                return [.M3, .P5, .m7, .A9]
            case .min_maj9:
                return [.m3, .P5, .M7, .M9]
            case .min_maj_flat9:
                return [.m3, .P5, .M7, .m9]
            case .min7_flat9:
                return [.m3, .P5, .m7, .m9]
            case .maj_add9:
                return [.M3, .P5, .M9]
            case .min_add9:
                return [.m3, .P5, .M9]
            case .dim_add9:
                return [.m3, .d5, .M9]
            case .aug_add9:
                return [.M3, .A5, .M9]
            case .maj_addFlat9:
                return [.M3, .P5, .m9]
            case .min_addFlat9:
                return [.m3, .P5, .m9]
            case .dim_addFlat9:
                return [.m3, .d5, .m9]
            case .aug_addFlat9:
                return [.M3, .A5, .m9]
            case .maj_addSharp9:
                return [.M3, .P5, .A9]
            case .min_addSharp9:
                return [.m3, .P5, .A9]
            case .dim_addSharp9:
                return [.m3, .d5, .A9]
            case .aug_addSharp9:
                return [.M3, .A5, .A9]
            case .maj_6_9:
                return [.M3, .P5, .M6, .M9]
            case .maj9_sharp5:
                return [.M3, .A5, .M7, .M9]
            case .maj9_flat5:
                return [.M3, .d5, .M7, .M9]
            case .dom9_flat5:
                return [.M3, .d5, .m7, .M9]
            case .dom9_sharp5:
                return [.M3, .A5, .m7, .M9]
            case .maj11:
                return [.M3, .P5, .M7, .M9, .P11]
            case .dom11:
                return [.M3, .P5, .m7, .M9, .P11]
            case .min11:
                return [.m3, .P5, .m7, .M9, .P11]
            case .halfDim11:
                return [.m3, .d5, .m7, .M9, .P11]
            case .dim11:
                return [.m3, .d5, .d7, .M9, .P11]
            case .maj11_flat5:
                return [.M3, .d5, .M7, .M9, .P11]
            case .maj11_sharp5:
                return [.M3, .A5, .M7, .M9, .P11]
            case .dom11_flat5:
                return [.M3, .d5, .m7, .M9, .P11]
            case .dom11_sharp5:
                return [.M3, .A5, .m7, .M9, .P11]
            case .maj9_sharp11:
                return [.M3, .P5, .M7, .M9, .A11]
            case .dom9_sharp11:
                return [.M3, .P5, .m7, .M9, .A11]
            case .min9_sharp11:
                return [.m3, .P5, .m7, .M9, .A11]
            case .maj9_flat5_sharp11:
                return [.M3, .d5, .M7, .M9, .A11]
            case .maj9_sharp5_sharp11:
                return [.M3, .A5, .M7, .M9, .A11]
            case .dom9_flat5_sharp11:
                return [.M3, .d5, .m7, .M9, .A11]
            case .dom9_sharp5_sharp11:
                return [.M3, .A5, .m7, .M9, .A11]
            case .maj7_flat9_sharp11:
                return [.M3, .P5, .M7, .m9, .A11]
            case .dom7_flat9_sharp11:
                return [.M3, .P5, .m7, .m9, .A11]
            case .min7_flat9_sharp11:
                return [.m3, .P5, .m7, .m9, .A11]
            case .dom7_sharp9_sharp11:
                return [.M3, .P5, .m7, .A9, .A11]
            case .min7_flat9_11:
                return [.m3, .P5, .m7, .m9, .P11]
            case .maj7_add11:
                return [.M3, .P5, .M7, .P11]
            case .maj7_addSharp11:
                return [.M3, .P5, .M7, .A11]
            case .dom7_add11:
                return [.M3, .P5, .m7, .P11]
            case .dom7_addSharp11:
                return [.M3, .P5, .m7, .A11]
            case .min7_add11:
                return [.m3, .P5, .m7, .P11]
            case .min7_addSharp11:
                return [.m3, .P5, .m7, .A11]
            case .halfDim7_add11:
                return [.m3, .d5, .m7, .P11]
            case .maj13:
                return [.M3, .P5, .M7, .M9, .P11, .M13]
            case .dom13:
                return [.M3, .P5, .m7, .M9, .P11, .M13]
            case .min13:
                return [.m3, .P5, .m7, .M9, .P11, .M13]
            case .halfDim13:
                return [.m3, .d5, .m7, .M9, .P11, .M13]
            case .min13_flat5:
                return [.m3, .d5, .m7, .M9, .P11, .M13]
            case .maj13_flat9:
                return [.M3, .P5, .M7, .m9, .P11, .M13]
            case .dom13_flat9:
                return [.M3, .P5, .m7, .m9, .P11, .M13]
            case .min13_flat9:
                return [.m3, .P5, .m7, .m9, .P11, .M13]
            case .min13_flat5_flat9:
                return [.m3, .d5, .m7, .m9, .P11, .M13]
            case .maj13_sharp9:
                return [.M3, .P5, .M7, .A9, .P11, .M13]
            case .dom13_sharp9:
                return [.M3, .P5, .m7, .A9, .P11, .M13]
            case .min13_sharp9:
                return [.m3, .P5, .m7, .A9, .P11, .M13]
            case .min13_flat5_sharp9:
                return [.m3, .d5, .m7, .A9, .P11, .M13]
            case .maj13_sharp11:
                return [.M3, .P5, .M7, .M9, .A11, .M13]
            case .dom13_sharp11:
                return [.M3, .P5, .m7, .M9, .A11, .M13]
            case .min13_sharp11:
                return [.m3, .P5, .m7, .M9, .A11, .M13]
            case .maj7_flat13:
                return [.M3, .P5, .M7, .M9, .P11, .m13]
            case .dom7_flat13:
                return [.M3, .P5, .m7, .M9, .P11, .m13]
            case .min7_flat13:
                return [.m3, .P5, .m7, .M9, .P11, .m13]
            case .halfDim7_flat13:
                return [.m3, .d5, .m7, .M9, .P11, .m13]
            case .maj7_flat9_flat13:
                return [.M3, .P5, .M7, .m9, .P11, .m13]
            case .dom7_flat9_flat13:
                return [.M3, .P5, .m7, .m9, .P11, .m13]
            case .min7_flat9_flat13:
                return [.m3, .P5, .m7, .m9, .P11, .m13]
            case .min7_flat5_flat9_flat13:
                return [.m3, .d5, .m7, .m9, .P11, .m13]
            case .maj7_sharp9_flat13:
                return [.M3, .P5, .M7, .A9, .P11, .m13]
            case .dom7_sharp9_flat13:
                return [.M3, .P5, .m7, .A9, .P11, .m13]
            case .min7_sharp9_flat13:
                return [.m3, .P5, .m7, .A9, .P11, .m13]
            case .min7_flat5_sharp9_flat13:
                return [.m3, .d5, .m7, .A9, .P11, .m13]
            case .maj7_flat9_sharp11_flat13:
                return [.M3, .P5, .M7, .m9, .A11, .m13]
            case .dom7_flat9_sharp11_flat13:
                return [.M3, .P5, .m7, .m9, .A11, .m13]
            case .min7_flat9_sharp11_flat13:
                return [.m3, .P5, .m7, .m9, .A11, .m13]
            case .min7_flat5_flat9_sharp11_flat13: 
                return [.m3, .d5, .m7, .m9, .A11, .m13]
            case .maj7_sharp9_sharp11_flat13:  
                return [.M3, .P5, .M7, .A9, .A11, .m13]
            case .dom7_sharp9_sharp11_flat13:
                return [.M3, .P5, .m7, .A9, .A11, .m13]
            case .min7_sharp9_sharp11_flat13:
                return [.m3, .P5, .m7, .A9, .A11, .m13]
            case .min7_flat5_sharp9_sharp11_flat13: 
                return [.m3, .d5, .m7, .A9, .A11, .m13]
            case .maj7_add13:                  
                return [.M3, .P5, .M7, .M13]
            case .dom7_add13:
                return [.M3, .P5, .m7, .M13]
            case .min7_add13:
                return [.m3, .P5, .m7, .M13]
            case .halfDim7_add13:
                return [.m3, .d5, .m7, .M13]
            case .maj7_addFlat13:
                return [.M3, .P5, .M7, .m13]
            case .dom7_addFlat13:
                return [.M3, .P5, .m7, .m13]
            case .min7_addFlat13:
                return [.m3, .P5, .m7, .m13]
            case .halfDim7_addFlat13:
                return [.m3, .d5, .m7, .m13]
            case .maj7_add9_add13:
                return [.M3, .P5, .M7, .M9, .M13]
            case .maj7_addFlat9_add13:
                return [.M3, .P5, .M7, .m9, .M13]
            case .maj7_addFlat9_addFlat13:
                return [.M3, .P5, .M7, .m9, .m13]
            case .min_flat13_flat9:
                return [.m3, .P5, .m7, .m9, .P11, .m13]
            case .min11_flat13:
                return [.m3, .P5, .m7, .M9, .P11, .m13]
            case .halfDim_flat13:
                return [.m3, .d5, .m7, .M9, .P11, .m13]
            case .dom13_flat5:
                return [.M3, .d5, .m7, .M9, .P11, .M13]
            case .dom13_sharp5:
                return [.M3, .A5, .m7, .M9, .P11, .M13]
            case .maj13_flat5:
                return [.M3, .d5, .M7, .M9, .P11, .M13]
            case .maj13_sharp5:
                return [.M3, .A5, .M7, .M9, .P11, .M13]
            case .dom13_flat9_sharp11:
                return [.M3, .P5, .m7, .m9, .A11, .M13]
            case .dom13_sharp9_sharp11:
                return [.M3, .P5, .m7, .A9, .A11, .M13]
            case .maj13_add11:
                return [.M3, .P5, .M7, .P11, .M13]
            case .dom13_add11:
                return [.M3, .P5, .m7, .P11, .M13]
            case .min13_add11:
                return [.m3, .P5, .m7, .P11, .M13]
            case .sus4_add9:                    
                return [.P4, .P5, .M9]
            case .sus2_add11:
                return [.M2, .P5, .P11]
            case .sus4_addFlat9:
                return [.P4, .P5, .m9]
            case .sus4_addSharp9:
                return [.P4, .P5, .A9]
            case .sus2_addSharp11:
                return [.M2, .P5, .A11]
            case .sus2_addSharp13:
                return [.M2, .P5, .A13]
            case .sus4_addSharp13:
                return [.P4, .P5, .A13]
            case .maj7_sus2:
                return [.M2, .P5, .M7]
            case .maj7_sus4:
                return [.P4, .P5, .M7]
            case .maj9_sus4:
                return [.P4, .P5, .M7, .M9]
            case .dom11_sus2:
                return [.M2, .P5, .m7, .P11]
            case .maj13_sus2:
                return [.M2, .P5, .M7, .P11, .M13]
            case .maj13_sus4:
                return [.P4, .P5, .M7, .M9, .M13]
            case .dom13_sus2:
                return [.M2, .P5, .m7, .P11, .M13]
            case .dom13_sus4:
                return [.P4, .P5, .m7, .M9, .M13]
            case .dom7_sus4_flat9:
                return [.P4, .P5, .m7, .m9]
            case .dom7_sus4_sharp9:
                return [.P4, .P5, .m7, .A9]
            case .dom7_sus2_sharp11:
                return [.M2, .P5, .m7, .A11]
            case .dom7_sus4_flat13:
                return [.P4, .P5, .m7, .m13]
            case .dom7_sus4_sharp13:
                return [.P4, .P5, .m7, .A13]
            case .dom9_sus4_flat13:
                return [.P4, .P5, .m7, .M9, .m13]
            case .dom9_sus4_sharp13:
                return [.P4, .P5, .m7, .M9, .A13]
            case .dom11_sus2_flat9:
                return [.M2, .P5, .m7, .m9, .P11]
            case .dom11_sus2_flat13:
                return [.M2, .P5, .m7, .M9, .P11, .m13]
            case .dom11_sus2_sharp13:
                return [.M2, .P5, .m7, .M9, .P11, .A13]
            case .dom13_sus4_flat9:
                return [.P4, .P5, .m7, .m9, .P11, .M13]
            case .dom13_sus4_sharp9:
                return [.P4, .P5, .m7, .A9, .P11, .M13]
            case .dom13_sus2_sharp11:
                return [.M2, .P5, .m7, .M9, .A11, .M13]
            case .maj7_sus4_flat9:
                return [.P4, .P5, .M7, .m9]
            case .maj7_sus4_sharp9:
                return [.P4, .P5, .M7, .A9]
            case .maj7_sus2_sharp11:
                return [.M2, .P5, .M7, .A11]
            case .maj9_sus4_flat13:
                return [.P4, .P5, .M7, .M9, .m13]
            case .maj9_sus4_sharp11:
                return [.P4, .P5, .M7, .M9, .A11]
            case .maj11_sus2_flat9:
                return [.M2, .P5, .M7, .m9, .P11]
            case .maj11_sus2_sharp9:
                return [.M2, .P5, .M7, .A9, .P11]
        }
    }
}

extension ChordType: CustomStringConvertible {
    /// Adornment to the Root NoteClass (letter+accidental) that defines the chord type
    public var description: String {
        switch self {
            case .major:                       return ""
            case .minor:                       return "m"
            case .dim:                         return "°"
            case .flat5:                       return "(♭5)"
            case .aug:                         return "⁺"
            case .sus2:                        return "sus2"
            case .sus4:                        return "sus4"
            case .maj6:                        return "6"
            case .min6:                        return "m6"
            case .sus2_add13:                  return "sus2(add13)"
            case .sus4_add13:                  return "sus4(add13)"
            case .halfDim7:                    return "ø7"
            case .dim7:                        return "°7"
            case .dom7:                        return "7"
            case .dom7_sus2:                   return "7sus2"
            case .dom7_sus4:                   return "7sus4"
            case .maj7:                        return "maj7"
            case .min7:                        return "m7"
            case .min_maj7:                    return "mMaj7"
            case .maj7_flat5:                  return "maj7(♭5)"
            case .maj7_sharp5:                 return "maj7(♯5)"
            case .dom7_flat5:                  return "7(♭5)"
            case .dom7_sharp5:                 return "7(♯5)"
            case .halfDimFlat9:                return "ø7(♭9)"
            case .dom9:                        return "9"
            case .dom9_sus4:                   return "9sus4"
            case .dom7_flat9:                  return "7(♭9)"
            case .dom7_sharp9:                 return "7(♯9)"
            case .maj9:                        return "maj9"
            case .min7_flat9:                  return "m7(♭9)"
            case .min9:                        return "m9"
            case .min_maj9:                    return "mMaj9"
            case .maj_add9:                    return "(add9)"
            case .min_add9:                    return "m(add9)"
            case .maj_6_9:                     return "6/9"
            case .maj9_flat5:                  return "maj9(♭5)"
            case .maj11:                       return "maj11"
            case .dom11:                       return "11"
            case .min11:                       return "m11"
            case .halfDim11:                   return "ø11"
            case .maj9_sharp11:                return "maj9(♯11)"
            case .maj9_sharp5:                 return "maj9(♯5)(♯11)"
            case .dom7_flat9_sharp11:          return "7(♭9)(♯11)"
            case .dom7_sharp9_sharp11:         return "7(♯9)(♯11)"
            case .min7_flat9_11:               return "m7(♭9)(11)"
            case .dom9_flat5:                  return "9(♭5)"
            case .dom9_sharp5:                 return "9(♯5)"
            case .dom9_sharp11:                return "9(♯11)"
            case .sus2_addFlat13:              return "sus2(add♭13)"
            case .sus4_addFlat13:              return "sus4(add♭13)"
            case .halfDim9:                    return "ø9"
            case .dim9:                        return "°9"
            case .dimFlat9:                    return "°(♭9)"
            case .min_maj_flat9:               return "mMaj(♭9)"
            case .dim_add9:                    return "°(add9)"
            case .aug_add9:                    return "+(add9)"
            case .maj_addFlat9:                return "(add♭9)"
            case .min_addFlat9:                return "m(add♭9)"
            case .dim_addFlat9:                return "°(add♭9)"
            case .aug_addFlat9:                return "+(add♭9)"
            case .maj_addSharp9:               return "(add♯9)"
            case .min_addSharp9:               return "m(add♯9)"
            case .dim_addSharp9:               return "°(add♯9)"
            case .aug_addSharp9:               return "+(add♯9)"
            case .dim11:                       return "°11"
            case .maj11_flat5:                 return "maj11(♭5)"
            case .maj11_sharp5:                return "maj11(♯5)"
            case .dom11_flat5:                 return "11(♭5)"
            case .dom11_sharp5:                return "11(♯5)"
            case .min9_sharp11:                return "m9(♯11)"
            case .maj9_flat5_sharp11:          return "maj9(♭5)(♯11)"
            case .maj9_sharp5_sharp11:         return "maj9(♯5)(♯11)"
            case .dom9_flat5_sharp11:          return "9(♭5)(♯11)"
            case .dom9_sharp5_sharp11:         return "9(♯5)(♯11)"
            case .maj7_flat9_sharp11:          return "maj7(♭9)(♯11)"
            case .min7_flat9_sharp11:          return "m7(♭9)(♯11)"
            case .maj7_add11:                  return "maj7(add11)"
            case .maj7_addSharp11:             return "maj7(add♯11)"
            case .dom7_add11:                  return "7(add11)"
            case .dom7_addSharp11:             return "7(add♯11)"
            case .min7_add11:                  return "m7(add11)"
            case .min7_addSharp11:             return "m7(add♯11)"
            case .halfDim7_add11:              return "ø7(add11)"
            case .maj13:                       return "maj13"
            case .dom13:                       return "13"
            case .min13:                       return "m13"
            case .halfDim13:                   return "ø13"
            case .min13_flat5:                 return "m13(♭5)"
            case .maj13_flat9:                 return "maj13(♭9)"
            case .dom13_flat9:                 return "13(♭9)"
            case .min13_flat9:                 return "m13(♭9)"
            case .min13_flat5_flat9:           return "m13(♭5)(♭9)"
            case .maj13_sharp9:                return "maj13(♯9)"
            case .dom13_sharp9:                return "13(♯9)"
            case .min13_sharp9:                return "m13(♯9)"
            case .min13_flat5_sharp9:          return "m13(♭5)(♯9)"
            case .maj13_sharp11:               return "maj13(♯11)"
            case .dom13_sharp11:               return "13(♯11)"
            case .min13_sharp11:               return "m13(♯11)"
            case .maj7_flat13:                 return "maj7(♭13)"
            case .dom7_flat13:                 return "7(♭13)"
            case .min7_flat13:                 return "m7(♭13)"
            case .halfDim7_flat13:             return "ø7(♭13)"
            case .maj7_flat9_flat13:           return "maj7(♭9)(♭13)"
            case .dom7_flat9_flat13:           return "7(♭9)(♭13)"
            case .min7_flat9_flat13:           return "m7(♭9)(♭13)"
            case .min7_flat5_flat9_flat13:     return "ø7(♭5)(♭9)(♭13)"
            case .maj7_sharp9_flat13:          return "maj7(♯9)(♭13)"
            case .dom7_sharp9_flat13:          return "7(♯9)(♭13)"
            case .min7_sharp9_flat13:          return "m7(♯9)(♭13)"
            case .min7_flat5_sharp9_flat13:    return "ø7(♭5)(♯9)(♭13)"
            case .maj7_flat9_sharp11_flat13:   return "maj7(♭9)(♯11)(♭13)"
            case .dom7_flat9_sharp11_flat13:   return "7(♭9)(♯11)(♭13)"
            case .min7_flat9_sharp11_flat13:   return "m7(♭9)(♯11)(♭13)"
            case .min7_flat5_flat9_sharp11_flat13: return "ø7(♭5)(♭9)(♯11)(♭13)"
            case .maj7_sharp9_sharp11_flat13:  return "maj7(♯9)(♯11)(♭13)"
            case .dom7_sharp9_sharp11_flat13:  return "7(♯9)(♯11)(♭13)"
            case .min7_sharp9_sharp11_flat13:  return "m7(♯9)(♯11)(♭13)"
            case .min7_flat5_sharp9_sharp11_flat13: return "ø7(♭5)(♯9)(♯11)(♭13)"
            case .maj7_add13:                  return "maj7(add13)"
            case .dom7_add13:                  return "7(add13)"
            case .min7_add13:                  return "m7(add13)"
            case .halfDim7_add13:              return "ø7(add13)"
            case .maj7_addFlat13:              return "maj7(add♭13)"
            case .dom7_addFlat13:              return "7(add♭13)"
            case .min7_addFlat13:              return "m7(add♭13)"
            case .halfDim7_addFlat13:          return "ø7(add♭13)"
            case .maj7_add9_add13:             return "maj7(add9)(add13)"
            case .maj7_addFlat9_add13:         return "maj7(add♭9)(add13)"
            case .maj7_addFlat9_addFlat13:     return "maj7(add♭9)(add♭13)"
            case .min_flat13_flat9:            return "m(♭13)(♭9)"
            case .min11_flat13:                return "m11(♭13)"
            case .halfDim_flat13:              return "ø(♭13)"
            case .dom13_flat5:                 return "13(♭5)"
            case .dom13_sharp5:                return "13(♯5)"
            case .maj13_flat5:                 return "maj13(♭5)"
            case .maj13_sharp5:                return "maj13(♯5)"
            case .dom13_flat9_sharp11:         return "13(♭9)(♯11)"
            case .dom13_sharp9_sharp11:        return "13(♯9)(♯11)"
            case .maj13_add11:                 return "maj13(add11)"
            case .dom13_add11:                 return "13(add11)"
            case .min13_add11:                 return "m13(add11)"
            case .sus4_add9:                   return "sus4(add9)"
            case .sus2_add11:                  return "sus2(add11)"
            case .sus4_addFlat9:               return "sus4(add♭9)"
            case .sus4_addSharp9:              return "sus4(add♯9)"
            case .sus2_addSharp11:             return "sus2(add♯11)"
            case .sus2_addSharp13:             return "sus2(add♯13)"
            case .sus4_addSharp13:             return "sus4(add♯13)"
            case .maj7_sus2:                   return "maj7sus2"
            case .maj7_sus4:                   return "maj7sus4"
            case .maj9_sus4:                   return "maj9sus4"
            case .dom11_sus2:                  return "11sus2"
            case .maj13_sus2:                  return "maj13sus2"
            case .maj13_sus4:                  return "maj13sus4"
            case .dom13_sus2:                  return "13sus2"
            case .dom13_sus4:                  return "13sus4"
            case .dom7_sus4_flat9:             return "7sus4(♭9)"
            case .dom7_sus4_sharp9:            return "7sus4(♯9)"
            case .dom7_sus2_sharp11:           return "7sus2(♯11)"
            case .dom7_sus4_flat13:            return "7sus4(♭13)"
            case .dom7_sus4_sharp13:           return "7sus4(♯13)"
            case .dom9_sus4_flat13:            return "9sus4(♭13)"
            case .dom9_sus4_sharp13:           return "9sus4(♯13)"
            case .dom11_sus2_flat9:            return "11sus2(♭9)"
            case .dom11_sus2_flat13:           return "11sus2(♭13)"
            case .dom11_sus2_sharp13:          return "11sus2(♯13)"
            case .dom13_sus4_flat9:            return "13sus4(♭9)"
            case .dom13_sus4_sharp9:           return "13sus4(♯9)"
            case .dom13_sus2_sharp11:          return "13sus2(♯11)"
            case .maj7_sus4_flat9:             return "maj7sus4(♭9)"
            case .maj7_sus4_sharp9:            return "maj7sus4(♯9)"
            case .maj7_sus2_sharp11:           return "maj7sus2(♯11)"
            case .maj9_sus4_flat13:            return "maj9sus4(♭13)"
            case .maj9_sus4_sharp11:           return "maj9sus4(♯11)"
            case .maj11_sus2_flat9:            return "maj11sus2(♭9)"
            case .maj11_sus2_sharp9:           return "maj11sus2(♯9)"
        }
    }

    /// Adornment to the Root NoteClass (letter+accidental) that defines the chord type
    /// using specialized Chord Symbol Fonts Norfolk or Pori from
    /// NotationExpress: https://www.notationcentral.com/product/norfolk-fonts-for-sibelius/
    public var chordFontDescription: String {
        switch self {
            case .major:                       return ""
            case .minor:                       return "m"
            case .dim:                         return "º"
            case .flat5:                       return "b5"
            case .aug:                         return "&"
            case .sus2:                        return "“2"
            case .sus4:                        return "“4"
            case .maj6:                        return "6"
            case .min6:                        return "m6"
            case .sus2_add13:                  return "6“2"
            case .sus4_add13:                  return "6“4"
            case .halfDim7:                    return "Ø7"
            case .dim7:                        return "º7"
            case .dom7:                        return "7"
            case .dom7_sus2:                   return "7“2"
            case .dom7_sus4:                   return "7“4"
            case .maj7:                        return "^7"
            case .min7:                        return "m7"
            case .min_maj7:                    return "m^7"
            case .maj7_flat5:                  return "^7b5"
            case .maj7_sharp5:                 return "^7#5"
            case .dom7_flat5:                  return "7b5"
            case .dom7_sharp5:                 return "7#5"
            case .halfDimFlat9:                return "Ø9"
            case .dom9:                        return "9"
            case .dom9_sus4:                   return "9“4"
            case .dom7_flat9:                  return "7b9"
            case .dom7_sharp9:                 return "7#9"
            case .maj9:                        return "^9"
            case .min7_flat9:                  return "m7b9"
            case .min9:                        return "m9"
            case .min_maj9:                    return "m^9"
            case .maj_add9:                    return "@9"
            case .min_add9:                    return "m@9"
            case .maj_6_9:                     return "%"
            case .maj9_flat5:                  return "^9b5"
            case .maj11:                       return "^11"
            case .dom11:                       return "11"
            case .min11:                       return "m11"
            case .halfDim11:                   return "Ø11"
            case .maj9_sharp11:                return "^9#11"
            case .maj9_sharp5:                 return "^9#5"
            case .dom7_flat9_sharp11:          return "7âÅ"
            case .dom7_sharp9_sharp11:         return "7åÅ"
            case .min7_flat9_11:               return "m7b9(11)"
            case .dom9_flat5:                  return "9b5"
            case .dom9_sharp5:                 return "9#5"
            case .dom9_sharp11:                return "9#11"
            case .sus2_addFlat13:              return "“2b13"
            case .sus4_addFlat13:              return "“4b13"
            case .halfDim9:                    return "Ø9"
            case .dim9:                        return "º9"
            case .dimFlat9:                    return "ºb9"
            case .min_maj_flat9:               return "m^b9"
            case .dim_add9:                    return "º@9"
            case .aug_add9:                    return "&@9"
            case .maj_addFlat9:                return "@b9"
            case .min_addFlat9:                return "m@b9"
            case .dim_addFlat9:                return "º@b9"
            case .aug_addFlat9:                return "&@b9"
            case .maj_addSharp9:               return "@#9"
            case .min_addSharp9:               return "m@#9"
            case .dim_addSharp9:               return "º@#9"
            case .aug_addSharp9:               return "&@#9"
            case .dim11:                       return "º11"
            case .maj11_flat5:                 return "^11b5"
            case .maj11_sharp5:                return "^11#5"
            case .dom11_flat5:                 return "11b5"
            case .dom11_sharp5:                return "11#5"
            case .min9_sharp11:                return "m9#11"
            case .maj9_flat5_sharp11:          return "^9b5#11"
            case .maj9_sharp5_sharp11:         return "^9#5#11"
            case .dom9_flat5_sharp11:          return "9b5#11"
            case .dom9_sharp5_sharp11:         return "9#5#11"
            case .maj7_flat9_sharp11:          return "^7b9#11"
            case .min7_flat9_sharp11:          return "m7b9#11"
            case .maj7_add11:                  return "^7@11"
            case .maj7_addSharp11:             return "^7@#11"
            case .dom7_add11:                  return "7@11"
            case .dom7_addSharp11:             return "7@#11"
            case .min7_add11:                  return "m7@11"
            case .min7_addSharp11:             return "m7@#11"
            case .halfDim7_add11:              return "Ø7@11"
            case .maj13:                       return "^13"
            case .dom13:                       return "13"
            case .min13:                       return "m13"
            case .halfDim13:                   return "Ø13"
            case .min13_flat5:                 return "m13b5"
            case .maj13_flat9:                 return "^13b9"
            case .dom13_flat9:                 return "13b9"
            case .min13_flat9:                 return "m13b9"
            case .min13_flat5_flat9:           return "m13b5b9"
            case .maj13_sharp9:                return "^13#9"
            case .dom13_sharp9:                return "13#9"
            case .min13_sharp9:                return "m13#9"
            case .min13_flat5_sharp9:          return "m13b5#9"
            case .maj13_sharp11:               return "^13#11"
            case .dom13_sharp11:               return "13#11"
            case .min13_sharp11:               return "m13#11"
            case .maj7_flat13:                 return "^7b13"
            case .dom7_flat13:                 return "7b13"
            case .min7_flat13:                 return "m7b13"
            case .halfDim7_flat13:             return "Ø7b13"
            case .maj7_flat9_flat13:           return "^7b9b13"
            case .dom7_flat9_flat13:           return "7b9b13"
            case .min7_flat9_flat13:           return "m7b9b13"
            case .min7_flat5_flat9_flat13:     return "Ø7b9b13"
            case .maj7_sharp9_flat13:          return "^7#9b13"
            case .dom7_sharp9_flat13:          return "7#9b13"
            case .min7_sharp9_flat13:          return "m7#9b13"
            case .min7_flat5_sharp9_flat13:    return "Ø7#9b13"
            case .maj7_flat9_sharp11_flat13:   return "^7b9#11b13"
            case .dom7_flat9_sharp11_flat13:   return "7b9#11b13"
            case .min7_flat9_sharp11_flat13:   return "m7b9#11b13"
            case .min7_flat5_flat9_sharp11_flat13: return "Ø7b9#11b13"
            case .maj7_sharp9_sharp11_flat13:  return "^7#9#11b13"
            case .dom7_sharp9_sharp11_flat13:  return "7#9#11b13"
            case .min7_sharp9_sharp11_flat13:  return "m7#9#11b13"
            case .min7_flat5_sharp9_sharp11_flat13: return "Ø7#9#11b13"
            case .maj7_add13:                  return "^7@13"
            case .dom7_add13:                  return "7@13"
            case .min7_add13:                  return "m7@13"
            case .halfDim7_add13:              return "Ø7@13"
            case .maj7_addFlat13:              return "^7@b13"
            case .dom7_addFlat13:              return "7@b13"
            case .min7_addFlat13:              return "m7@b13"
            case .halfDim7_addFlat13:          return "Ø7@b13"
            case .maj7_add9_add13:             return "^7@9@13"
            case .maj7_addFlat9_add13:         return "^7@b9@13"
            case .maj7_addFlat9_addFlat13:     return "^7@b9@b13"
            case .min_flat13_flat9:            return "mb13b9"
            case .min11_flat13:                return "m11b13"
            case .halfDim_flat13:              return "Øb13"
            case .dom13_flat5:                 return "13b5"
            case .dom13_sharp5:                return "13#5"
            case .maj13_flat5:                 return "^13b5"
            case .maj13_sharp5:                return "^13#5"
            case .dom13_flat9_sharp11:         return "13b9#11"
            case .dom13_sharp9_sharp11:        return "13#9#11"
            case .maj13_add11:                 return "^13@11"
            case .dom13_add11:                 return "13@11"
            case .min13_add11:                 return "m13@11"
            case .sus4_add9:                   return "“4@9"
            case .sus2_add11:                  return "“2@11"
            case .sus4_addFlat9:               return "“4@b9"
            case .sus4_addSharp9:              return "“4@#9"
            case .sus2_addSharp11:             return "“2@#11"
            case .sus2_addSharp13:             return "“2@#13"
            case .sus4_addSharp13:             return "“4@#13"
            case .maj7_sus2:                   return "^7“2"
            case .maj7_sus4:                   return "^7“4"
            case .maj9_sus4:                   return "^9“4"
            case .dom11_sus2:                  return "11“2"
            case .maj13_sus2:                  return "^13“2"
            case .maj13_sus4:                  return "^13“4"
            case .dom13_sus2:                  return "13“2"
            case .dom13_sus4:                  return "13“4"
            case .dom7_sus4_flat9:             return "7“4b9"
            case .dom7_sus4_sharp9:            return "7“4#9"
            case .dom7_sus2_sharp11:           return "7“2#11"
            case .dom7_sus4_flat13:            return "7“4b13"
            case .dom7_sus4_sharp13:           return "7“4#13"
            case .dom9_sus4_flat13:            return "9“4b13"
            case .dom9_sus4_sharp13:           return "9“4#13"
            case .dom11_sus2_flat9:            return "11“2b9"
            case .dom11_sus2_flat13:           return "11“2b13"
            case .dom11_sus2_sharp13:          return "11“2#13"
            case .dom13_sus4_flat9:            return "13“4b9"
            case .dom13_sus4_sharp9:           return "13“4#9"
            case .dom13_sus2_sharp11:          return "13“2#11"
            case .maj7_sus4_flat9:             return "^7“4b9"
            case .maj7_sus4_sharp9:            return "^7“4#9"
            case .maj7_sus2_sharp11:           return "^7“2#11"
            case .maj9_sus4_flat13:            return "^9“4b13"
            case .maj9_sus4_sharp11:           return "^9“4#11"
            case .maj11_sus2_flat9:            return "^11“2b9"
            case .maj11_sus2_sharp9:           return "^11“2#9"
        }
    }
}
