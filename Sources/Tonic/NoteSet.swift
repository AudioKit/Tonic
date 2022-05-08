import Foundation

public typealias NoteSet = BitSetAdapter<Note, BitSet512>

extension NoteSet {
    public init(notes: [Note]) {
        self.init()
        for note in notes {
            add(note)
        }
    }

    public var noteClassSet: NoteClassSet {
        var r = NoteClassSet()
        forEach { r.add($0.noteClass) }
        return r
    }
}
