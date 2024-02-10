import Foundation

/// Private Octave enumeration for octave related functions
/// Will make it public once the entirety of Tonic uses it well
enum Octave: Int {
    case negative1 = -1
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9

    init?(of pitch:Pitch) {
        let octaveInt = Int(pitch.midiNoteNumber) / 12 - 1
        if let octave = Octave(rawValue: octaveInt) {
            self = octave
        } else {
            return nil
        }
    }

    var midiNoteRange: ClosedRange<Int> {
        return (self.rawValue + 1) * 12 ... (self.rawValue + 2) * 12
    }
}
