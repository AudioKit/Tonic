
import Foundation

/// A set of notes represented by a bit set.
struct NoteSet: Hashable {
    var bits = BitSet512()
    
    mutating func add(note: Note) {
        assert(note.index < 512)
        bits.add(bit: note.index)
    }
    
    func contains(note: Note) -> Bool {
        bits.isSet(bit: note.index)
    }
    
    func forEachNote(f: (Note) -> ()) {
        bits.forEach { noteIndex in
            f(Note(index: noteIndex))
        }
    }
}
