
import Foundation

/// A set of notes represented by a bit set.
public struct NoteSet: Hashable, Equatable {
    var bits = BitSet512()
    
    public init() { }
    
    public init(notes: [Note]) {
        for note in notes {
            add(note: note)
        }
    }
    
    public mutating func add(note: Note) {
        assert(note.index < 512)
        bits.add(bit: note.index)
    }
    
    public func contains(note: Note) -> Bool {
        bits.isSet(bit: note.index)
    }
    
    public func forEachNote(f: (Note) -> ()) {
        bits.forEach { noteIndex in
            f(Note(index: noteIndex))
        }
    }

    public var count: Int {
        bits.count
    }
}
