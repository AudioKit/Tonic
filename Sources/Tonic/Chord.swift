
import Foundation

struct Chord2 {
    var notes: [Note]

    var isDyad: Bool {
        notes.count == 2
    }

    var isTriad: Bool {
        notes.count == 3
    }
}

/// Chord addresses all possible combinations of simultaneous MIDI notes.
struct Chord {

    var noteSet = BitSet128()

    init(notes: [Note]) {
        for n in notes {
            add(note: n)
        }
    }

    var noteCount: Int {
        notes.count
    }

    var isDyad: Bool {
        noteCount == 2
    }

    var isTriad: Bool {
        noteCount == 3
    }

    var notes: [Note] {
        var r: [Note] = []
        forEachNote({ r.append($0)})
        return r
    }

    /// Calls a function for each note in the chord.
    func forEachNote(_ f: (Note) -> ()) {
        noteSet.forEach { bit in
            f(Note(noteNumber: UInt8(bit)))
        }
    }

    /// Add a note to a chord.
    mutating func add(note: Note) {
        noteSet.add(bit: Int(note.noteNumber))
    }

    /// Is a note in a chord?
    func contains(note: Note) -> Bool {
        noteSet.isSet(bit: Int(note.noteNumber))
    }

    /// One-sided Hausdorff distance to another chord.
    ///
    /// https://en.wikipedia.org/wiki/Hausdorff_distance
    func hausdorff(to: Chord) -> Int {
        var d_sup = 0
        self.forEachNote { n0 in
            var d_inf = Int.max
            to.forEachNote { n1 in
                d_inf = min(d_inf, n0.semitones(to: n1))
            }
            d_sup = max(d_sup, d_inf)
        }
        return d_sup
    }

    func notes(in key: Key) -> [Note] {
        var r: [Note] = []
        noteSet.forEach { noteNumber in
            r.append(Note(noteNumber: UInt8(noteNumber), key: key))
        }
        return r
    }

    func name(in key: Key) -> String {
        return ""
    }
}

func generateTriads() -> [Chord2] {

    var chords: [Chord2] = []
    for octave in -1...7 {
        let accidentals: [Accidental] = [.flat, .natural, .sharp]
        for accidental in  accidentals {
            for letter in Letter.allCases {
                let root = Note(letter: letter, accidental: accidental, octave: octave)
                if root.noteNumber + 7 >= 127 {
                    continue
                }
                for third in [Interval.m3, Interval.M3] {
                    chords.append(Chord2(notes: [root, root.shift(third), root.shift(.P5)]))
                }
            }
        }
    }
    return chords
}

/// A set of intervals from the root (tonic).
struct ChordType: OptionSet {
    let rawValue: Int

    var intervals: [Interval] {

        var result: [Interval] = []
        for i in 0..<11 {
            if (rawValue >> i) & 1 != 0 {
                result.append(Interval(rawValue: i)!)
            }
        }
        return result
    }

    init(rawValue: Int) {
        self.rawValue = rawValue
    }

    init(intervals: [Interval]) {
        var r = 0
        for interval in intervals {
            r |= (1 << interval.rawValue)
        }
        self.rawValue = r
    }

    static let majorTriad = ChordType(intervals: [.M3, .P5])
    static let majorSixth = ChordType(intervals: [.M3, .P5, .M6])
    static let dominantSeventh = ChordType(intervals: [.M3, .P5, .m7])
    static let minorTriad = ChordType(intervals: [.m3, .P5])
}
