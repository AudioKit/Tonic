// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// A pitch with a particular spelling.
public struct Note: Equatable, Hashable, Codable {
    /// Base name for the note
    public var noteClass: NoteClass = .init(.C, accidental: .natural)

    /// Convenience accessor for the letter of the note
    public var letter: Letter { noteClass.letter }

    /// Convenience accessor for the accidental of the note
    public var accidental: Accidental { noteClass.accidental }

    /// Range from -1 to 7
    public var octave: Int = 4

    /// Initialize the note
    ///
    /// Note that the octave ranges from C to C so a Cb4 is
    /// eleven semitones above C4 or one semitone below a C5
    /// - Parameters:
    ///   - letter: Letter of the note
    ///   - accidental: Accidental shift
    ///   - octave: Which octave the note appears in
    public init(_ letter: Letter = .C, accidental: Accidental = .natural, octave: Int = 4) {
        noteClass = NoteClass(letter, accidental: accidental)
        self.octave = octave
    }

    /// Initaliize the note from a pitch, given the key
    ///
    /// Tonic will find best note matching the pitch in the given key.
    /// - Parameters:
    ///   - pitch: Pitch, or essentially the midi note number of a note
    ///   - key: Key in which to search for the appropriate note
    public init(pitch: Pitch, key: Key = .C) {
        octave = Int(Double(pitch.midiNoteNumber) / 12) - 1

        let pitchClass = pitch.pitchClass
        var noteInKey: Note?

        key.noteSet.forEach { note in
            if note.pitch.pitchClass == pitchClass {
                noteInKey = note
            }
        }
        // The octave is wrong if the letter is C and we've flattened into the previous octave
        if noteInKey?.noteClass.letter == .C && [Accidental.flat, Accidental.doubleFlat].contains(noteInKey?.accidental) {
            octave += 1
        }

        if let note = noteInKey {
            noteClass = note.noteClass
        } else {
            if key.preferredAccidental == .sharp {
                let letters: [Letter] = [.C, .C, .D, .D, .E, .F, .F, .G, .G, .A, .A, .B]
                let letter = letters[Int(pitchClass)]

                let accidentals: [Accidental] = [.natural, .sharp, .natural, .sharp, .natural, .natural, .sharp, .natural, .sharp, .natural, .sharp, .natural]
                let accidental = accidentals[Int(pitchClass)]
                noteClass = NoteClass(letter, accidental: accidental)
            } else {
                let letters: [Letter] = [.C, .D, .D, .E, .E, .F, .G, .G, .A, .A, .B, .B]
                let letter = letters[Int(pitchClass)]

                let accidentals: [Accidental] = [.natural, .flat, .natural, .flat, .natural, .natural, .flat, .natural, .flat, .natural, .flat, .natural]
                let accidental = accidentals[Int(pitchClass)]
                noteClass = NoteClass(letter, accidental: accidental)
            }
        }
    }

    /// Initialize from raw value
    /// - Parameter index: integer represetnation
    public init(index: Int) {
        octave = (index / 35) - 1
        let letter = Letter(rawValue: (index % 35) / 5)!
        let accidental = Accidental(rawValue: Int8(index % 5) - 2)!
        noteClass = NoteClass(letter, accidental: accidental)
    }

    /// MIDI Note 0-127 starting at C
    public var noteNumber: Int8 {
        let octaveBounds = ((octave + 1) * 12) ... ((octave + 2) * 12)
        var note = Int(noteClass.letter.baseNote) + Int(noteClass.accidental.rawValue)
        while !octaveBounds.contains(note) {
            note += 12
        }
        return Int8(note)
    }

    /// The pitch for the note
    public var pitch: Pitch {
        return Pitch(noteNumber)
    }

    /// The way the note is described in a musical context (usually a key or scale)
    public func spelling(in key: Key) -> NoteClass {
        Note(pitch: pitch, key: key).noteClass
    }

    /// Calculate the distance in semitones to another note
    /// - Parameter next: note to which you want to know the distance
    /// - Returns: Number of semitones to the next note
    public func semitones(to next: Note) -> Int8 {
        pitch.semitones(to: next.pitch)
    }

    /// Shift the note down by an interval
    /// - Parameter shift: The interval by which to shift
    /// - Returns: New note the correct distance away
    public func shiftDown(_ shift: Interval) -> Note? {
        var newLetterIndex = (noteClass.letter.rawValue - (shift.degree - 1))
        let newOctave = (Int(pitch.midiNoteNumber) - shift.semitones) / 12 - 1

        while newLetterIndex < 0 {
            newLetterIndex += 7
        }

        let newLetter = Letter(rawValue: newLetterIndex % Letter.allCases.count)!
        for accidental in Accidental.allCases {
            let newNote = Note(newLetter, accidental: accidental, octave: newOctave)
            if (newNote.noteNumber % 12) == ((Int(noteNumber) - shift.semitones) % 12) {
                return newNote
            }
        }
        return nil
    }

    /// Shift the note up by an interval
    /// - Parameter shift: The interval by which to shift
    /// - Returns: New note the correct distance away
    public func shiftUp(_ shift: Interval) -> Note? {
        let newLetterIndex = (noteClass.letter.rawValue + (shift.degree - 1))
        let newLetter = Letter(rawValue: newLetterIndex % Letter.allCases.count)!
        let newMidiNoteNumber = Int(pitch.midiNoteNumber) + shift.semitones

        let newOctave = newMidiNoteNumber / 12 - 1

        for accidental in Accidental.allCases {
            let newNote = Note(newLetter, accidental: accidental, octave: newOctave)
            if newNote.noteNumber % 12 == newMidiNoteNumber % 12 {
                return newNote
            }
        }
        return nil
    }
}

extension Note: Comparable {
    public static func < (lhs: Note, rhs: Note) -> Bool {
        lhs.pitch < rhs.pitch
    }
}

extension Note: IntRepresentable {
    public init(intValue: Int) {
        octave = (intValue / 35) - 1
        let letter = Letter(rawValue: (intValue % 35) / 5)!
        let accidental = Accidental(rawValue: Int8(intValue % 5) - 2)!
        noteClass = NoteClass(letter, accidental: accidental)
    }

    /// Global index of the note for use in a NoteSet
    public var intValue: Int {
        (octave + 1) * 7 * 5 + noteClass.letter.rawValue * 5 + (Int(noteClass.accidental.rawValue) + 2)
    }
}

extension Note: CustomStringConvertible {
    /// String representation of the note, including octave
    public var description: String {
        "\(noteClass)\(octave)"
    }
}

extension Note {
    var isUncommonEnharmonic: Bool {
        let uglyNotes: [NoteClass] = [.Cb, .Es, .Fb, .Bs]
        return uglyNotes.contains(self.noteClass)
    }
}
