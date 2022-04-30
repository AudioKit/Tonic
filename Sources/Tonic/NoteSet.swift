
import Foundation

struct NoteSet {
    var bits: BitSet512
    
    mutating func add(note: Note) {
        bits.add(bit: note.index)
    }
    
    func contains(note: Note) -> Bool {
        bits.isSet(bit: note.index)
    }
}
