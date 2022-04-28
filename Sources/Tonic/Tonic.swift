import Foundation

enum Letter {
    case A, B, C, D, E, F, G
}

enum Accidental: Int8, CustomStringConvertible {
    case doubleflat = -2
    case flat = -1
    case natural = 0
    case sharp = 1
    case doublesharp = 2

    var description: String {
        ["𝄫", "♭", "", "♯", "𝄪"][Int(self.rawValue) + 2]
    }
}

struct Tonic: CustomStringConvertible {
    var letter: Letter
    var accidental: Accidental

    var description: String {
        "\(letter)\(accidental)"
    }

}
