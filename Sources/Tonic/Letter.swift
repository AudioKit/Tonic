import Foundation

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
