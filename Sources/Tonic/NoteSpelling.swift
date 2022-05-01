import Foundation

public struct NoteSpelling: Equatable, Hashable, CustomStringConvertible {
    var letter: Letter
    var accidental: Accidental

    public var description: String {
        return "\(letter)\(accidental)"
    }
}

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
