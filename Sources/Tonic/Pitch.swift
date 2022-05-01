
import Foundation

public struct Pitch: Equatable {

    var midiNoteNumber: Int8

    public init(_ midiNoteNumber: Int8) {
        self.midiNoteNumber = midiNoteNumber
    }

    func note(in key: Key) -> Note {
        Note(pitch: self, key: key)
    }
}
