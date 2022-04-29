
import Foundation

struct Chord {

    // Since we don't have a UInt128
    var highNotes: UInt64 = 0
    var lowNotes: UInt64 = 0

    var isTriad: Bool {
        lowNotes.nonzeroBitCount + highNotes.nonzeroBitCount == 3
    }

    /// Add a note to a chord.
    mutating func add(note: Note) {
        if note.noteNumber < 63 {
            lowNotes |= 1 << note.noteNumber
        } else {
            highNotes |= 1 << (note.noteNumber-64)
        }
    }

    /// Is a note in a chord?
    func contains(note: Note) -> Bool {
        if note.noteNumber < 63 {
            return (lowNotes & (1 << note.noteNumber)) != 0
        } else {
            return (highNotes & (1 << (note.noteNumber-64))) != 0
        }
    }
}
