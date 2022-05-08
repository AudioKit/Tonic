import Foundation

/// A pitch with a particular spelling.
public struct Note: Equatable, Hashable {
    /// Base name for the note
    public var noteClass: NoteClass = NoteClass(.C, accidental: .natural)

    /// Convenience accessors
    public var letter: Letter { noteClass.letter }
    public var accidental: Accidental { noteClass.accidental }

    public var description: String { "\(noteClass)\(octave)"}

    /// Range from -1 to 7
    public var octave: Int = 4

    public init(_ letter: Letter = .C, accidental: Accidental = .natural, octave: Int = 4) {
        noteClass = NoteClass(letter, accidental: accidental)
        self.octave = octave
    }

    public init(pitch: Pitch, key: Key = .C) {

        let pitchClass = pitch.pitchClass
        var noteInKey: Note?

        key.noteSet.forEachNote { note in
            if note.pitch.pitchClass == pitchClass {
                noteInKey = note
            }
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


        octave = Int(Double(pitch.midiNoteNumber) / 12) - 1
    }
    
    public init(index: Int) {
        octave = (index / 35) - 1
        let letter = Letter(rawValue: (index % 35) / 5)!
        let accidental = Accidental(rawValue: Int8(index % 5) - 2)!
        noteClass = NoteClass(letter, accidental: accidental)
    }
    
    /// MIDI Note 0-127 starting at C
    public var noteNumber: Int8 {
        let octaveShift = UInt8((octave + 1) * 12)
        let note = Int(noteClass.letter.baseNote) + Int(noteClass.accidental.rawValue)
        return Int8(octaveShift) + Int8(note)
    }

    public var pitch: Pitch {
        return Pitch(noteNumber)
    }

    /// The way the note is described in a musical context (usually a key or scale)
    func spelling(in key: Key) -> NoteClass {
        Note(pitch: pitch, key: key).noteClass
    }

    public func semitones(to: Note) -> Int8 {
        pitch.semitones(to: to.pitch)
    }

    public func shiftDown(_ shift: Interval) -> Note? {
        var newNote = Note(.C, accidental: .natural, octave: 0)
        let newLetterIndex = (noteClass.letter.rawValue - (shift.degree - 1))
        let newLetter = Letter(rawValue: newLetterIndex % Letter.count)!
        let newOctave = octave + (newLetterIndex >= Letter.count ? 1 : 0)
        for accidental in Accidental.allCases {
            newNote = Note(newLetter, accidental: accidental, octave: newOctave)
            if newNote.noteNumber == Int8(noteNumber) - Int8(shift.semitones) {
                return newNote
            }
        }
        return nil
    }

    public func shiftUp(_ shift: Interval) -> Note? {
        var newNote = Note(.C, accidental: .natural, octave: 0)
        let newLetterIndex = (noteClass.letter.rawValue + (shift.degree - 1))
        let newLetter = Letter(rawValue: newLetterIndex % Letter.count)!
        let newOctave = octave + (newLetterIndex >= Letter.count ? 1 : 0)
        for accidental in Accidental.allCases {
            newNote = Note(newLetter, accidental: accidental, octave: newOctave)
            if newNote.noteNumber == Int8(noteNumber) + Int8(shift.semitones) {
                return newNote
            }
        }
        return nil
    }
    
    /// Global index of the note for use in a NoteSet
    public var index: Int {
        (octave+1) * 7 * 5 + noteClass.letter.rawValue * 5 + (Int(noteClass.accidental.rawValue)+2)
    }
}

extension Note: Comparable {
    public static func < (lhs: Note, rhs: Note) -> Bool {
        (lhs.letter, lhs.accidental, lhs.octave) < (rhs.letter, rhs.accidental, rhs.octave)
    }
}

extension Note: IntRepresentable {

    public init(intValue: Int) {
        octave = (intValue / 35) - 1
        let letter = Letter(rawValue: (intValue % 35) / 5)!
        let accidental = Accidental(rawValue: Int8(intValue % 5) - 2)!
        noteClass = NoteClass(letter, accidental: accidental)
    }

    public var intValue: Int {
        (octave+1) * 7 * 5 + noteClass.letter.rawValue * 5 + (Int(noteClass.accidental.rawValue)+2)
    }
}
