import Foundation

public extension Chord {
    // MARK: - Natural Major chords

    /// C Major
    static var C = Chord(.C, type: .majorTriad)

    /// D Major
    static var D = Chord(.D, type: .majorTriad)

    /// E Major
    static var E = Chord(.E, type: .majorTriad)

    /// F Major
    static var F = Chord(.F, type: .majorTriad)

    /// G Major
    static var G = Chord(.G, type: .majorTriad)

    /// A Major
    static var A = Chord(.A, type: .majorTriad)

    /// B Major
    static var B = Chord(.B, type: .majorTriad)

    // MARK: - Natural Minor chords

    /// C Minor
    static var Cm = Chord(.C, type: .minorTriad)

    /// D Minor
    static var Dm = Chord(.D, type: .minorTriad)

    /// E Minor
    static var Em = Chord(.E, type: .minorTriad)

    /// F Minor
    static var Fm = Chord(.F, type: .minorTriad)

    /// G Minor
    static var Gm = Chord(.G, type: .minorTriad)

    /// A Minor
    static var Am = Chord(.A, type: .minorTriad)

    /// B Minor
    static var Bm = Chord(.B, type: .minorTriad)

    // MARK: - Natural Diminished chords

    /// C Diminished - C°
    static var Cdim = Chord(.C, type: .diminishedTriad)

    /// D Diminished - D°
    static var Ddim = Chord(.D, type: .diminishedTriad)

    /// E Diminished - E°
    static var Edim = Chord(.E, type: .diminishedTriad)

    /// F Diminished - F°
    static var Fdim = Chord(.F, type: .diminishedTriad)

    /// G Diminished - G°
    static var Gdim = Chord(.G, type: .diminishedTriad)

    /// A Diminished - A°
    static var Adim = Chord(.A, type: .diminishedTriad)

    /// B Diminished - B°
    static var Bdim = Chord(.B, type: .diminishedTriad)

    // MARK: - Natural Augmented chords

    /// C Augmented - C⁺
    static var Caug = Chord(.C, type: .augmentedTriad)

    /// D Augmented - D⁺
    static var Daug = Chord(.D, type: .augmentedTriad)

    /// E Augmented - E⁺
    static var Eaug = Chord(.E, type: .augmentedTriad)

    /// F Augmented - F⁺
    static var Faug = Chord(.F, type: .augmentedTriad)

    /// G Augmented - G⁺
    static var Gaug = Chord(.G, type: .augmentedTriad)

    /// A Augmented - A⁺
    static var Aaug = Chord(.A, type: .augmentedTriad)

    /// B Augmented - B⁺
    static var Baug = Chord(.B, type: .augmentedTriad)

    // MARK: - Natural Suspended chords

    /// C Suspended - Csus (Csus4)
    static var Csus = Chord(.C, type: .suspendedTriad)

    /// D Suspended - Dsus (Dsus4)
    static var Dsus = Chord(.D, type: .suspendedTriad)

    /// E Suspended - Esus (Esus4)
    static var Esus = Chord(.E, type: .suspendedTriad)

    /// F Suspended - Fsus (Fsus4)
    static var Fsus = Chord(.F, type: .suspendedTriad)

    /// G Suspended - Gsus (Gsus4)
    static var Gsus = Chord(.G, type: .suspendedTriad)

    /// A Suspended - Asus (Asus4)
    static var Asus = Chord(.A, type: .suspendedTriad)

    /// B Suspended - Bsus (Bsus4)
    static var Bsus = Chord(.B, type: .suspendedTriad)

    // MARK: - Sharp Major chords

    /// C♯ Major
    static var Cs = Chord(.Cs, type: .majorTriad)

    /// D♯ Major
    static var Ds = Chord(.Ds, type: .majorTriad)

    /// E♯ Major
    static var Es = Chord(.Es, type: .majorTriad)

    /// F♯ Major
    static var Fs = Chord(.Fs, type: .majorTriad)

    /// G♯ Major
    static var Gs = Chord(.Gs, type: .majorTriad)

    /// A♯ Major
    static var As = Chord(.As, type: .majorTriad)

    /// B♯ Major
    static var Bs = Chord(.Bs, type: .majorTriad)

    // MARK: - Sharp Minor chords

    /// C♯ Minor
    static var Csm = Chord(.Cs, type: .minorTriad)

    /// D♯ Minor
    static var Dsm = Chord(.Ds, type: .minorTriad)

    /// E♯ Minor
    static var Esm = Chord(.Es, type: .minorTriad)

    /// F♯ Minor
    static var Fsm = Chord(.Fs, type: .minorTriad)

    /// G♯ Minor
    static var Gsm = Chord(.Gs, type: .minorTriad)

    /// A♯ Minor
    static var Asm = Chord(.As, type: .minorTriad)

    /// B♯ Minor
    static var Bsm = Chord(.Bs, type: .minorTriad)

    // MARK: - Sharp Diminished chords

    /// C♯ Diminished - C♯°
    static var Csdim = Chord(.Cs, type: .diminishedTriad)

