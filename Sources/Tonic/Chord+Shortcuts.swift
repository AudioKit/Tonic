// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

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

    /// C Suspended Fourth - Csus4
    static var Csus4 = Chord(.C, type: .suspendedFourthTriad)

    /// D Suspended Fourth - Dsus4
    static var Dsus4 = Chord(.D, type: .suspendedFourthTriad)

    /// E Suspended Fourth - Esus4
    static var Esus4 = Chord(.E, type: .suspendedFourthTriad)

    /// F Suspended Fourth - Fsus4
    static var Fsus4 = Chord(.F, type: .suspendedFourthTriad)

    /// G Suspended Fourth - Gsus4
    static var Gsus4 = Chord(.G, type: .suspendedFourthTriad)

    /// A Suspended Fourth - Asus4
    static var Asus4 = Chord(.A, type: .suspendedFourthTriad)

    /// B Suspended Fourth - Bsus4
    static var Bsus4 = Chord(.B, type: .suspendedFourthTriad)

    /// C Suspended Second - Csus2
    static var Csus2 = Chord(.C, type: .suspendedSecondTriad)

    /// D Suspended Second - Dsus2
    static var Dsus2 = Chord(.D, type: .suspendedSecondTriad)

    /// E Suspended Second - Esus2
    static var Esus2 = Chord(.E, type: .suspendedSecondTriad)

    /// F Suspended Second - Fsus2
    static var Fsus2 = Chord(.F, type: .suspendedSecondTriad)

    /// G Suspended Second - Gsus2
    static var Gsus2 = Chord(.G, type: .suspendedSecondTriad)

    /// A Suspended Second - Asus2
    static var Asus2 = Chord(.A, type: .suspendedSecondTriad)

    /// B Suspended Second - Bsus2
    static var Bsus2 = Chord(.B, type: .suspendedSecondTriad)

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

    /// C♯ Suspended Fourth - C♯sus4
    static var Cssus4 = Chord(.Cs, type: .suspendedFourthTriad)

    /// D♯ Suspended Fourth - D♯sus4
    static var Dssus4 = Chord(.Ds, type: .suspendedFourthTriad)

    /// E♯ Suspended Fourth - E♯sus4
    static var Essus4 = Chord(.Es, type: .suspendedFourthTriad)

    /// F♯ Suspended Fourth - F♯sus4
    static var Fssus4 = Chord(.Fs, type: .suspendedFourthTriad)

    /// G♯ Suspended Fourth - G♯sus4
    static var Gssus4 = Chord(.Gs, type: .suspendedFourthTriad)

    /// A♯ Suspended Fourth - A♯sus4
    static var Assus4 = Chord(.As, type: .suspendedFourthTriad)

    /// B♯ Suspended Fourth - B♯sus4
    static var Bssus4 = Chord(.Bs, type: .suspendedFourthTriad)

    /// C♯ Suspended Second - C♯sus2
    static var Cssus2 = Chord(.Cs, type: .suspendedSecondTriad)

    /// D♯ Suspended Second - D♯sus2
    static var Dssus2 = Chord(.Ds, type: .suspendedSecondTriad)

    /// E♯ Suspended Second - E♯sus2
    static var Essus2 = Chord(.Es, type: .suspendedSecondTriad)

    /// F♯ Suspended Second - F♯sus2
    static var Fssus2 = Chord(.Fs, type: .suspendedSecondTriad)

    /// G♯ Suspended Second - G♯sus2
    static var Gssus2 = Chord(.Gs, type: .suspendedSecondTriad)

    /// A♯ Suspended Second - A♯sus2
    static var Assus2 = Chord(.As, type: .suspendedSecondTriad)

    /// B♯ Suspended Second - B♯sus2
    static var Bssus2 = Chord(.Bs, type: .suspendedSecondTriad)

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

    /// C♭ Suspended Fourth - C♭sus4
    static var Cbsus4 = Chord(.Cb, type: .suspendedFourthTriad)

    /// D♭ Suspended Fourth - D♭sus4
    static var Dbsus4 = Chord(.Db, type: .suspendedFourthTriad)

    /// E♭ Suspended Fourth - E♭sus4
    static var Ebsus4 = Chord(.Eb, type: .suspendedFourthTriad)

    /// F♭ Suspended Fourth - F♭sus4
    static var Fbsus4 = Chord(.Fb, type: .suspendedFourthTriad)

    /// G♭ Suspended Fourth - G♭sus4
    static var Gbsus4 = Chord(.Gb, type: .suspendedFourthTriad)

    /// A♭ Suspended Fourth - A♭sus4
    static var Absus4 = Chord(.Ab, type: .suspendedFourthTriad)

    /// B♭ Suspended Fourth - B♭sus4
    static var Bbsus4 = Chord(.Bb, type: .suspendedFourthTriad)

    /// C♭ Suspended Fourth - C♭sus2
    static var Cbsus2 = Chord(.Cb, type: .suspendedSecondTriad)

    /// D♭ Suspended Fourth - D♭sus2
    static var Dbsus2 = Chord(.Db, type: .suspendedSecondTriad)

    /// E♭ Suspended Fourth - E♭sus2
    static var Ebsus2 = Chord(.Eb, type: .suspendedSecondTriad)

    /// F♭ Suspended Fourth - F♭sus2
    static var Fbsus2 = Chord(.Fb, type: .suspendedSecondTriad)

    /// G♭ Suspended Fourth - G♭sus2
    static var Gbsus2 = Chord(.Gb, type: .suspendedSecondTriad)

    /// A♭ Suspended Fourth - A♭sus2
    static var Absus2 = Chord(.Ab, type: .suspendedSecondTriad)

    /// B♭ Suspended Fourth - B♭sus2
    static var Bbsus2 = Chord(.Bb, type: .suspendedSecondTriad)
}
