import Foundation

public typealias NoteClassSet = BitSetAdapter<NoteClass, BitSet64>

/// A note letter and accidental which spell a note. This leaves out the octave of the note.
public struct NoteClass: Equatable, Hashable {

    var letter: Letter
    var accidental: Accidental

    private static let canonicalOctave = 4
    public var canonicalNote: Note {
        Note(letter, accidental: accidental, octave: NoteClass.canonicalOctave)
    }

    public init(_ letter: Letter = .C, accidental: Accidental = .natural) {
        self.letter = letter
        self.accidental = accidental
    }

    public init(index: Int) {
        self.letter = Letter(rawValue: index / Accidental.count)!
        self.accidental = Accidental(rawValue: Int8((index % Accidental.count) - Accidental.naturalIndex))!
    }

    public var index: Int {
        Accidental.count * letter.rawValue + Int(accidental.rawValue) + Accidental.naturalIndex
    }
}

extension NoteClass: CustomStringConvertible {
    public var description: String {
        return "\(letter)\(accidental)"
    }
}

extension NoteClass: IntRepresentable {
    public init(intValue: Int) {
        self.letter = Letter(rawValue: intValue / Accidental.count)!
        self.accidental = Accidental(rawValue: Int8((intValue % Accidental.count) - Accidental.naturalIndex))!
    }

    public var intValue: Int {
        Accidental.count * letter.rawValue + Int(accidental.rawValue) + 2
    }
}

