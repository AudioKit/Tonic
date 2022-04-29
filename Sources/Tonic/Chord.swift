
import Foundation

struct Chord {

    // Since we don't have a UInt128
    var highNotes: UInt64
    var lowNotes: UInt64

    var isTriad: Bool {
        lowNotes.nonzeroBitCount + highNotes.nonzeroBitCount == 3
    }
}
