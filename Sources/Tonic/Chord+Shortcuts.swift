// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

public extension Chord {
    // MARK: - Natural Major chords

    /// C Major
    static let C = Chord(.C, type: .major)

    /// D Major
    static let D = Chord(.D, type: .major)

    /// E Major
    static let E = Chord(.E, type: .major)

    /// F Major
    static let F = Chord(.F, type: .major)

    /// G Major
    static let G = Chord(.G, type: .major)

    /// A Major
    static let A = Chord(.A, type: .major)

    /// B Major
    static let B = Chord(.B, type: .major)

    // MARK: - Natural Minor chords

    /// C Minor
    static let Cm = Chord(.C, type: .minor)

    /// D Minor
    static let Dm = Chord(.D, type: .minor)

    /// E Minor
    static let Em = Chord(.E, type: .minor)

    /// F Minor
    static let Fm = Chord(.F, type: .minor)

    /// G Minor
    static let Gm = Chord(.G, type: .minor)

    /// A Minor
    static let Am = Chord(.A, type: .minor)

    /// B Minor
    static let Bm = Chord(.B, type: .minor)

    // MARK: - Natural Diminished chords

    /// C Diminished - C°
    static let Cdim = Chord(.C, type: .dim)

    /// D Diminished - D°
    static let Ddim = Chord(.D, type: .dim)

    /// E Diminished - E°
    static let Edim = Chord(.E, type: .dim)

    /// F Diminished - F°
    static let Fdim = Chord(.F, type: .dim)

    /// G Diminished - G°
    static let Gdim = Chord(.G, type: .dim)

    /// A Diminished - A°
    static let Adim = Chord(.A, type: .dim)

    /// B Diminished - B°
    static let Bdim = Chord(.B, type: .dim)

    // MARK: - Natural Augmented chords

    /// C Augmented - C⁺
    static let Caug = Chord(.C, type: .aug)

    /// D Augmented - D⁺
    static let Daug = Chord(.D, type: .aug)

    /// E Augmented - E⁺
    static let Eaug = Chord(.E, type: .aug)

    /// F Augmented - F⁺
    static let Faug = Chord(.F, type: .aug)

    /// G Augmented - G⁺
    static let Gaug = Chord(.G, type: .aug)

    /// A Augmented - A⁺
    static let Aaug = Chord(.A, type: .aug)

    /// B Augmented - B⁺
    static let Baug = Chord(.B, type: .aug)

    // MARK: - Natural Suspended chords

    /// C Suspended Fourth - Csus4
    static let Csus4 = Chord(.C, type: .sus4)

    /// D Suspended Fourth - Dsus4
    static let Dsus4 = Chord(.D, type: .sus4)

    /// E Suspended Fourth - Esus4
    static let Esus4 = Chord(.E, type: .sus4)

    /// F Suspended Fourth - Fsus4
    static let Fsus4 = Chord(.F, type: .sus4)

    /// G Suspended Fourth - Gsus4
    static let Gsus4 = Chord(.G, type: .sus4)

    /// A Suspended Fourth - Asus4
    static let Asus4 = Chord(.A, type: .sus4)

    /// B Suspended Fourth - Bsus4
    static let Bsus4 = Chord(.B, type: .sus4)

    /// C Suspended Second - Csus2
    static let Csus2 = Chord(.C, type: .sus2)

    /// D Suspended Second - Dsus2
    static let Dsus2 = Chord(.D, type: .sus2)

    /// E Suspended Second - Esus2
    static let Esus2 = Chord(.E, type: .sus2)

    /// F Suspended Second - Fsus2
    static let Fsus2 = Chord(.F, type: .sus2)

    /// G Suspended Second - Gsus2
    static let Gsus2 = Chord(.G, type: .sus2)

    /// A Suspended Second - Asus2
    static let Asus2 = Chord(.A, type: .sus2)

    /// B Suspended Second - Bsus2
    static let Bsus2 = Chord(.B, type: .sus2)

    // MARK: - Sharp Major chords

    /// C♯ Major
    static let Cs = Chord(.Cs, type: .major)

    /// D♯ Major
    static let Ds = Chord(.Ds, type: .major)

    /// E♯ Major
    static let Es = Chord(.Es, type: .major)

    /// F♯ Major
    static let Fs = Chord(.Fs, type: .major)

    /// G♯ Major
    static let Gs = Chord(.Gs, type: .major)

    /// A♯ Major
    static let As = Chord(.As, type: .major)

    /// B♯ Major
    static let Bs = Chord(.Bs, type: .major)

    // MARK: - Sharp Minor chords

    /// C♯ Minor
    static let Csm = Chord(.Cs, type: .minor)

    /// D♯ Minor
    static let Dsm = Chord(.Ds, type: .minor)

    /// E♯ Minor
    static let Esm = Chord(.Es, type: .minor)

    /// F♯ Minor
    static let Fsm = Chord(.Fs, type: .minor)

    /// G♯ Minor
    static let Gsm = Chord(.Gs, type: .minor)

    /// A♯ Minor
    static let Asm = Chord(.As, type: .minor)

    /// B♯ Minor
    static let Bsm = Chord(.Bs, type: .minor)

    // MARK: - Sharp Diminished chords

    /// C♯ Diminished - C♯°
    static let Csdim = Chord(.Cs, type: .dim)

    /// D♯ Diminished - D♯°
    static let Dsdim = Chord(.Ds, type: .dim)

    /// E♯ Diminished - E♯°
    static let Esdim = Chord(.Es, type: .dim)

    /// F♯ Diminished - F♯°
    static let Fsdim = Chord(.Fs, type: .dim)

    /// G♯ Diminished - G♯°
    static let Gsdim = Chord(.Gs, type: .dim)

