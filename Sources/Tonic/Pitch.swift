import Foundation

/// Essentially a midi note number.
///
/// We want to use a notion of pitch that lends itself to combinatorial algorithms,
/// as opposed to useing e.g. a fundamental frequency.
public struct Pitch: Equatable, Hashable {

    var midiNoteNumber: Int8

    public init(_ midiNoteNumber: Int8) {
        self.midiNoteNumber = midiNoteNumber
    }

    /// If we have a Key, we can turn a Pitch into a Note.
    func note(in key: Key) -> Note {
        Note(pitch: self, key: key)
    }

    /// Returns the distance between Pitches in semitones.
    func semitones(to: Pitch) -> Int8 {
        abs(midiNoteNumber - to.midiNoteNumber)
    }

    /// Equivalence classes of pitches modulo octave.
    var pitchClass: Int8 {
        midiNoteNumber % 12
    }
}
