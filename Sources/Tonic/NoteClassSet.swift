
import Foundation

/// A set of note classes represented by a bit set.
public struct NoteClassSet: Hashable, Equatable {

    var bits = BitSet64()

    public init() { }

    public init(noteClasses: [NoteClass]) {
        for noteClass in noteClasses {
            add(noteClass: noteClass)
        }
    }

    public init(bits: BitSet64) {
        self.bits = bits
    }

    public mutating func add(noteClass: NoteClass) {
        bits.add(bit: noteClass.index)
    }

    public func contains(_ noteClass: NoteClass) -> Bool {
        bits.isSet(bit: noteClass.index)
    }

    public func forEachNoteClass(f: (NoteClass) -> ()) {
        bits.forEach { index in
            f(NoteClass(index: index))
        }
    }

    public var count: Int {
        bits.count
    }

}
