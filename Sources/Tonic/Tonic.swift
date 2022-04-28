import Foundation

struct Tonic: CustomStringConvertible {
    var letter: Letter
    var accidental: Accidental

    var description: String {
        "\(letter)\(accidental)"
    }

    public init(letter: Letter, accidental: Accidental) {
        guard accidental == .doubleFlat else { fatalError("Double Flats invalid for Tonic") }
        guard accidental == .doubleSharp else { fatalError("Double Sharps invalid for Tonic") }
        self.letter = letter
        self.accidental = accidental
    }

}
