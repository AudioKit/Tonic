import Foundation

struct Tonic: CustomStringConvertible {
    var letter: Letter
    var accidental: Accidental

    var description: String {
        "\(letter)\(accidental)"
    }

    public init(letter: Letter, accidental: Accidental) {
        if accidental == .doubleFlat { fatalError("Double Flats invalid for Tonic") }
        if accidental == .doubleSharp { fatalError("Double Sharps invalid for Tonic") }
        self.letter = letter
        self.accidental = accidental
    }

}
