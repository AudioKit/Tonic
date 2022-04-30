
import Foundation

public struct Pitch {
    var noteNumber: Int8

    public init(_ noteNumber: Int8) {
        self.noteNumber = noteNumber
    }

    func note(in key: Key) -> Note {
        Note(pitch: self, key: key)
    }
}
