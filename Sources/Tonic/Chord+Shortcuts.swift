// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

public extension Chord {
    // MARK: - Natural Major chords

    /// C Major
    static var C = Chord(.C, type: .major)

    /// D Major
    static var D = Chord(.D, type: .major)

    /// E Major
    static var E = Chord(.E, type: .major)

    /// F Major
    static var F = Chord(.F, type: .major)

    /// G Major
    static var G = Chord(.G, type: .major)

    /// A Major
    static var A = Chord(.A, type: .major)

    /// B Major
    static var B = Chord(.B, type: .major)

    // MARK: - Natural Minor chords

    /// C Minor
    static var Cm = Chord(.C, type: .minor)

    /// D Minor
    static var Dm = Chord(.D, type: .minor)

    /// E Minor
    static var Em = Chord(.E, type: .minor)

    /// F Minor
    static var Fm = Chord(.F, type: .minor)

    /// G Minor
    static var Gm = Chord(.G, type: .minor)

    /// A Minor
    static var Am = Chord(.A, type: .minor)

    /// B Minor
    static var Bm = Chord(.B, type: .minor)

    // MARK: - Natural Diminished chords

    /// C Diminished - C°
    static var Cdim = Chord(.C, type: .dim)

    /// D Diminished - D°
    static var Ddim = Chord(.D, type: .dim)

    /// E Diminished - E°
    static var Edim = Chord(.E, type: .dim)

    /// F Diminished - F°
    static var Fdim = Chord(.F, type: .dim)

    /// G Diminished - G°
    static var Gdim = Chord(.G, type: .dim)

    /// A Diminished - A°
    static var Adim = Chord(.A, type: .dim)

    /// B Diminished - B°
    static var Bdim = Chord(.B, type: .dim)

    // MARK: - Natural Augmented chords

    /// C Augmented - C⁺
    static var Caug = Chord(.C, type: .aug)

    /// D Augmented - D⁺
    static var Daug = Chord(.D, type: .aug)

    /// E Augmented - E⁺
    static var Eaug = Chord(.E, type: .aug)

    /// F Augmented - F⁺
    static var Faug = Chord(.F, type: .aug)

    /// G Augmented - G⁺
    static var Gaug = Chord(.G, type: .aug)

    /// A Augmented - A⁺
    static var Aaug = Chord(.A, type: .aug)

    /// B Augmented - B⁺
    static var Baug = Chord(.B, type: .aug)

    // MARK: - Natural Suspended chords

    /// C Suspended Fourth - Csus4
    static var Csus4 = Chord(.C, type: .sus4)

    /// D Suspended Fourth - Dsus4
    static var Dsus4 = Chord(.D, type: .sus4)

    /// E Suspended Fourth - Esus4
    static var Esus4 = Chord(.E, type: .sus4)

    /// F Suspended Fourth - Fsus4
    static var Fsus4 = Chord(.F, type: .sus4)

    /// G Suspended Fourth - Gsus4
    static var Gsus4 = Chord(.G, type: .sus4)

    /// A Suspended Fourth - Asus4
    static var Asus4 = Chord(.A, type: .sus4)

    /// B Suspended Fourth - Bsus4
    static var Bsus4 = Chord(.B, type: .sus4)

    /// C Suspended Second - Csus2
    static var Csus2 = Chord(.C, type: .sus2)

    /// D Suspended Second - Dsus2
    static var Dsus2 = Chord(.D, type: .sus2)

    /// E Suspended Second - Esus2
    static var Esus2 = Chord(.E, type: .sus2)

    /// F Suspended Second - Fsus2
    static var Fsus2 = Chord(.F, type: .sus2)

    /// G Suspended Second - Gsus2
    static var Gsus2 = Chord(.G, type: .sus2)

    /// A Suspended Second - Asus2
    static var Asus2 = Chord(.A, type: .sus2)

    /// B Suspended Second - Bsus2
    static var Bsus2 = Chord(.B, type: .sus2)

    // MARK: - Sharp Major chords

    /// C♯ Major
    static var Cs = Chord(.Cs, type: .major)

    /// D♯ Major
    static var Ds = Chord(.Ds, type: .major)

    /// E♯ Major
    static var Es = Chord(.Es, type: .major)

    /// F♯ Major
    static var Fs = Chord(.Fs, type: .major)

    /// G♯ Major
    static var Gs = Chord(.Gs, type: .major)

    /// A♯ Major
    static var As = Chord(.As, type: .major)

    /// B♯ Major
    static var Bs = Chord(.Bs, type: .major)

    // MARK: - Sharp Minor chords

    /// C♯ Minor
    static var Csm = Chord(.Cs, type: .minor)

    /// D♯ Minor
    static var Dsm = Chord(.Ds, type: .minor)

    /// E♯ Minor
    static var Esm = Chord(.Es, type: .minor)

    /// F♯ Minor
    static var Fsm = Chord(.Fs, type: .minor)

    /// G♯ Minor
    static var Gsm = Chord(.Gs, type: .minor)

    /// A♯ Minor
    static var Asm = Chord(.As, type: .minor)

    /// B♯ Minor
    static var Bsm = Chord(.Bs, type: .minor)

    // MARK: - Sharp Diminished chords

    /// C♯ Diminished - C♯°
    static var Csdim = Chord(.Cs, type: .dim)

    /// D♯ Diminished - D♯°
    static var Dsdim = Chord(.Ds, type: .dim)

    /// E♯ Diminished - E♯°
    static var Esdim = Chord(.Es, type: .dim)

    /// F♯ Diminished - F♯°
    static var Fsdim = Chord(.Fs, type: .dim)

    /// G♯ Diminished - G♯°
    static var Gsdim = Chord(.Gs, type: .dim)

