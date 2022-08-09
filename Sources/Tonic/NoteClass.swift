import Foundation

public typealias NoteClassSet = BitSetAdapter<NoteClass, BitSet64>

/// A note letter and accidental which spell a note. This leaves out the octave of the note.
public struct NoteClass: Equatable, Hashable {
    /// Letter of the note class
    public var letter: Letter

    /// Accidental of the note class
    public var accidental: Accidental

    private static let canonicalOctave = 4

    /// A representative note for this class, in the canonical octave, which is 4
    public var canonicalNote: Note {
        Note(letter, accidental: accidental, octave: NoteClass.canonicalOctave)
    }

    /// Initialize the note class
    /// - Parameters:
    ///   - letter: Letter of the note class
    ///   - accidental: Accidental of the note class
    public init(_ letter: Letter = .C, accidental: Accidental = .natural) {
        self.letter = letter
        self.accidental = accidental
    }
}

extension NoteClass: CustomStringConvertible {
    /// String representation of the note class
    public var description: String {
        return "\(letter)\(accidental)"
    }
}

extension NoteClass: IntRepresentable {
    public init(intValue: Int) {
        letter = Letter(rawValue: intValue / Accidental.count)!
        accidental = Accidental(rawValue: Int8((intValue % Accidental.count) - Accidental.naturalIndex))!
    }

    public var intValue: Int {
        Accidental.count * letter.rawValue + Int(accidental.rawValue) + Accidental.naturalIndex
    }
}
