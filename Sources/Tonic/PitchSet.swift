
import Foundation

/// A set of pitches represented by a bit set.
///
/// Addresses all possible combinations of simultaneous MIDI notes.
public struct PitchSet: Hashable, Equatable {
    var bits = BitSet128()

    public init() { }

    public init(pitches: [Pitch]) {
        for pitch in pitches {
            add(pitch: pitch)
        }
    }

    public init(numbers: [Int8]) {
        for n in numbers {
            add(pitch: Pitch(n))
        }
    }

    public mutating func add(pitch: Pitch) {
        bits.add(bit: Int(pitch.midiNoteNumber))
    }

    public func contains(pitch: Pitch) -> Bool {
        bits.isSet(bit: Int(pitch.midiNoteNumber))
    }

    public func forEachPitch(f: (Pitch) -> ()) {
        bits.forEach { noteIndex in
            f(Pitch(Int8(noteIndex)))
        }
    }

    public var count: Int {
        bits.count
    }

    func chord(in key: Key) -> Chord {
        var c = Chord(notes: [])
        forEachPitch { p in
            c.add(note: p.note(in: key))
        }
        return c
    }
}
