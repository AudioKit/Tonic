import Foundation

public typealias NoteClassSet = BitSetAdapter<NoteClass, BitSet64>

/// A note letter and accidental which spell a note. This leaves out the octave of the note.
public struct NoteClass: Equatable, Hashable, CustomStringConvertible {

    var letter: Letter
    var accidental: Accidental

    public var description: String {
        return "\(letter)\(accidental)"
    }

    private static let canonicalOctave = 4
    internal var canonicalNote: Note {
        Note(letter, accidental: accidental, octave: NoteClass.canonicalOctave)
    }

    public init(_ letter: Letter = .C, accidental: Accidental = .natural) {
        self.letter = letter
        self.accidental = accidental
    }

    public init(index: Int) {
        self.letter = Letter(rawValue: index / 5)!
        self.accidental = Accidental(rawValue: Int8((index % 5) - 2))!
    }

    public var index: Int {
        5 * letter.rawValue + Int(accidental.rawValue) + 2
    }
}

extension NoteClass: IntRepresentable {
    public init(intValue: Int) {
        self.letter = Letter(rawValue: intValue / 5)!
        self.accidental = Accidental(rawValue: Int8((intValue % 5) - 2))!
    }

    public var intValue: Int {
        5 * letter.rawValue + Int(accidental.rawValue) + 2
    }
}

/// A semitone offset applied to a note.
public enum Accidental: Int8, CustomStringConvertible, CaseIterable, Equatable, Hashable, Comparable {
    public static func < (lhs: Accidental, rhs: Accidental) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    case doubleFlat = -2
    case flat = -1
    case natural = 0
    case sharp = 1
    case doubleSharp = 2

    public var description: String {
        ["𝄫", "♭", "", "♯", "𝄪"][Int(self.rawValue) + 2]
    }
}

/// The names for the "white key" notes.
public enum Letter: Int, CaseIterable, Equatable, Hashable, Comparable {
    public static func < (lhs: Letter, rhs: Letter) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    case C, D, E, F, G, A, B

    var baseNote: UInt8 {
        return [0, 2, 4, 5, 7, 9, 11][rawValue]
    }

    static let count = 7
}
