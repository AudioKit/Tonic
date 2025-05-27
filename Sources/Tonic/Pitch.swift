// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

public typealias PitchSet = BitSetAdapter<Pitch, BitSet128>

public extension PitchSet {
    init(pitches: [Pitch]) {
        self.init()
        for pitch in pitches {
            add(pitch)
        }
    }

    func chord(in key: Key) -> Chord? {
        var notes = NoteSet()
        forEach { notes.add($0.note(in: key)) }
        return Chord(noteSet: notes)
    }

    func contains(pitchClass: Int8) -> Bool {
        array.first { pitch in pitch.pitchClass == pitchClass } != nil
    }

    var closedVoicing: PitchSet {
        var pitchArray: [Pitch] = []
        self.forEach { pitch in
            // if this is a new note
            if !pitchArray.map({ $0.midiNoteNumber % 12 }).contains(pitch.midiNoteNumber % 12) {
                // add the new note in the closes octave to the bass note
                if let bassNote = pitchArray.first {
                    var pitchCopy = pitch
                    while pitchCopy.midiNoteNumber > bassNote.midiNoteNumber + 12 {
                        pitchCopy = Pitch(pitchCopy.midiNoteNumber - 12)
                    }
                    pitchArray.append(pitchCopy)
                } else {
                    pitchArray.append(pitch)
                }

            }
        }

        return PitchSet(pitches: pitchArray)
    }

    func transposedBassNoteTo(octave: Int) -> PitchSet {
        guard let bass = self.array.first,
              let targetOctave = Octave(rawValue: octave),
              let bassOctave = Octave(of: bass) else {
            return PitchSet()
        }

        let octaveDifference = targetOctave.rawValue - bassOctave.rawValue
        return PitchSet(pitches: self.array.map { Pitch($0.midiNoteNumber + Int8(octaveDifference * 12)) })
    }

}

/// Essentially a midi note number.
///
/// We want to use a notion of pitch that lends itself to combinatorial algorithms,
/// as opposed to using e.g. a fundamental frequency.
public struct Pitch: Sendable, Equatable, Hashable, Codable {
    /// MIDI Note Number 0-127
    public var midiNoteNumber: Int8

    /// Initialize from a MIDI Note Number
    /// - Parameter midiNoteNumber: MIDI Note Number 0-127
    public init(_ midiNoteNumber: Int8) {
        self.midiNoteNumber = midiNoteNumber
    }

    /// If we have a Key, we can turn a Pitch into a Note.
    /// - Parameter key: Key to find the note in
    public func note(in key: Key) -> Note {
        Note(pitch: self, key: key)
    }

    /// Returns the distance between Pitches in semitones.
    /// - Parameter to: Pitch to which you want to know the distance
    public func semitones(to next: Pitch) -> Int8 {
        abs(midiNoteNumber - next.midiNoteNumber)
    }

    /// Equivalence classes of pitches modulo octave.
    public var pitchClass: Int8 {
        midiNoteNumber % 12
    }

    public func existsNaturally(in key: Key) -> Bool {
        key.noteSet.array.map({ $0.noteClass }).contains(note(in: key).noteClass)
    }
}

extension Pitch: IntRepresentable {
    public var intValue: Int {
        Int(midiNoteNumber)
    }

    public init(intValue: Int) {
        if intValue < 0 {
            midiNoteNumber = 0
        } else if intValue > 127 {
            midiNoteNumber =  127
        } else {
            midiNoteNumber = Int8(intValue)
        }
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
