import Foundation

public extension Scale {
    // Borrowed from Cem Olcay's MusicTheory: https://github.com/cemolcay/MusicTheory/blob/master/Sources/MusicTheory/ScaleType.swift

    /// Major scale
    static let major = Scale(intervals: Scale.ionian.intervals, description: "Major")

    /// Minor scale
    static let minor = Scale(intervals: Scale.aeolian.intervals, description: "Minor")

    /// Harmonic minor scale
    static let harmonicMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .M7], description: "Harmonic Minor")

    /// Melodic minor scale
    static let melodicMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .M7], description: "Melodic Minor")

    /// Pentatonic major scale
    static let pentatonicMajor = Scale(intervals: [.M2, .M3, .P5, .M6], description: "Pentatonic Major")

    /// Pentatonic minor scale
    static let pentatonicMinor = Scale(intervals: [.m3, .P4, .P5, .m7], description: "Pentatonic Minor")

    /// Pentatonic blues scale
    static let blues = Scale(intervals: [.m3, .P4, .d5, .P5, .m7], description: "Pentatonic Blues")

    /// Pentatonic neutral scale
    static let pentatonicNeutral = Scale(intervals: [.M2, .P4, .P5, .m7], description: "Pentatonic Neutral")

    /// Ionian scale
    static let ionian = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .M7], description: "Ionian")

    /// Aeolian scale
    static let aeolian = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .m7], description: "Aeolian")

    /// Dorian scale
    static let dorian = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .m7], description: "Dorian")

    /// Mixolydian scale
    static let mixolydian = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .m7], description: "Mixolydian")

    /// Phrygian scale
    static let phrygian = Scale(intervals: [.m2, .m3, .P4, .P5, .m6, .m7], description: "Phrygian")

    /// Lydian scale
    static let lydian = Scale(intervals: [.M2, .M3, .A4, .P5, .M6, .M7], description: "Lydian")

    /// Locrian scale
    static let locrian = Scale(intervals: [.m2, .m3, .P4, .d5, .m6, .m7], description: "Locrian")

    /// Half diminished scale
    static let halfDiminished = Scale(intervals: [.m2, .m3, .M3, .d5, .P5, .M6, .m7], description: "Half Diminished")

    /// Whole diminished scale
    static let wholeDiminished = Scale(intervals: [.M2, .m3, .P4, .d5, .m6, .M6, .M7], description: "Whole Diminished")

    /// Whole scale
    static let whole = Scale(intervals: [.M2, .M3, .d5, .m6, .m7], description: "Whole")

    /// Augmented scale
    static let augmented = Scale(intervals: [.m3, .M3, .P5, .m6, .M7], description: "Augmented")

    /// Chromatic scale
    static let chromatic = Scale(intervals: [.m2, .M2, .m3, .M3, .P4, .d5, .P5, .m6, .M6, .m7, .M7], description: "Chromatic")

    /// Roumanian minor scale
    static let romanianMinor = Scale(intervals: [.M2, .m3, .d5, .P5, .M6, .m7], description: "Romanian Minor")

    /// Spanish gypsy scale
    static let spanishGypsy = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .m7], description: "Spanish Gypsy")

    /// Diatonic scale
    static let diatonic = Scale(intervals: [.M2, .M3, .P5, .M6], description: "Diatonic")

    /// Double harmonic scale
    static let doubleHarmonic = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Double Harmonic")

    /// Eight tone spanish scale
    static let eightToneSpanish = Scale(intervals: [.m2, .m3, .M3, .P4, .d5, .m6, .m7], description: "Eight Tone Spanish")

    /// Enigmatic scale
    static let enigmatic = Scale(intervals: [.m2, .M3, .A4, .A5, .A6, .M7], description: "Enigmatic")

    /// Leading whole tone scale
    static let leadingWholeTone = Scale(intervals: [.M2, .M3, .d5, .m6, .M6, .m7], description: "Leading Whole Tone")

    /// Lydian augmented scale
    static let lydianAugmented = Scale(intervals: [.M2, .M3, .A4, .A5, .M6, .M7], description: "Lydian Augmented")

    /// Neopolitan major scale
    static let neopolitanMajor = Scale(intervals: [.m2, .m3, .P4, .P5, .M6, .M7], description: "Neopolitan Major")

    /// Neopolitan minor scale
    static let neopolitanMinor = Scale(intervals: [.m2, .m3, .P4, .P5, .m6, .m7], description: "Neopolitan Minor")

    /// Pelog scale
    static let pelog = Scale(intervals: [.m2, .m3, .d5, .m7, .M7], description: "Pelog")

    /// Prometheus scale
    static let prometheus = Scale(intervals: [.M2, .M3, .A4, .M6, .m7], description: "Prometheus")

    /// Prometheus neopolitan scale
    static let prometheusNeopolitan = Scale(intervals: [.m2, .M3, .d5, .M6, .m7], description: "Prometheus Neopolitan")

    /// Six tone symmetrical scale
    static let sixToneSymmetrical = Scale(intervals: [.m2, .M3, .P4, .m6, .M6], description: "Six Tone Symmetrical")

    /// Super locrian scale
    static let superLocrian = Scale(intervals: [.m2, .m3, .M3, .d5, .m6, .m7], description: "Super Locrian")

    /// Lydian minor scale
    static let lydianMinor = Scale(intervals: [.M2, .M3, .d5, .P5, .m6, .m7], description: "Lydian Minor")

    /// Lydian diminished scale
    static let lydianDiminished = Scale(intervals: [.M2, .m3, .d5, .P5, .m6, .m7], description: "Lydian Diminished")

    /// Nine tone scale
    static let nineTone = Scale(intervals: [.M2, .m3, .M3, .d5, .P5, .m6, .M6, .M7], description: "Nine Tone")

    /// Auxiliary diminished scale
    static let auxiliaryDiminished = Scale(intervals: [.M2, .m3, .P4, .d5, .m6, .M6, .M7], description: "Auxiliary Diminished")

    /// Auxiliary augmaneted scale
    static let auxiliaryAugmented = Scale(intervals: [.M2, .M3, .d5, .m6, .m7], description: "Auxiliary Augmented")

    /// Auxiliary diminished blues scale
    static let auxiliaryDimBlues = Scale(intervals: [.m2, .m3, .M3, .d5, .P5, .M6, .m7], description: "Auxiliary Diminished Blues")

    /// Major locrian scale
    static let majorLocrian = Scale(intervals: [.M2, .M3, .P4, .d5, .m6, .m7], description: "Major Locrian")

    /// Overtone scale
    static let overtone = Scale(intervals: [.M2, .M3, .d5, .P5, .M6, .m7], description: "Overtone")

    /// Diminished whole tone scale
    static let diminishedWholeTone = Scale(intervals: [.m2, .m3, .M3, .d5, .m6, .m7], description: "Diminished Whole Tone")

    /// Dominant seventh scale
    static let dominant7th = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .m7], description: "Dominant 7th")

    /// Altered scale
    static let altered = Scale(intervals: [.m2, .m3, .M3, .d5, .m6, .m7], description: "Altered")

    /// Arabian scale
    static let arabian = Scale(intervals: [.M2, .M3, .P4, .d5, .m6, .m7], description: "Arabian")

    /// Ionian augmented scale
    static let ionianAugmented = Scale(intervals: [.M2, .M3, .P4, .m6, .M6, .M7], description: "Ionian Augmented")

    /// Balinese scale
    static let balinese = Scale(intervals: [.m2, .m3, .P5, .m6], description: "Balinese")

    /// Byzantine scale
    static let byzantine = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Byzantine")

    /// Chinese scale
    static let chinese = Scale(intervals: [.M3, .d5, .P5, .M7], description: "Chinese")

    /// Dorian ♯4 scale
    static let dorianSharp4 = Scale(intervals: [.M2, .m3, .d5, .P5, .M6, .m7], description: "Dorian ♯4")

    /// Dorian ♭2 scale
    static let dorianFlat2 = Scale(intervals: [.m2, .m3, .P4, .P5, .M6, .m7], description: "Dorian ♭2")

    /// Hindu scale
    static let hindu = Scale(intervals: [.M2, .M3, .P4, .P5, .m6, .m7], description: "Hindu")

    /// Hirajoshi scale
    static let hirajoshi = Scale(intervals: [.M2, .m3, .P5, .m6], description: "Hirajoshi")

    /// Hungarian major scale
    static let hungarianMajor = Scale(intervals: [.m3, .M3, .d5, .P5, .M6, .m7], description: "Hungarian Major")

    /// Hungarian minor scale
    static let hungarianMinor = Scale(intervals: [.M2, .m3, .A4, .P5, .m6, .M7], description: "Hungarian Minor")

    /// Ichikosucho scale
    static let ichikosucho = Scale(intervals: [.M2, .M3, .P4, .d5, .P5, .M6, .M7], description: "Ichikosucho")

    /// Kumoi scale
    static let kumoi = Scale(intervals: [.M2, .m3, .P5, .M6], description: "Kumoi")

    /// Locrian 2 scale
    static let locrian2 = Scale(intervals: [.M2, .m3, .P4, .d5, .m6, .m7], description: "Locrian 2")

    /// Locrian 3 scale
    static let locrian3 = Scale(intervals: [.m2, .M3, .P4, .d5, .m6, .m7], description: "Locrian 3")

    /// Locrian 6 scale
    static let locrian6 = Scale(intervals: [.m2, .m3, .P4, .d5, .M6, .m7], description: "Locrian 6")

    /// Lydian ♯2 scale
    static let lydianSharp2 = Scale(intervals: [.m3, .M3, .d5, .P5, .M6, .M7], description: "Lydian ♯2")

    /// Lydian ♭7 scale
    static let lydianFlat7 = Scale(intervals: [.M2, .M3, .d5, .P5, .M6, .m7], description: "Lydian ♭7")

    /// Phrygian Major scale
    static let phrygianMajor = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .m7], description: "Phrygian Major")

    /// Mixolydian ♭6 scale
    static let mixolydianFlat6 = Scale(intervals: [.M2, .M3, .P4, .P5, .m6, .m7], description: "Mixolydian ♭6")

    /// Mohammedan scale
    static let mohammedan = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .M7], description: "Mohammedan")

    /// Mongolian scale
    static let mongolian = Scale(intervals: [.M2, .M3, .P5, .M6], description: "Mongolian")

    /// Natural minor scale
    static let naturalMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .m6, .m7], description: "Natural Minor")

    /// Neopolitan scale
    static let neopolitan = Scale(intervals: [.m2, .m3, .P4, .P5, .m6, .M7], description: "Neopolitan")

    /// Persian scale
    static let persian = Scale(intervals: [.m2, .M3, .P4, .d5, .m6, .M7], description: "Persian")

    /// Purvi theta scale
    static let purviTheta = Scale(intervals: [.m2, .M3, .d5, .P5, .m6, .M7], description: "Purvi Theta")

    /// Todi theta scale
    static let todiTheta = Scale(intervals: [.m2, .m3, .d5, .P5, .m6, .M7], description: "Todi Theta")

    /// Major bebop scale
    static let majorBebop = Scale(intervals: [.M2, .M3, .P4, .P5, .m6, .M6, .M7], description: "Major Bebop")

    /// Minor bebop scale
    static let minorBebop = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .m7, .M7], description: "Minor Bebop")

    /// Bebop dominant scale
    static let bebopDominant = Scale(intervals: [.M2, .M3, .P4, .P5, .M6, .m7, .M7], description: "Bebop Dominant")

    /// Tritone scale
    static let tritone = Scale(intervals: [.m2, .M3, .d5, .P5, .m7], description: "Tritone")

    /// Insen scale
    static let insen = Scale(intervals: [.m2, .P4, .P5, .m7], description: "Insen")

    /// Istrian scale
    static let istrian = Scale(intervals: [.m2, .m3, .d4, .d5, .P5], description: "Istrian")

    /// Gypsy scale
    static let gypsy = Scale(intervals: [.M2, .m3, .A4, .P5, .m6, .m7], description: "Gypsy")

    /// Iwato scale
    static let iwato = Scale(intervals: [.m2, .P4, .d5, .m7], description: "Iwato")

    /// Pfluke scale
    static let pfluke = Scale(intervals: [.M2, .m3, .A4, .P5, .M6, .M7], description: "Pfluke")

    /// Ukrainian dorian scale
    static let ukrainianDorian = Scale(intervals: [.M2, .m3, .A4, .P5, .M6, .m7], description: "Ukrainian Dorian")

    /// Yo scale
    static let yo = Scale(intervals: [.m3, .P4, .P5, .m7], description: "Yo")

    /// Algerian scale
    static let algerian = Scale(intervals: [.M2, .m3, .A4, .P5, .m6, .M7], description: "Algerian")

    /// Flamenco scale
    static let flamenco = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Flamenco")

    /// Hawaiian scale
    static let hawaiian = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .M7], description: "Hawaiian")

    /// Maqam scale
    static let maqam = Scale(intervals: [.m2, .M3, .P4, .P5, .m6, .M7], description: "Maqam")

    /// Oriental scale
    static let oriental = Scale(intervals: [.m2, .M3, .P4, .d5, .M6, .m7], description: "Oriental")

    /// Jazz melodic minor scale
    static let jazzMelodicMinor = Scale(intervals: [.M2, .m3, .P4, .P5, .M6, .M7], description: "Jazz Melodic Minor")

    /// Lydian augmented ♯6 scale
    static let lydianAugmentedSharp6 = Scale(intervals: [.M2, .M3, .d5, .m6, .m7, .M7], description: "Lydian Augmented ♯6")

    /// Lydian augmented ♯2 scale
    static let lydianAugmentedSharp2 = Scale(intervals: [.m3, .M3, .d5, .m6, .M6, .M7], description: "Lydian Augmented ♯2")

    /// Dorian ♭5 scale
    static let dorianFlat5 = Scale(intervals: [.M2, .m3, .P4, .d5, .M6, .m7], description: "Dorian ♭5")

    /// Phrygian ♭4 scale
    static let phrygianFlat4 = Scale(intervals: [.m2, .m3, .M3, .P5, .m6, .m7], description: "Phrygian ♭4")

    /// Lydian ♭3 scale
    static let lydianFlat3 = Scale(intervals: [.M2, .m3, .d5, .P5, .M6, .M7], description: "Lydian ♭3")

    /// Lydian ♭6 scale
    static let lydianFlat6 = Scale(intervals: [.M2, .M3, .d5, .P5, .m6, .m7], description: "Lydian ♭6")

    /// Lydian ♯6 scale
    static let lydianSharp6 = Scale(intervals: [.M2, .M3, .d5, .P5, .m7, .M7], description: "Lydian ♯6")

    /// Lydian ♯2 ♯6 scale
    static let lydianSharp2Sharp6 = Scale(intervals: [.m3, .M3, .d5, .P5, .m7, .M7], description: "Lydian ♯2 ♯6")

    /// Mixolydian ♭2 scale
    static let mixolydianFlat2 = Scale(intervals: [.m2, .M3, .P4, .P5, .M6, .m7], description: "Mixolydian ♭2")

    /// Mixolydian augmented scale
    static let mixolydianAugmented = Scale(intervals: [.M2, .M3, .P4, .m6, .M6, .m7], description: "Mixolydian Augmented")

    /// Locrian diminished scale
    static let locrianDiminished = Scale(intervals: [.m2, .m3, .P4, .d5, .m6, .M6], description: "Locrian Diminished")

    /// Locrian diminished ♭♭3 scale
    static let locrianDiminishedFlatFlat3 = Scale(intervals: [.m2, .P4, .d5, .m6, .M6], description: "Locrian Diminished ♭♭3")

    /// Ionian ♯2 scale
    static let ionianSharp2 = Scale(intervals: [.m3, .M3, .P4, .P5, .M6, .M7], description: "Ionian ♯2")

    /// Super locrian Diminished ♭♭3 scale
    static let superLocrianDiminshedFlatFlat3 = Scale(intervals: [.m2, .M2, .M3, .d5, .m6, .M6], description: "Super Locrian Diminished ♭♭3")

    /// Ultraphrygian scale
    static let ultraphrygian = Scale(intervals: [.m2, .m3, .M3, .P5, .m6, .M6], description: "Ultraphrygian")

    /// Ionian Augmented ♯2 scale
    static let ionianAugmentedSharp2 = Scale(intervals: [.m3, .M3, .P4, .m6, .M6, .M7], description: "Ionian Augmented ♯2")

    /// Major blues hexatonic scale
    static let majorBluesHexatonic = Scale(intervals: [.M2, .m3, .M3, .P5, .M6], description: "Major Blues Hexatonic")

    /// Minor blues hexatonic scale
    static let minorBluesHexatonic = Scale(intervals: [.m3, .P4, .d5, .P5, .m7], description: "Minor Blues Hexatonic")

    /// Man gong scale
    static let manGong = Scale(intervals: [.m3, .P4, .m6, .m7], description: "Man Gong")

    /// Ritsusen scale
    static let ritsusen = Scale(intervals: [.M2, .P4, .P5, .M6], description: "Ritsusen")
}
