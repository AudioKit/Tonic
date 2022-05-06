import Foundation

/// A scale with a root note (tonic).
public struct Key: Equatable {
    public let root: Note
    public let scale: Scale
    public let notes: NoteSet

    public init(root: Note, scale: Scale = .major) {
        self.root = root
        self.scale = scale

        var r = [root]

        for interval in scale.intervals {
            if let note = root.shiftUp(interval) {
                r.append(note)
            }
        }
        self.notes = NoteSet(notes: r)
    }

    public var preferredAccidental: Accidental {
        if root.spelling.accidental == .sharp  {
            return .sharp
        }
        if root.spelling.accidental == .flat {
            return .flat
        }

        let naturalKeysWithFlats: [Key] = [.F, .d, .g, .c, .f]
        if naturalKeysWithFlats.contains(self) {
            return .flat
        }

        return .sharp


    }

    /// Returns all the chords in the key.
    public var chords: [Chord] {
        let table = ChordTable.shared
        var result: [Chord] = []

        for (_, info) in table.triads {
            if info.notes.isSubset(of: notes) {
                result.append(Chord(noteSet: info.notes))
            }
        }

        return result
    }

    public static let Cb = Key(root: Note(.C, accidental: .flat), scale: .major)
    public static let Gb = Key(root: Note(.G, accidental: .flat), scale: .major)
    public static let Db = Key(root: Note(.D, accidental: .flat), scale: .major)
    public static let Ab = Key(root: Note(.A, accidental: .flat), scale: .major)
    public static let Eb = Key(root: Note(.E, accidental: .flat), scale: .major)
    public static let Bb = Key(root: Note(.B, accidental: .flat), scale: .major)
    public static let F = Key(root: Note(.F), scale: .major)
    public static let C = Key(root: Note(.C), scale: .major)
    public static let G = Key(root: Note(.G), scale: .major)
    public static let D = Key(root: Note(.D), scale: .major)
    public static let A = Key(root: Note(.A), scale: .major)
    public static let E = Key(root: Note(.E), scale: .major)
    public static let B = Key(root: Note(.B), scale: .major)
    public static let Fs = Key(root: Note(.F, accidental: .sharp), scale: .major)
    public static let Cs = Key(root: Note(.C, accidental: .sharp), scale: .major)

    public static let ab = Key(root: Note(.A, accidental: .flat), scale: .minor)
    public static let eb = Key(root: Note(.E, accidental: .flat), scale: .minor)
    public static let bb = Key(root: Note(.B, accidental: .flat), scale: .minor)
    public static let f = Key(root: Note(.F), scale: .minor)
    public static let c = Key(root: Note(.C), scale: .minor)
    public static let g = Key(root: Note(.G), scale: .minor)
    public static let d = Key(root: Note(.D), scale: .minor)
    public static let a = Key(root: Note(.A), scale: .minor)
    public static let e = Key(root: Note(.E), scale: .minor)
    public static let b = Key(root: Note(.B), scale: .minor)
    public static let fs = Key(root: Note(.F, accidental: .sharp), scale: .minor)
    public static let cs = Key(root: Note(.C, accidental: .sharp), scale: .minor)
    public static let gs = Key(root: Note(.G, accidental: .sharp), scale: .minor)
    public static let ds = Key(root: Note(.D, accidental: .sharp), scale: .minor)
    public static let `as` = Key(root: Note(.A, accidental: .sharp), scale: .minor)
}
