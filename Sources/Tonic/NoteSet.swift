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

    public init(bits: BitSet512) {
        self.bits = bits
    }
    
    public mutating func add(note: Note) {
        assert(note.index < 512)
        bits.add(bit: note.index)
    }
    
    public func contains(_ note: Note) -> Bool {
        bits.isSet(bit: note.index)
    }
    
    public func forEachNote(f: (Note) -> ()) {
        bits.forEach { noteIndex in
            f(Note(index: noteIndex))
        }
    }

    public var notes: [Note] {
        var r: [Note] = []
        forEachNote { n in
            r.append(n)
        }
        return r
    }

    public var count: Int {
        bits.count
    }
}

extension NoteSet: SetAlgebra {

    public func union(_ other: __owned NoteSet) -> NoteSet {
        NoteSet(bits: bits.union(other.bits))
    }

    public func intersection(_ other: NoteSet) -> NoteSet {
        NoteSet(bits: bits.intersection(other.bits))
    }

    public func symmetricDifference(_ other: __owned NoteSet) -> NoteSet {
        NoteSet(bits: bits.symmetricDifference(other.bits))
    }

    public mutating func insert(_ newMember: __owned Note) -> (inserted: Bool, memberAfterInsert: Note) {
        let (inserted, memberAfter) = bits.insert(Int(newMember.index))
        return (inserted, Note(index: memberAfter))
    }

    public mutating func remove(_ member: Note) -> Note? {
        if let i = bits.remove(Int(member.index)) {
            return Note(index: i)
        } else {
            return nil
        }
    }

    public mutating func update(with newMember: __owned Note) -> Note? {
        if let i = bits.update(with: Int(newMember.index)) {
            return Note(index: i)
        } else {
            return nil
        }
    }

    public mutating func formUnion(_ other: __owned NoteSet) {
        bits.formUnion(other.bits)
    }

    public mutating func formIntersection(_ other: NoteSet) {
        bits.formIntersection(other.bits)
    }

    public mutating func formSymmetricDifference(_ other: __owned NoteSet) {
        bits.formSymmetricDifference(other.bits)
    }

    public typealias Element = Note

    public typealias ArrayLiteralElement = Note
}
