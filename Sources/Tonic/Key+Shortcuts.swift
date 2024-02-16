// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

public extension Key {
    
    static let circleOfFifths: [Key] = [.C, .G, .D, .A, .E, .B, .Fs, .Cs]
    static let circleOfFourths: [Key] = [.F, .Bb, .Eb, .Ab, .Db, .Gb, .Cb]
    
    // MARK: - Major keys

    /// C♭ Major
    static let Cb = Key(root: NoteClass(.C, accidental: .flat), scale: .major)

    /// G♭ Major
    static let Gb = Key(root: NoteClass(.G, accidental: .flat), scale: .major)

    /// D♭ Major
    static let Db = Key(root: NoteClass(.D, accidental: .flat), scale: .major)

    /// A♭ Major
    static let Ab = Key(root: NoteClass(.A, accidental: .flat), scale: .major)

    /// E♭ Major
    static let Eb = Key(root: NoteClass(.E, accidental: .flat), scale: .major)

    /// B♭ Major
    static let Bb = Key(root: NoteClass(.B, accidental: .flat), scale: .major)

    /// F Major
    static let F = Key(root: NoteClass(.F), scale: .major)

    /// C Major
    static let C = Key(root: NoteClass(.C), scale: .major)

    /// G Major
    static let G = Key(root: NoteClass(.G), scale: .major)

    /// D Major
    static let D = Key(root: NoteClass(.D), scale: .major)

    /// A Major
    static let A = Key(root: NoteClass(.A), scale: .major)

    /// E Major
    static let E = Key(root: NoteClass(.E), scale: .major)

    /// B Major
    static let B = Key(root: NoteClass(.B), scale: .major)

    /// F♯ Major
    static let Fs = Key(root: NoteClass(.F, accidental: .sharp), scale: .major)

    /// C♯ Major
    static let Cs = Key(root: NoteClass(.C, accidental: .sharp), scale: .major)

    // MARK: - Minor keys

    /// A♭ Minor
    static let ab = Key(root: NoteClass(.A, accidental: .flat), scale: .minor)

    /// E♭ Minor
    static let eb = Key(root: NoteClass(.E, accidental: .flat), scale: .minor)

    /// B♭ Minor
    static let bb = Key(root: NoteClass(.B, accidental: .flat), scale: .minor)

    /// F Minor
    static let f = Key(root: NoteClass(.F), scale: .minor)

    /// C Minor
    static let c = Key(root: NoteClass(.C), scale: .minor)

    /// G Minor
    static let g = Key(root: NoteClass(.G), scale: .minor)

    /// D Minor
    static let d = Key(root: NoteClass(.D), scale: .minor)

    /// A Minor
    static let a = Key(root: NoteClass(.A), scale: .minor)

    /// E Minor
    static let e = Key(root: NoteClass(.E), scale: .minor)

    /// B Minor
    static let b = Key(root: NoteClass(.B), scale: .minor)

    /// F♯ Minor
    static let fs = Key(root: NoteClass(.F, accidental: .sharp), scale: .minor)

    /// C♯ Minor
    static let cs = Key(root: NoteClass(.C, accidental: .sharp), scale: .minor)

    /// G♯ Minor
    static let gs = Key(root: NoteClass(.G, accidental: .sharp), scale: .minor)

    /// D♯ Minor
    static let ds = Key(root: NoteClass(.D, accidental: .sharp), scale: .minor)

    /// A♯ Minor
    static let `as` = Key(root: NoteClass(.A, accidental: .sharp), scale: .minor)

    /// A♭ Minor
    static let Abm = Key(root: NoteClass(.A, accidental: .flat), scale: .minor)

    /// E♭ Minor
    static let Ebm = Key(root: NoteClass(.E, accidental: .flat), scale: .minor)

    /// B♭ Minor
    static let Bbm = Key(root: NoteClass(.B, accidental: .flat), scale: .minor)

    /// F Minor
    static let Fm = Key(root: NoteClass(.F), scale: .minor)

    /// C Minor
    static let Cm = Key(root: NoteClass(.C), scale: .minor)

    /// G Minor
    static let Gm = Key(root: NoteClass(.G), scale: .minor)

    /// D Minor
    static let Dm = Key(root: NoteClass(.D), scale: .minor)

    /// A Minor
    static let Am = Key(root: NoteClass(.A), scale: .minor)

    /// E Minor
    static let Em = Key(root: NoteClass(.E), scale: .minor)

    /// B Minor
    static let Bm = Key(root: NoteClass(.B), scale: .minor)

    /// F♯ Minor
    static let Fsm = Key(root: NoteClass(.F, accidental: .sharp), scale: .minor)

    /// C♯ Minor
    static let Csm = Key(root: NoteClass(.C, accidental: .sharp), scale: .minor)

    /// G♯ Minor
    static let Gsm = Key(root: NoteClass(.G, accidental: .sharp), scale: .minor)

    /// D♯ Minor
    static let Dsm = Key(root: NoteClass(.D, accidental: .sharp), scale: .minor)

    /// A♯ Minor
    static let Asm = Key(root: NoteClass(.A, accidental: .sharp), scale: .minor)
}
