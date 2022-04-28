import Foundation

struct Tonic: CustomStringConvertible {
    var letter: Letter
    var accidental: Accidental

    var description: String {
        "\(letter)\(accidental)"
    }

}
