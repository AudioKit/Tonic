
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
        forEachNote({ r.append($0 )})
        return r
    }

    /// Calls a function for each note in the chord.
    func forEachNote(_ f: (Note) -> ()) {
        noteSet.forEach { bit in
            f(Note(noteNumber: Int8(bit)))
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
}

func generateTriads() -> [Chord2] {

    var chords: [Chord2] = []
    for root in 0..<127 {
        if root + 7 >= 127 {
            continue
        }
        let rootNote1 = Note(noteNumber: Int8(root))
        var rootNotes = [rootNote1]
        if rootNote1.accidental == .sharp {
            rootNotes.append(Note(noteNumber: Int8(root), accidental: .flat))
        }

        for rootNote in rootNotes {
            for third in [Interval.m3, Interval.M3] {
                chords.append(Chord2(notes: [rootNote, rootNote.shift(third), rootNote.shift(Interval.P5)]))
            }
        }
    }
    return chords
}