    /// A♯ Diminished - A♯°
    static let Asdim = Chord(.As, type: .dim)

    /// B♯ Diminished - B♯°
    static let Bsdim = Chord(.Bs, type: .dim)

    // MARK: - Sharp Suspended chords

    /// C♯ Suspended Fourth - C♯sus4
    static let Cssus4 = Chord(.Cs, type: .sus4)

    /// D♯ Suspended Fourth - D♯sus4
    static let Dssus4 = Chord(.Ds, type: .sus4)

    /// E♯ Suspended Fourth - E♯sus4
    static let Essus4 = Chord(.Es, type: .sus4)

    /// F♯ Suspended Fourth - F♯sus4
    static let Fssus4 = Chord(.Fs, type: .sus4)

    /// G♯ Suspended Fourth - G♯sus4
    static let Gssus4 = Chord(.Gs, type: .sus4)

    /// A♯ Suspended Fourth - A♯sus4
    static let Assus4 = Chord(.As, type: .sus4)

    /// B♯ Suspended Fourth - B♯sus4
    static let Bssus4 = Chord(.Bs, type: .sus4)

    /// C♯ Suspended Second - C♯sus2
    static let Cssus2 = Chord(.Cs, type: .sus2)

    /// D♯ Suspended Second - D♯sus2
    static let Dssus2 = Chord(.Ds, type: .sus2)

    /// E♯ Suspended Second - E♯sus2
    static let Essus2 = Chord(.Es, type: .sus2)

    /// F♯ Suspended Second - F♯sus2
    static let Fssus2 = Chord(.Fs, type: .sus2)

    /// G♯ Suspended Second - G♯sus2
    static let Gssus2 = Chord(.Gs, type: .sus2)

    /// A♯ Suspended Second - A♯sus2
    static let Assus2 = Chord(.As, type: .sus2)

    /// B♯ Suspended Second - B♯sus2
    static let Bssus2 = Chord(.Bs, type: .sus2)

    // MARK: - Flat Major chords

    /// C♭ Major
    static let Cb = Chord(.Cb, type: .major)

    /// D♭ Major
    static let Db = Chord(.Db, type: .major)

    /// E♭ Major
    static let Eb = Chord(.Eb, type: .major)

    /// F♭ Major
    static let Fb = Chord(.Fb, type: .major)

    /// G♭ Major
    static let Gb = Chord(.Gb, type: .major)

    /// A♭ Major
    static let Ab = Chord(.Ab, type: .major)

    /// B♭ Major
    static let Bb = Chord(.Bb, type: .major)

    // MARK: - Flat Minor chords

    /// C♭ Minor
    static let Cbm = Chord(.Cb, type: .minor)

    /// D♭ Minor
    static let Dbm = Chord(.Db, type: .minor)

    /// E♭ Minor
    static let Ebm = Chord(.Eb, type: .minor)

    /// F♭ Minor
    static let Fbm = Chord(.Fb, type: .minor)

    /// G♭ Minor
    static let Gbm = Chord(.Gb, type: .minor)

    /// A♭ Minor
    static let Abm = Chord(.Ab, type: .minor)

    /// B♭ Minor
    static let Bbm = Chord(.Bb, type: .minor)

    // MARK: - Flat Diminished chords

    /// C♭ Diminished - C♭°
    static let Cbdim = Chord(.Cb, type: .dim)

    /// D♭ Diminished - D♭°
    static let Dbdim = Chord(.Db, type: .dim)

    /// E♭ Diminished - E♭°
    static let Ebdim = Chord(.Eb, type: .dim)

    /// F♭ Diminished - F♭°
    static let Fbdim = Chord(.Fb, type: .dim)

    /// G♭ Diminished - G♭°
    static let Gbdim = Chord(.Gb, type: .dim)

    /// A♭ Diminished - A♭°
    static let Abdim = Chord(.Ab, type: .dim)

    /// B♭ Diminished - B♭°
    static let Bbdim = Chord(.Bb, type: .dim)

    // MARK: - Flat Suspended chords

    /// C♭ Suspended Fourth - C♭sus4
    static let Cbsus4 = Chord(.Cb, type: .sus4)

    /// D♭ Suspended Fourth - D♭sus4
    static let Dbsus4 = Chord(.Db, type: .sus4)

    /// E♭ Suspended Fourth - E♭sus4
    static let Ebsus4 = Chord(.Eb, type: .sus4)

    /// F♭ Suspended Fourth - F♭sus4
    static let Fbsus4 = Chord(.Fb, type: .sus4)

    /// G♭ Suspended Fourth - G♭sus4
    static let Gbsus4 = Chord(.Gb, type: .sus4)

    /// A♭ Suspended Fourth - A♭sus4
    static let Absus4 = Chord(.Ab, type: .sus4)

    /// B♭ Suspended Fourth - B♭sus4
    static let Bbsus4 = Chord(.Bb, type: .sus4)

    /// C♭ Suspended Fourth - C♭sus2
    static let Cbsus2 = Chord(.Cb, type: .sus2)

    /// D♭ Suspended Fourth - D♭sus2
    static let Dbsus2 = Chord(.Db, type: .sus2)

    /// E♭ Suspended Fourth - E♭sus2
    static let Ebsus2 = Chord(.Eb, type: .sus2)

    /// F♭ Suspended Fourth - F♭sus2
    static let Fbsus2 = Chord(.Fb, type: .sus2)

    /// G♭ Suspended Fourth - G♭sus2
    static let Gbsus2 = Chord(.Gb, type: .sus2)

    /// A♭ Suspended Fourth - A♭sus2
    static let Absus2 = Chord(.Ab, type: .sus2)

    /// B♭ Suspended Fourth - B♭sus2
    static let Bbsus2 = Chord(.Bb, type: .sus2)
}
