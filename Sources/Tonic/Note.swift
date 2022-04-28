
import Foundation

struct Note {

    /// 0-127 starting at C
    var midiNoteNumber: UInt8

    /// Semitone shift for accidental to distinguish defferent spelling of the note.
    var accientalShift: Int8

}
