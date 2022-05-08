import Foundation

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
