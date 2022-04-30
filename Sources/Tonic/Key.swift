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

    static var C = Key(root: Note(.C), scale: .major)
}
