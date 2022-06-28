import Foundation

extension Scale {

    // Borrowed from Cem Olcay's MusicTheory: https://github.com/cemolcay/MusicTheory/blob/master/Sources/MusicTheory/ScaleType.swift

    /// Major scale
    public static let major = Scale(intervals: Scale.ionian.intervals, description: "Major")

    /// Minor scale
    public static let minor = Scale(intervals: Scale.aeolian.intervals, description: "Minor")

    /// Harmonic minor scale
    public static let harmonicMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .M7], description: "Harmonic Minor")

    /// Melodic minor scale
    public static let melodicMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .M7], description: "Melodic Minor")

    /// Pentatonic major scale
    public static let pentatonicMajor = Scale(intervals: [.M2, .M3, .P5, .M6], description: "Pentatonic Major")

    /// Pentatonic minor scale
    public static let pentatonicMinor = Scale(intervals: [.m3, .P4, .P5, .m7], description: "Pentatonic Minor")

    /// Pentatonic blues scale
    public static let blues = Scale(intervals: [.m3, .P4, .d5, .P5, .m7], description: "Pentatonic Blues")

    /// Pentatonic neutral scale
    public static let pentatonicNeutral = Scale(intervals: [.M2, .P4, .P5, .m7], description: "Pentatonic Neutral")

    /// Ionian scale
    public static let ionian = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .M7], description: "Ionian")

    /// Aeolian scale
    public static let aeolian = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .m7], description: "Aeolian")

    /// Dorian scale
    public static let dorian = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .m7], description: "Dorian")

    /// Mixolydian scale
    public static let mixolydian = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .m7], description: "Mixolydian")

    /// Phrygian scale
    public static let phrygian = Scale(intervals: [.m2, .m3, .P4, .P5, .m6, .m7], description: "Phrygian")

    /// Lydian scale
    public static let lydian = Scale(intervals: [.M2, .M3, .A4, .P5, .M6, .M7], description: "Lydian")

    /// Locrian scale
    public static let locrian = Scale(intervals: [.m2, .m3, .P4, .d5, .m6, .m7], description: "Locrian")

    /// Half diminished scale
    public static let halfDiminished = Scale(intervals: [.m2, .m3, .M3, .d5, .P5, .M6, .m7], description: "Half Diminished")

    /// Whole diminished scale
    public static let wholeDiminished = Scale(intervals: [.M2, .m3, .P4, .d5, .m6, .M6, .M7], description: "Whole Diminished")

    /// Whole scale
    public static let whole = Scale(intervals: [.M2, .M3, .d5, .m6, .m7], description: "Whole")

    /// Augmented scale
    public static let augmented = Scale(intervals: [.m3, .M3, .P5, .m6, .M7], description: "Augmented")

    /// Chromatic scale
    public static let chromatic = Scale(intervals: [.m2, .M2, .m3, .M3, .P4, .d5, .P5, .m6, .M6, .m7, .M7], description: "Chromatic")

    /// Roumanian minor scale
    public static let romanianMinor = Scale(intervals: [.M2, .m3, .d5, .P5, .M6, .m7], description: "Romanian Minor")

    /// Spanish gypsy scale
    public static let spanishGypsy = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .m7], description: "Spanish Gypsy")

    /// Diatonic scale
    public static let diatonic = Scale(intervals: [.M2, .M3, .P5, .M6], description: "Diatonic")

    /// Dobule harmonic scale
    public static let doubleHarmonic = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Double Harmonic")

    /// Eight tone spanish scale
    public static let eightToneSpanish = Scale(intervals: [.m2, .m3, .M3, .P4, .d5, .m6, .m7], description: "Eight Tone Spanish")

    /// Enigmatic scale
    public static let enigmatic = Scale(intervals: [.m2, .M3, .A4, .A5, .A6, .M7], description: "Enigmatic")

    /// Leading whole tone scale
    public static let leadingWholeTone = Scale(intervals: [.M2, .M3, .d5, .m6, .M6, .m7], description: "Leading Whole Tone")

    /// Lydian augmented scale
    public static let lydianAugmented = Scale(intervals: [.M2, .M3, .A4, .A5, .M6, .M7], description: "Lydian Augmented")

    /// Neopolitan major scale
    public static let neopolitanMajor = Scale(intervals: [.m2, .m3, .P4, .P5, .M6, .M7], description: "Neopolitan Major")

    /// Neopolitan minor scale
    public static let neopolitanMinor = Scale(intervals: [.m2, .m3, .P4, .P5, .m6, .m7], description: "Neopolitan Minor")

    /// Pelog scale
    public static let pelog = Scale(intervals: [.m2, .m3, .d5, .m7, .M7], description: "Pelog")

    /// Prometheus scale
    public static let prometheus = Scale(intervals: [.M2, .M3, .A4, .M6, .m7], description: "Prometheus")

    /// Prometheus neopolitan scale
    public static let prometheusNeopolitan = Scale(intervals: [.m2, .M3, .d5, .M6, .m7], description: "Prometheus Neopolitan")

    /// Six tone symmetrical scale
    public static let sixToneSymmetrical = Scale(intervals: [.m2, .M3, .P4, .m6, .M6], description: "Six Tone Symmetrical")

    /// Super locrian scale
    public static let superLocrian = Scale(intervals: [.m2, .m3, .M3, .d5, .m6, .m7], description: "Super Locrian")

    /// Lydian minor scale
    public static let lydianMinor = Scale(intervals: [.M2, .M3, .d5, .P5, .m6, .m7], description: "Lydian Minor")

    /// Lydian diminished scale
    public static let lydianDiminished = Scale(intervals: [.M2, .m3, .d5, .P5, .m6, .m7], description: "Lydian Diminished")

    /// Nine tone scale
    public static let nineTone = Scale(intervals: [.M2, .m3, .M3, .d5, .P5, .m6, .M6, .M7], description: "Nine Tone")

    /// Auxiliary diminished scale
    public static let auxiliaryDiminished = Scale(intervals: [.M2, .m3, .P4, .d5, .m6, .M6, .M7], description: "Auxiliary Diminished")

    /// Auxiliary augmaneted scale
    public static let auxiliaryAugmented = Scale(intervals: [.M2, .M3, .d5, .m6, .m7], description: "Auxiliary Augmented")

    /// Auxiliary diminished blues scale
    public static let auxiliaryDimBlues = Scale(intervals: [.m2, .m3, .M3, .d5, .P5, .M6, .m7], description: "Auxiliary Diminished Blues")

    /// Major locrian scale
    public static let majorLocrian = Scale(intervals: [.M2, .M3, .P4, .d5, .m6, .m7], description: "Major Locrian")

    /// Overtone scale
    public static let overtone = Scale(intervals: [.M2, .M3, .d5, .P5, .M6, .m7], description: "Overtone")

    /// Diminished whole tone scale
    public static let diminishedWholeTone = Scale(intervals: [.m2, .m3, .M3, .d5, .m6, .m7], description: "Diminished Whole Tone")

    /// Dominant seventh scale
    public static let dominant7th = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .m7], description: "Dominant 7th")

    /// Altered scale
    public static let altered = Scale(intervals: [.m2, .m3, .M3, .d5, .m6, .m7], description: "Altered")

    /// Arabian scale
    public static let arabian = Scale(intervals: [.M2, .M3, .P4, .d5, .m6, .m7], description: "Arabian")

    /// Ionian augmented scale
    public static let ionianAugmented = Scale(intervals: [.M2, .M3, .P4, .m6, .M6, .M7], description: "Ionian Augmented")

    /// Balinese scale
    public static let balinese = Scale(intervals: [.m2, .m3, .P5, .m6], description: "Balinese")

    /// Byzantine scale
    public static let byzantine = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Byzantine")

    /// Chinese scale
    public static let chinese = Scale(intervals: [.M3, .d5, .P5, .M7], description: "Chinese")

    /// Dorian #4 scale
    public static let dorianSharp4 = Scale(intervals: [.M2, .m3, .d5, .P5, .M6, .m7], description: "Dorian #4")

    /// Dorian b2 scale
    public static let dorianFlat2 = Scale(intervals: [.m2, .m3, .P4, .P5, .M6, .m7], description: "Dorian b2")

    /// Hindu scale
    public static let hindu = Scale(intervals: [.M2, .M3, .P4, .P5, .m6, .m7], description: "Hindu")

    /// Hirajoshi scale
    public static let hirajoshi = Scale(intervals: [.M2, .m3, .P5, .m6], description: "Hirajoshi")

    /// Hungarian major scale
    public static let hungarianMajor = Scale(intervals: [.m3, .M3, .d5, .P5, .M6, .m7], description: "Hungarian Major")

    /// Hungarian minor scale
    public static let hungarianMinor = Scale(intervals: [.M2, .m3, .A4, .P5, .m6, .M7], description: "Hungarian Minor")

    /// Ichikosucho scale
    public static let ichikosucho = Scale(intervals: [.M2, .M3, .P4, .d5, .P5, .M6, .M7], description: "Ichikosucho")

    /// Kumoi scale
    public static let kumoi = Scale(intervals: [.M2, .m3, .P5, .M6], description: "Kumoi")

    /// Locrian 2 scale
    public static let locrian2 = Scale(intervals: [.M2, .m3, .P4, .d5, .m6, .m7], description: "Locrian 2")

    /// Locrian 3 scale
    public static let locrian3 = Scale(intervals: [.m2, .M3, .P4, .d5, .m6, .m7], description: "Locrian 3")

    /// Locrian 6 scale
    public static let locrian6 = Scale(intervals: [.m2, .m3, .P4, .d5, .M6, .m7], description: "Locrian 6")

    /// Lydian #2 scale
    public static let lydianSharp2 = Scale(intervals: [.m3, .M3, .d5, .P5, .M6, .M7], description: "Lydian #2")

    /// Lydian b7 scale
    public static let lydianFlat7 = Scale(intervals: [.M2, .M3, .d5, .P5, .M6, .m7], description: "Lydian b7")

    /// Phrygian Major scale
    public static let phrygianMajor = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .m7], description: "Phrygian Major")

    /// Mixolydian b6 scale
    public static let mixolydianFlat6 = Scale(intervals: [.M2, .M3, .P4, .P5, .m6, .m7], description: "Mixolydian b6")

    /// Mohammedan scale
    public static let mohammedan = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .M7], description: "Mohammedan")

    /// Mongolian scale
    public static let mongolian = Scale(intervals: [.M2, .M3, .P5, .M6], description: "Mongolian")

    /// Natural minor scale
    public static let naturalMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .m7], description: "Natural Minor")

    /// Neopolitan scale
    public static let neopolitan = Scale(intervals: [.m2, .m3, .P4, .P5, .m6, .M7], description: "Neopolitan")

    /// Persian scale
    public static let persian = Scale(intervals: [.m2, .M3, .P4, .d5, .m6, .M7], description: "Persian")

    /// Purvi theta scale
    public static let purviTheta = Scale(intervals: [.m2, .M3, .d5, .P5, .m6, .M7], description: "Purvi Theta")

    /// Todi theta scale
    public static let todiTheta = Scale(intervals: [.m2, .m3, .d5, .P5, .m6, .M7], description: "Todi Theta")

    /// Major bebop scale
    public static let majorBebop = Scale(intervals: [.M2, .M3, .P4, .P5, .m6, .M6, .M7], description: "Major Bebop")

    /// Minor bebop scale
    public static let minorBebop = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .m7, .M7], description: "Minor Bebop")

    /// Bebop dominant scale
    public static let bebopDominant = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .m7, .M7], description: "Bebop Dominant")

    /// Tritone scale
    public static let tritone = Scale(intervals: [.m2, .M3, .d5, .P5, .m7], description: "Tritone")

    /// Insen scale
    public static let insen = Scale(intervals: [.m2, .P4, .P5, .m7], description: "Insen")

    /// Istrian scale
    public static let istrian = Scale(intervals: [.m2, .m3, .d4, .d5, .P5], description: "Istrian")

    /// Gypsy scale
    public static let gypsy = Scale(intervals: [.M2, .m3, .A4, .P5, .m6, .m7], description: "Gypsy")

    /// Iwato scale
    public static let iwato = Scale(intervals: [.m2, .P4, .d5, .m7], description: "Iwato")

    /// Pfluke scale
    public static let pfluke = Scale(intervals: [.M2, .m3, .A4, .P5, .M6, .M7], description: "Pfluke")

    /// Ukrainian dorian scale
    public static let ukrainianDorian = Scale(intervals: [.M2, .m3, .A4, .P5, .M6, .m7], description: "Ukrainian Dorian")

    /// Yo scale
    public static let yo = Scale(intervals: [.m3, .P4, .P5, .m7], description: "Yo")

    /// Algerian scale
    public static let algerian = Scale(intervals: [.M2, .m3, .A4, .P5, .m6, .M7], description: "Algerian")

    /// Flamenco scale
    public static let flamenco = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Flamenco")

    /// Hawaiian scale
    public static let hawaiian = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .M7], description: "Hawaiian")

    /// Maqam scale
    public static let maqam = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Maqam")

    /// Oriental scale
    public static let oriental = Scale(intervals: [.m2, .M3, .P4, .d5, .M6, .m7], description: "Oriental")

    /// Jazz melodic minor scale
    public static let jazzMelodicMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .M7], description: "Jazz Melodic Minor")

    /// Lydian augmented #6 scale
    public static let lydianAugmentedSharp6 = Scale(intervals: [.M2, .M3, .d5, .m6, .m7, .M7], description: "Lydian Augmented #6")

    /// Lydian augmented #2 scale
    public static let lydianAugmentedSharp2 = Scale(intervals: [.m3, .M3, .d5, .m6, .M6, .M7], description: "Lydian Augmented #2")

    /// Dorian b5 scale
    public static let dorianFlat5 = Scale(intervals: [.M2, .m3, .P4, .d5, .M6, .m7], description: "Dorian b5")

    /// Phrygian b4 scale
    public static let phrygianFlat4 = Scale(intervals: [.m2, .m3, .M3, .P5, .m6, .m7], description: "Phrygian b4")

    /// Lydian b3 scale
    public static let lydianFlat3 = Scale(intervals: [.M2, .m3, .d5, .P5, .M6, .M7], description: "Lydian b3")

    /// Lydian b6 scale
    public static let lydianFlat6 = Scale(intervals: [.M2, .M3, .d5, .P5, .m6, .m7], description: "Lydian b6")

    /// Lydian #6 scale
    public static let lydianSharp6 = Scale(intervals: [.M2, .M3, .d5, .P5, .m7, .M7], description: "Lydian #6")

    /// Lydian #2 #6 scale
    public static let lydianSharp2Sharp6 = Scale(intervals: [.m3, .M3, .d5, .P5, .m7, .M7], description: "Lydian #2 #6")

    /// Mixolydian b2 scale
    public static let mixolydianFlat2 = Scale(intervals: [.m2, .M3, .P4, .P5, .M6, .m7], description: "Mixolydian b2")

    /// Mixolydian augmented scale
    public static let mixolydianAugmented = Scale(intervals: [.M2, .M3, .P4, .m6, .M6, .m7], description: "Mixolydian Augmented")

    /// Locrian diminished scale
    public static let locrianDiminished = Scale(intervals: [.m2, .m3, .P4, .d5, .m6, .M6], description: "Locrian Diminished")

    /// Locrian diminished bb3 scale
    public static let locrianDiminishedFlatFlat3 = Scale(intervals: [.m2, .P4, .d5, .m6, .M6], description: "Locrian Diminished bb3")

    /// Ionian #2 scale
    public static let ionianSharp2 = Scale(intervals: [.m3, .M3, .P4, .P5, .M6, .M7], description: "Ionian #2")

    /// Super locrian Diminished bb3 scale
    public static let superLocrianDiminshedFlatFlat3 = Scale(intervals: [.m2, .M2, .M3, .d5, .m6, .M6], description: "Super Locrian Diminished bb3")

    /// Ultraphrygian scale
    public static let ultraphrygian = Scale(intervals: [.m2, .m3, .M3, .P5, .m6, .M6], description: "Ultraphrygian")

    /// Ionian Augmented #2 scale
    public static let ionianAugmentedSharp2 = Scale(intervals: [.m3, .M3, .P4, .m6, .M6, .M7], description: "Ionian Augmented #2")

    /// Major blues hexatonic scale
    public static let majorBluesHexatonic = Scale(intervals: [.M2, .m3, .M3, .P5, .M6], description: "Major Blues Hexatonic")

    /// Minor blues hexatonic scale
    public static let minorBluesHexatonic = Scale(intervals: [.m3, .P4, .d5, .P5, .m7], description: "Minor Blues Hexatonic")

    /// Man gong scale
    public static let manGong = Scale(intervals: [.m3, .P4, .m6, .m7], description: "Man Gong")

    /// Ritsusen scale
    public static let ritsusen = Scale(intervals: [.M2, .P4, .P5, .M6], description: "Ritsusen")

}
