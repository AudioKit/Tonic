import Foundation

public struct Note: Equatable, Hashable {
    /// Base name for the note
    public var letter: Letter = .C

    /// Semitone shift for the letter
    public var accidental: Accidental = .natural

    /// Range from -1 to 7
    public var octave: Int = 4

    public init(_ letter: Letter = .C, accidental: Accidental = .natural, octave: Int = 4) {
        self.letter = letter
        self.accidental = accidental
        self.octave = octave
    }

    public init(pitch: Pitch, key: Key = .C) {

        let noteNumber = pitch.midiNoteNumber
        let baseNoteNumber = noteNumber % 12

        let keyNotes = key.notes.map { $0.noteNumber % 12 }
        if let index = keyNotes.firstIndex(of: baseNoteNumber) {
            letter = key.notes[index].letter
            accidental = key.notes[index].accidental
        } else {
            if key.preferredAccidental == .sharp {
                let letters: [Letter] = [.C, .C, .D, .D, .E, .F, .F, .G, .G, .A, .A, .B]
                letter = letters[Int(noteNumber % 12)]

                let accidentals: [Accidental] = [.natural, .sharp, .natural, .sharp, .natural, .natural, .sharp, .natural, .sharp, .natural, .sharp, .natural]
                accidental = accidentals[Int(noteNumber % 12)]

            } else {
                let letters: [Letter] = [.C, .D, .D, .E, .E, .F, .G, .G, .A, .A, .B, .B]
                letter = letters[Int(noteNumber % 12)]

                let accidentals: [Accidental] = [.natural, .flat, .natural, .flat, .natural, .natural, .flat, .natural, .flat, .natural, .flat, .natural]
                accidental = accidentals[Int(noteNumber % 12)]
            }
        }


        octave = Int(Double(noteNumber) / 12) - 1
    }
    
    public init(index: Int) {
        octave = (index / 35) - 1
        letter = Letter(rawValue: (index % 35) / 5)!
        accidental = Accidental(rawValue: Int8(index % 5) - 2)!
    }
    
    /// MIDI Note 0-127 starting at C
    public var noteNumber: Int8 {
        let octaveShift = UInt8((octave + 1) * 12)
        let note = Int(letter.baseNote) + Int(accidental.rawValue)
        return Int8(octaveShift) + Int8(note)
    }

    public var pitch: Pitch {
        let octaveShift = UInt8((octave + 1) * 12)
        let note = Int(letter.baseNote) + Int(accidental.rawValue)
        return Pitch(Int8(octaveShift) + Int8(note))
    }

    /// The way the note is described in a musical context (usually a key or scale)
    public var spelling: String {
        return "\(letter)\(accidental)"
    }

    func spelling(in key: Key) -> String {
        Note(pitch: pitch, key: key).spelling
    }

    public func semitones(to: Note) -> Int {
        abs(Int(noteNumber - to.noteNumber))
    }

    public func shiftDown(_ shift: Interval) -> Note? {
        var newNote = Note(.C, accidental: .natural, octave: 0)
        let newLetterIndex = (letter.rawValue - (shift.degree - 1))
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
        let newLetterIndex = (letter.rawValue + (shift.degree - 1))
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

    /// Returns representative note in canonical octave.
    public var pitchClass: Note {
        Note(letter, accidental: accidental, octave: 4)
    }
    
    /// Global index of the note for use in a NoteSet
    public var index: Int {
        (octave+1) * 7 * 5 + letter.rawValue * 5 + (Int(accidental.rawValue)+2)
    }
}

extension Note: Comparable {
    public static func < (lhs: Note, rhs: Note) -> Bool {
        (lhs.letter, lhs.accidental, lhs.octave) < (rhs.letter, rhs.accidental, rhs.octave)
    }
}
