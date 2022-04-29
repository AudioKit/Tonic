import Foundation

enum Accidental: Int8, CustomStringConvertible, CaseIterable {
    case doubleFlat = -2
    case flat = -1
    case natural = 0
    case sharp = 1
    case doubleSharp = 2

    var description: String {
        ["𝄫", "♭", "", "♯", "𝄪"][Int(self.rawValue) + 2]
    }
}

enum Letter {
    case A, B, C, D, E, F, G
}
