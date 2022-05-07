
import Foundation

public struct Chord2: Equatable {

    public let root: NoteClass
    public let type: ChordType

    public init(_ root: NoteClass, type: ChordType) {
        self.root = root
        self.type = type
    }

    public var noteClasses: NoteClassSet {
        let canonicalRoot = root.canonicalNote
        var result = NoteClassSet()

        for interval in type.intervals {
            result.add(noteClass: canonicalRoot.shiftUp(interval)!.noteClass)
        }

        return result
    }

    var isTriad: Bool {
        type.intervals.count == 2
    }
    
}
