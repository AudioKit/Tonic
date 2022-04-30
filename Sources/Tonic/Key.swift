import Foundation

struct Key {
    var root: Note
    var scale: Scale = .major

    var notes: [Note] {
        var r = [root]

        for interval in scale.intervals {
            let note = root.shift(interval)
            r.append(note)
        }
        return r
    }
}

enum CircleOfFifths: Int {
    case Cb
    case Gb
    case Db
    case Ab
    case Eb
    case Bb
    case F
    case C
    case G
    case D
    case A
    case E
    case B
    case Fs
    case Cs

    case ab
    case eb
    case bb
    case f
    case c
    case g
    case d
    case a
    case e
    case b
    case fs
    case cs
    case gs
    case ds
    case `as`

}