    /// A♯ Diminished - A♯°
    static var Asdim = Chord(.As, type: .dim)

    /// B♯ Diminished - B♯°
    static var Bsdim = Chord(.Bs, type: .dim)

    // MARK: - Sharp Suspended chords

    /// C♯ Suspended Fourth - C♯sus4
    static var Cssus4 = Chord(.Cs, type: .sus4)

    /// D♯ Suspended Fourth - D♯sus4
    static var Dssus4 = Chord(.Ds, type: .sus4)

    /// E♯ Suspended Fourth - E♯sus4
    static var Essus4 = Chord(.Es, type: .sus4)

    /// F♯ Suspended Fourth - F♯sus4
    static var Fssus4 = Chord(.Fs, type: .sus4)

    /// G♯ Suspended Fourth - G♯sus4
    static var Gssus4 = Chord(.Gs, type: .sus4)

    /// A♯ Suspended Fourth - A♯sus4
    static var Assus4 = Chord(.As, type: .sus4)

    /// B♯ Suspended Fourth - B♯sus4
    static var Bssus4 = Chord(.Bs, type: .sus4)

    /// C♯ Suspended Second - C♯sus2
    static var Cssus2 = Chord(.Cs, type: .sus2)

    /// D♯ Suspended Second - D♯sus2
    static var Dssus2 = Chord(.Ds, type: .sus2)

    /// E♯ Suspended Second - E♯sus2
    static var Essus2 = Chord(.Es, type: .sus2)

    /// F♯ Suspended Second - F♯sus2
    static var Fssus2 = Chord(.Fs, type: .sus2)

    /// G♯ Suspended Second - G♯sus2
    static var Gssus2 = Chord(.Gs, type: .sus2)

    /// A♯ Suspended Second - A♯sus2
    static var Assus2 = Chord(.As, type: .sus2)

    /// B♯ Suspended Second - B♯sus2
    static var Bssus2 = Chord(.Bs, type: .sus2)

    // MARK: - Flat Major chords

    /// C♭ Major
    static var Cb = Chord(.Cb, type: .major)

    /// D♭ Major
    static var Db = Chord(.Db, type: .major)

    /// E♭ Major
    static var Eb = Chord(.Eb, type: .major)

    /// F♭ Major
    static var Fb = Chord(.Fb, type: .major)

    /// G♭ Major
    static var Gb = Chord(.Gb, type: .major)

    /// A♭ Major
    static var Ab = Chord(.Ab, type: .major)

    /// B♭ Major
    static var Bb = Chord(.Bb, type: .major)

    // MARK: - Flat Minor chords

    /// C♭ Minor
    static var Cbm = Chord(.Cb, type: .minor)

    /// D♭ Minor
    static var Dbm = Chord(.Db, type: .minor)

    /// E♭ Minor
    static var Ebm = Chord(.Eb, type: .minor)

    /// F♭ Minor
    static var Fbm = Chord(.Fb, type: .minor)

    /// G♭ Minor
    static var Gbm = Chord(.Gb, type: .minor)

    /// A♭ Minor
    static var Abm = Chord(.Ab, type: .minor)

    /// B♭ Minor
    static var Bbm = Chord(.Bb, type: .minor)

    // MARK: - Flat Diminished chords

    /// C♭ Diminished - C♭°
    static var Cbdim = Chord(.Cb, type: .dim)

    /// D♭ Diminished - D♭°
    static var Dbdim = Chord(.Db, type: .dim)

    /// E♭ Diminished - E♭°
    static var Ebdim = Chord(.Eb, type: .dim)

    /// F♭ Diminished - F♭°
    static var Fbdim = Chord(.Fb, type: .dim)

    /// G♭ Diminished - G♭°
    static var Gbdim = Chord(.Gb, type: .dim)

    /// A♭ Diminished - A♭°
    static var Abdim = Chord(.Ab, type: .dim)

    /// B♭ Diminished - B♭°
    static var Bbdim = Chord(.Bb, type: .dim)

    // MARK: - Flat Suspended chords

    /// C♭ Suspended Fourth - C♭sus4
    static var Cbsus4 = Chord(.Cb, type: .sus4)

    /// D♭ Suspended Fourth - D♭sus4
    static var Dbsus4 = Chord(.Db, type: .sus4)

    /// E♭ Suspended Fourth - E♭sus4
    static var Ebsus4 = Chord(.Eb, type: .sus4)

    /// F♭ Suspended Fourth - F♭sus4
    static var Fbsus4 = Chord(.Fb, type: .sus4)

    /// G♭ Suspended Fourth - G♭sus4
    static var Gbsus4 = Chord(.Gb, type: .sus4)

    /// A♭ Suspended Fourth - A♭sus4
    static var Absus4 = Chord(.Ab, type: .sus4)

    /// B♭ Suspended Fourth - B♭sus4
    static var Bbsus4 = Chord(.Bb, type: .sus4)

    /// C♭ Suspended Fourth - C♭sus2
    static var Cbsus2 = Chord(.Cb, type: .sus2)

    /// D♭ Suspended Fourth - D♭sus2
    static var Dbsus2 = Chord(.Db, type: .sus2)

    /// E♭ Suspended Fourth - E♭sus2
    static var Ebsus2 = Chord(.Eb, type: .sus2)

    /// F♭ Suspended Fourth - F♭sus2
    static var Fbsus2 = Chord(.Fb, type: .sus2)

    /// G♭ Suspended Fourth - G♭sus2
    static var Gbsus2 = Chord(.Gb, type: .sus2)

    /// A♭ Suspended Fourth - A♭sus2
    static var Absus2 = Chord(.Ab, type: .sus2)

    /// B♭ Suspended Fourth - B♭sus2
    static var Bbsus2 = Chord(.Bb, type: .sus2)
}
