import Foundation

public typealias PitchSet = BitSetAdapter<Pitch, BitSet128>

public extension PitchSet {
    func chord(in key: Key) -> Chord? {
        var notes = NoteSet()
        forEach { notes.add($0.note(in: key))}
        return Chord(noteSet: notes)
    }
}

/// Essentially a midi note number.
///
/// We want to use a notion of pitch that lends itself to combinatorial algorithms,
/// as opposed to using e.g. a fundamental frequency.
public struct Pitch: Equatable, Hashable {

    var midiNoteNumber: Int8

    public init(_ midiNoteNumber: Int8) {
        self.midiNoteNumber = midiNoteNumber
    }

    /// If we have a Key, we can turn a Pitch into a Note.
    public func note(in key: Key) -> Note {
        Note(pitch: self, key: key)
    }

    /// Returns the distance between Pitches in semitones.
    public func semitones(to: Pitch) -> Int8 {
        abs(midiNoteNumber - to.midiNoteNumber)
    }

    /// Equivalence classes of pitches modulo octave.
    public var pitchClass: Int8 {
        midiNoteNumber % 12
    }
}

extension Pitch: IntRepresentable {

    public var intValue: Int {
        Int(midiNoteNumber)
    }

    public init(intValue: Int) {
        self.midiNoteNumber = Int8(intValue)
    }

}

extension Pitch: Comparable {
    public static func < (lhs: Pitch, rhs: Pitch) -> Bool {
        lhs.midiNoteNumber < rhs.midiNoteNumber
    }
}

extension Pitch: Strideable {
    public func distance(to other: Pitch) -> Int8 {
        semitones(to: other)
    }

    public func advanced(by n: Int8) -> Pitch {
        Pitch(midiNoteNumber + n)
    }
}