    /// D♯ Diminished - D♯°
    static var Dsdim = Chord(.Ds, type: .diminishedTriad)

    /// E♯ Diminished - E♯°
    static var Esdim = Chord(.Es, type: .diminishedTriad)

    /// F♯ Diminished - F♯°
    static var Fsdim = Chord(.Fs, type: .diminishedTriad)

    /// G♯ Diminished - G♯°
    static var Gsdim = Chord(.Gs, type: .diminishedTriad)

    /// A♯ Diminished - A♯°
    static var Asdim = Chord(.As, type: .diminishedTriad)

    /// B♯ Diminished - B♯°
    static var Bsdim = Chord(.Bs, type: .diminishedTriad)

    // MARK: - Sharp Suspended chords

    /// C♯ Susended - C♯sus (C♯sus4)
    static var Cssus = Chord(.Cs, type: .suspendedTriad)

    /// D♯ Susended - D♯sus (D♯sus4)
    static var Dssus = Chord(.Ds, type: .suspendedTriad)

    /// E♯ Susended - E♯sus (E♯sus4)
    static var Essus = Chord(.Es, type: .suspendedTriad)

    /// F♯ Susended - F♯sus (F♯sus4)
    static var Fssus = Chord(.Fs, type: .suspendedTriad)

    /// G♯ Susended - G♯sus (G♯sus4)
    static var Gssus = Chord(.Gs, type: .suspendedTriad)

    /// A♯ Susended - A♯sus (A♯sus4)
    static var Assus = Chord(.As, type: .suspendedTriad)

    /// B♯ Susended - B♯sus (B♯sus4)
    static var Bssus = Chord(.Bs, type: .suspendedTriad)

    // MARK: - Flat Major chords

    /// C♭ Major
    static var Cb = Chord(.Cb, type: .majorTriad)

    /// D♭ Major
    static var Db = Chord(.Db, type: .majorTriad)

    /// E♭ Major
    static var Eb = Chord(.Eb, type: .majorTriad)

    /// F♭ Major
    static var Fb = Chord(.Fb, type: .majorTriad)

    /// G♭ Major
    static var Gb = Chord(.Gb, type: .majorTriad)

    /// A♭ Major
    static var Ab = Chord(.Ab, type: .majorTriad)

    /// B♭ Major
    static var Bb = Chord(.Bb, type: .majorTriad)

    // MARK: - Flat Minor chords

    /// C♭ Minor
    static var Cbm = Chord(.Cb, type: .minorTriad)

    /// D♭ Minor
    static var Dbm = Chord(.Db, type: .minorTriad)

    /// E♭ Minor
    static var Ebm = Chord(.Eb, type: .minorTriad)

    /// F♭ Minor
    static var Fbm = Chord(.Fb, type: .minorTriad)

    /// G♭ Minor
    static var Gbm = Chord(.Gb, type: .minorTriad)

    /// A♭ Minor
    static var Abm = Chord(.Ab, type: .minorTriad)

    /// B♭ Minor
    static var Bbm = Chord(.Bb, type: .minorTriad)

    // MARK: - Flat Diminished chords

    /// C♭ Diminished - C♭°
    static var Cbdim = Chord(.Cb, type: .diminishedTriad)

    /// D♭ Diminished - D♭°
    static var Dbdim = Chord(.Db, type: .diminishedTriad)

    /// E♭ Diminished - E♭°
    static var Ebdim = Chord(.Eb, type: .diminishedTriad)

    /// F♭ Diminished - F♭°
    static var Fbdim = Chord(.Fb, type: .diminishedTriad)

    /// G♭ Diminished - G♭°
    static var Gbdim = Chord(.Gb, type: .diminishedTriad)

    /// A♭ Diminished - A♭°
    static var Abdim = Chord(.Ab, type: .diminishedTriad)

    /// B♭ Diminished - B♭°
    static var Bbdim = Chord(.Bb, type: .diminishedTriad)

    // MARK: - Flat Suspended chords

    /// C♭ Suspended - C♭sus (C♭sus4)
    static var Cbsus = Chord(.Cb, type: .suspendedTriad)

    /// D♭ Suspended - D♭sus (D♭sus4)
    static var Dbsus = Chord(.Db, type: .suspendedTriad)

    /// E♭ Suspended - E♭sus (E♭sus4)
    static var Ebsus = Chord(.Eb, type: .suspendedTriad)

    /// F♭ Suspended - F♭sus (F♭sus4)
    static var Fbsus = Chord(.Fb, type: .suspendedTriad)

    /// G♭ Suspended - G♭sus (G♭sus4)
    static var Gbsus = Chord(.Gb, type: .suspendedTriad)

    /// A♭ Suspended - A♭sus (A♭sus4)
    static var Absus = Chord(.Ab, type: .suspendedTriad)

    /// B♭ Suspended - B♭sus (B♭sus4)
    static var Bbsus = Chord(.Bb, type: .suspendedTriad)
}
