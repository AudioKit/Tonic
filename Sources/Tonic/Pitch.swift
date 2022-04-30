
import Foundation

public struct Pitch {
    var noteNumber: Int8

    func note(in key: Key) -> Note {
        Note(noteNumber: noteNumber, key: key)
    }
}
