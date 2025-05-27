// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// A pitch with a particular spelling.
public struct Note: Sendable, Equatable, Hashable, Codable {
    /// Base name for the note
    public var noteClass: NoteClass = .init(.C, accidental: .natural)

    /// Convenience accessor for the letter of the note
    public var letter: Letter { noteClass.letter }

    /// Convenience accessor for the accidental of the note
    public var accidental: Accidental { noteClass.accidental }

    /// Range from -2 to 8
    public var octave: Int = 3

    /// Initialize the note
    ///
    /// Note that the octave ranges from C to C so a Cb4 is
    /// eleven semitones above C4 or one semitone below a C5
    /// - Parameters:
    ///   - letter: Letter of the note
    ///   - accidental: Accidental shift
    ///   - octave: Which octave the note appears in
    public init(_ letter: Letter = .C, accidental: Accidental = .natural, octave: Int = 3) {
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
        octave = Int(Double(pitch.midiNoteNumber) / 12) - 2
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
        octave = (index / 35) - 2
        let letter = Letter(rawValue: (index % 35) / 5)!
        let accidental = Accidental(rawValue: Int8(index % 5) - 2)!
        noteClass = NoteClass(letter, accidental: accidental)
    }

    /// MIDI Note 0-127 starting at C
    public var noteNumber: Int8 {
        let octaveBounds = ((octave + 2) * 12) ... ((octave + 3) * 12)
        var note = Int(noteClass.letter.baseNote) + Int(noteClass.accidental.rawValue)
        if noteClass.letter == .B && noteClass.accidental.rawValue > 0 {
            note -= 12
        }
        if noteClass.letter == .C && noteClass.accidental.rawValue < 0 {
            note += 12
        }
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
        let newOctave = (Int(pitch.midiNoteNumber) - shift.semitones) / 12 - 2

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
        
        let newOctave = newMidiNoteNumber / 12 - 2

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
        let accidentalCount = Accidental.allCases.count
        let letterCount = Letter.allCases.count
        let octaveCount = letterCount * accidentalCount
        octave = (intValue / octaveCount) - 2
        var letter = Letter(rawValue: (intValue % octaveCount) / accidentalCount)!
        var accidental = Accidental(rawValue: Int8(intValue % accidentalCount) - 2)!

        let index = intValue % octaveCount
        if index == 0 { letter = .B; accidental = .sharp}
        if index == 1 { letter = .B; accidental = .doubleSharp}
        if index == octaveCount - 2 { letter = .C; accidental = .doubleFlat}
        if index == octaveCount - 1 { letter = .C; accidental = .flat}

        noteClass = NoteClass(letter, accidental: accidental)
    }
    
    /// Global index of the note for use in a NoteSet
    public var intValue: Int {
        let accidentalCount = Accidental.allCases.count
        let letterCount = Letter.allCases.count
        let octaveCount = letterCount * accidentalCount
        
        var index = noteClass.letter.rawValue * accidentalCount + (Int(noteClass.accidental.rawValue) + 2)
        if letter == .B {
            if accidental == .sharp { index = 0}
            if accidental == .doubleSharp { index = 1}
        }
        if letter == .C {
            if accidental == .doubleFlat { index = octaveCount - 2}
            if accidental == .flat { index = octaveCount - 1}
        }

        return (octave + 2) * octaveCount + index
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
