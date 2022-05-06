import Foundation

/// Chord addresses all possible combinations of simultaneous Notes.
///
/// Note: it may be more theoretically correct to merge this with NoteSet.
public struct Chord: Equatable {

    public var noteSet = NoteSet()

    public init(notes: [Note]) {
        for n in notes {
            add(note: n)
        }
    }

    public init(noteSet: NoteSet) {
        self.noteSet = noteSet
    }

    public init(_ root: Note, type: ChordType) {
        add(note: root)
        for interval in type.intervals {
            if let note = root.shiftUp(interval) {
                add(note: note)
            }
        }
    }

    public var noteCount: Int {
        notes.count
    }

    public var isDyad: Bool {
        noteCount == 2
    }

    public var isTriad: Bool {
        noteCount == 3
    }

    public var notes: [Note] {
        var r: [Note] = []
        forEachNote({ r.append($0)})
        return r
    }

    /// Calls a function for each note in the chord.
    public func forEachNote(_ f: (Note) -> ()) {
        noteSet.forEachNote { n in
            f(n)
        }
    }

    /// Add a note to a chord.
    public mutating func add(note: Note) {
        noteSet.add(note: note)
    }

    /// Is a note in a chord?
    public func contains(note: Note) -> Bool {
        noteSet.contains(note)
    }

    /// One-sided Hausdorff distance to another chord.
    ///
    /// https://en.wikipedia.org/wiki/Hausdorff_distance
    public func hausdorff(to: Chord) -> Int8 {
        var d_sup: Int8 = 0
        self.forEachNote { n0 in
            var d_inf = Int8.max
            to.forEachNote { n1 in
                d_inf = min(d_inf, n0.semitones(to: n1))
            }
            d_sup = max(d_sup, d_inf)
        }
        return d_sup
    }

    /// Try to give this chord a name
    public var name: String {

        if let info = ChordTable.shared.triads[pitchClassesHash] {
            let root = info.root
            switch info.type {
            case .major: return "\(root.spelling)"
            case .minor: return "\(root.spelling)m"
            case .diminished: return "\(root.spelling)°"
            case .augmented: return "\(root.spelling)⁺"
            }
        }

        return "unknown chord"
    }

    public var pitchClassesHash: Int {
        var r = NoteSet()
        noteSet.forEachNote { note in
            r.add(note: note.noteClass)
        }
        return r.hashValue
    }

    func romanNumeralNotation(in key: Key) -> String? {
        let capitalRomanNumerals = ["I", "II", "III", "IV", "V", "VI", "VII"]
        if let index = key.chords.firstIndex(where: { $0 == self }) {
            if let info = ChordTable.shared.triads[pitchClassesHash] {
                let romanNumeral = capitalRomanNumerals[index]
                switch info.type {
                case .major: return romanNumeral
                case .minor: return romanNumeral.lowercased()
                case .diminished: return "\(romanNumeral.lowercased())°"
                case .augmented: return "\(romanNumeral)⁺"
                }
            }
        }
        return nil
    }
}

public enum TriadType {
    case major, minor, diminished, augmented
}

public struct TriadInfo {
    var root: Note
    var type: TriadType
    var notes: NoteSet
}

