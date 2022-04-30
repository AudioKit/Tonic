import Foundation

enum Accidental: Int8, CustomStringConvertible, CaseIterable, Equatable, Hashable {
    case doubleFlat = -2
    case flat = -1
    case natural = 0
    case sharp = 1
    case doubleSharp = 2

    var description: String {
        ["𝄫", "♭", "", "♯", "𝄪"][Int(self.rawValue) + 2]
    }
}

enum Letter: Int, CaseIterable, Equatable, Hashable {
    case C, D, E, F, G, A, B

    var baseNote: UInt8 {
        return [0, 2, 4, 5, 7, 9, 11][rawValue]
    }
}
