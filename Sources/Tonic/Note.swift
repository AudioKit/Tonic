import Foundation

struct Note {

    /// MIDI Note 0-127 starting at C
    var noteNumber: Int8

    /// Semitone shift for accidental to distinguish defferent spelling of the note.
    var accidental: Accidental = .natural

    init(noteNumber: Int8, accidental: Accidental = .natural) {
        self.noteNumber = noteNumber
        self.accidental = accidental
    }

    init(noteNumber: Int8, letter: Letter) {
        self.noteNumber = noteNumber
        for accidental in Accidental.allCases {
            let nn = Int(noteNumber) - Int(accidental.rawValue)
            if nn < 0 || nn > 127 {
                continue
            }
            let base = Note(noteNumber: Int8(nn))
            if base.accidental == .natural && base.letter == letter {
                self.accidental = accidental
            }
        }
        print(self.spelling)
    }

    var letter: Letter {
        let whiteKeyNoteNumber = noteNumber - accidental.rawValue
        let letters: [Letter?] = [.C, nil, .D, nil, .E, .F, nil, .G, nil, .A, nil, .B]
        return letters[Int(whiteKeyNoteNumber % 12)] ?? letters[Int(whiteKeyNoteNumber % 12) - 1]!
    }

    /// The way the note is described in a musical context (usually a key or scale)
    var spelling: String {
        let whiteKeyNoteNumber = noteNumber - accidental.rawValue

        let letters: [Letter?] = [.C, nil, .D, nil, .E, .F, nil, .G, nil, .A, nil, .B]
        let letter = letters[Int(whiteKeyNoteNumber % 12)]
        if accidental == .natural && letter == nil {
            let newLetter = letters[Int(whiteKeyNoteNumber % 12) - 1]
            return "\(newLetter!)\(Accidental.sharp)"
        }
        guard let letter = letter else { return ""}

        return "\(letter)\(accidental)"
    }

    func semitones(to: Note) -> Int {
        abs(Int(noteNumber - to.noteNumber))
    }

    func shift(_ shift: Interval) -> Note {
        let letters: [Letter] = [.C, .D, .E, .F, .G, .A, .B]
        let newLetterIndex = (letters.firstIndex(of: letter)! + (shift.degree - 1)) % letters.count
        let letter = letters[newLetterIndex]
        return Note(noteNumber: noteNumber + Int8(shift.semitones), letter: letter)
    }
}
