
import Foundation

struct Note {

    /// 0-127 starting at C
    var midiNoteNumber: Int8

    /// Semitone shift for accidental to distinguish defferent spelling of the note.
    var accidentalShift: Int8

    var spelling: String {
        let baseNote = midiNoteNumber-accidentalShift

        let baseSpelling = ["C", "", "D", "", "E", "F", "", "G", "", "A", "", "B"]
        let note = baseSpelling[Int(baseNote % 12)]
        assert(note != "")

        let accidental = ["𝄫", "♭", "", "♯", "𝄪"][Int(accidentalShift) + 2]

        return note + accidental
    }
}
