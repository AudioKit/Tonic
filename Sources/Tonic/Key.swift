import Foundation

struct Key {
    var root: Note
    var scale: Scale = .major

    var notes: [Note] {
        var r = [root]

        for interval in scale.intervals {
            if let note = root.shift(interval) {
                r.append(note)
            }
        }
        return r
    }

    var preferredAccidental: Accidental {
        if root.accidental == .natural || root.accidental == .sharp  {
            return .sharp
        } else {
            return .flat
        }

    }

    static var Cb = Key(root: Note(.C, accidental: .flat), scale: .major)
    static var Gb = Key(root: Note(.G, accidental: .flat), scale: .major)
    static var Db = Key(root: Note(.D, accidental: .flat), scale: .major)
    static var Ab = Key(root: Note(.A, accidental: .flat), scale: .major)
    static var Eb = Key(root: Note(.E, accidental: .flat), scale: .major)
    static var Bb = Key(root: Note(.B, accidental: .flat), scale: .major)
    static var F = Key(root: Note(.F), scale: .major)
    static var C = Key(root: Note(.C), scale: .major)
    static var G = Key(root: Note(.G), scale: .major)
    static var D = Key(root: Note(.D), scale: .major)
    static var A = Key(root: Note(.A), scale: .major)
    static var E = Key(root: Note(.E), scale: .major)
    static var B = Key(root: Note(.B), scale: .major)
    static var Fs = Key(root: Note(.F, accidental: .sharp), scale: .major)
    static var Cs = Key(root: Note(.C, accidental: .sharp), scale: .major)

    static var ab = Key(root: Note(.A, accidental: .flat), scale: .minor)
    static var eb = Key(root: Note(.E, accidental: .flat), scale: .minor)
    static var bb = Key(root: Note(.B, accidental: .flat), scale: .minor)
    static var f = Key(root: Note(.F), scale: .minor)
    static var c = Key(root: Note(.C), scale: .minor)
    static var g = Key(root: Note(.G), scale: .minor)
    static var d = Key(root: Note(.D), scale: .minor)
    static var a = Key(root: Note(.A), scale: .minor)
    static var e = Key(root: Note(.E), scale: .minor)
    static var b = Key(root: Note(.B), scale: .minor)
    static var fs = Key(root: Note(.F, accidental: .sharp), scale: .minor)
    static var cs = Key(root: Note(.C, accidental: .sharp), scale: .minor)
    static var gs = Key(root: Note(.G, accidental: .sharp), scale: .minor)
    static var ds = Key(root: Note(.D, accidental: .sharp), scale: .minor)
    static var `as` = Key(root: Note(.A, accidental: .sharp), scale: .minor)
}
