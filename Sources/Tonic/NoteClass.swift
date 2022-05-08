import Foundation

public typealias NoteClassSet = BitSetAdapter<NoteClass, BitSet64>

/// A note letter and accidental which spell a note. This leaves out the octave of the note.
public struct NoteClass: Equatable, Hashable {

    var letter: Letter
    var accidental: Accidental

    private static let canonicalOctave = 4
    internal var canonicalNote: Note {
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

/// A semitone offset applied to a note.
public enum Accidental: Int8, CaseIterable, Equatable, Hashable {

    static var count: Int { Accidental.allCases.count }
    static var naturalIndex: Int { count / 2}


    case doubleFlat = -2
    case flat = -1
    case natural = 0
    case sharp = 1
    case doubleSharp = 2
}

extension Accidental: CustomStringConvertible {
    public var description: String {
        ["𝄫", "♭", "", "♯", "𝄪"][Int(self.rawValue) + Accidental.naturalIndex]
    }
}

extension Accidental: Comparable {
    public static func < (lhs: Accidental, rhs: Accidental) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

}

/// The names for the "white key" notes.
public enum Letter: Int, CaseIterable, Equatable, Hashable {
    case C, D, E, F, G, A, B

    var baseNote: UInt8 {
        return [0, 2, 4, 5, 7, 9, 11][rawValue]
    }
}

extension Letter: Comparable {
    public static func < (lhs: Letter, rhs: Letter) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
