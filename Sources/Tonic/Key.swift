import Foundation

public struct Key {
    public var root: Note
    public var scale: Scale = .major

    public var notes: [Note] {
        var r = [root]

        for interval in scale.intervals {
            if let note = root.shiftUp(interval) {
                r.append(note)
            }
        }
        return r
    }

    public var preferredAccidental: Accidental {
        if root.accidental == .natural || root.accidental == .sharp  {
            return .sharp
        } else {
            return .flat
        }

    }

    public static var Cb = Key(root: Note(.C, accidental: .flat), scale: .major)
    public static var Gb = Key(root: Note(.G, accidental: .flat), scale: .major)
    public static var Db = Key(root: Note(.D, accidental: .flat), scale: .major)
    public static var Ab = Key(root: Note(.A, accidental: .flat), scale: .major)
    public static var Eb = Key(root: Note(.E, accidental: .flat), scale: .major)
    public static var Bb = Key(root: Note(.B, accidental: .flat), scale: .major)
    public static var F = Key(root: Note(.F), scale: .major)
    public static var C = Key(root: Note(.C), scale: .major)
    public static var G = Key(root: Note(.G), scale: .major)
    public static var D = Key(root: Note(.D), scale: .major)
    public static var A = Key(root: Note(.A), scale: .major)
    public static var E = Key(root: Note(.E), scale: .major)
    public static var B = Key(root: Note(.B), scale: .major)
    public static var Fs = Key(root: Note(.F, accidental: .sharp), scale: .major)
    public static var Cs = Key(root: Note(.C, accidental: .sharp), scale: .major)

    public static var ab = Key(root: Note(.A, accidental: .flat), scale: .minor)
    public static var eb = Key(root: Note(.E, accidental: .flat), scale: .minor)
    public static var bb = Key(root: Note(.B, accidental: .flat), scale: .minor)
    public static var f = Key(root: Note(.F), scale: .minor)
    public static var c = Key(root: Note(.C), scale: .minor)
    public static var g = Key(root: Note(.G), scale: .minor)
    public static var d = Key(root: Note(.D), scale: .minor)
    public static var a = Key(root: Note(.A), scale: .minor)
    public static var e = Key(root: Note(.E), scale: .minor)
    public static var b = Key(root: Note(.B), scale: .minor)
    public static var fs = Key(root: Note(.F, accidental: .sharp), scale: .minor)
    public static var cs = Key(root: Note(.C, accidental: .sharp), scale: .minor)
    public static var gs = Key(root: Note(.G, accidental: .sharp), scale: .minor)
    public static var ds = Key(root: Note(.D, accidental: .sharp), scale: .minor)
    public static var `as` = Key(root: Note(.A, accidental: .sharp), scale: .minor)
}
