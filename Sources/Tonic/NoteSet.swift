// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

public typealias NoteSet = BitSetAdapter<Note, BitSet512>

public extension NoteSet {
    init(notes: [Note]) {
        self.init()
        for note in notes {
            add(note)
        }
    }

    var noteClassSet: NoteClassSet {
        var r = NoteClassSet()
        forEach { r.add($0.noteClass) }
        return r
    }
}
