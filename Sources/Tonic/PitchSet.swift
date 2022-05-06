
import Foundation

/// A set of pitches represented by a bit set.
///
/// Addresses all possible combinations of simultaneous MIDI notes.
public struct PitchSet: Hashable, Equatable {

    var bits = BitSet128()

    public init() { }

    public init(pitches: [Pitch]) {
        for pitch in pitches {
            add(pitch: pitch)
        }
    }

    public init(numbers: [Int8]) {
        for n in numbers {
            add(pitch: Pitch(n))
        }
    }

    public init(bits: BitSet128) {
        self.bits = bits
    }

    public mutating func add(pitch: Pitch) {
        bits.add(bit: Int(pitch.midiNoteNumber))
    }

    public func contains(_ pitch: Pitch) -> Bool {
        bits.isSet(bit: Int(pitch.midiNoteNumber))
    }

    public func forEachPitch(f: (Pitch) -> ()) {
        bits.forEach { noteIndex in
            f(Pitch(Int8(noteIndex)))
        }
    }

    public var count: Int {
        bits.count
    }

    func chord(in key: Key) -> Chord {
        var c = Chord(notes: [])
        forEachPitch { p in
            c.add(note: p.note(in: key))
        }
        return c
    }
}

extension PitchSet: SetAlgebra {

    public func union(_ other: __owned PitchSet) -> PitchSet {
        PitchSet(bits: bits.union(other.bits))
    }

    public func intersection(_ other: PitchSet) -> PitchSet {
        PitchSet(bits: bits.intersection(other.bits))
    }

    public func symmetricDifference(_ other: __owned PitchSet) -> PitchSet {
        PitchSet(bits: bits.symmetricDifference(other.bits))
    }

    public mutating func insert(_ newMember: __owned Pitch) -> (inserted: Bool, memberAfterInsert: Pitch) {
        let (inserted, memberAfter) = bits.insert(Int(newMember.midiNoteNumber))
        return (inserted, Pitch(Int8(memberAfter)))
    }

    public mutating func remove(_ member: Pitch) -> Pitch? {
        if let i = bits.remove(Int(member.midiNoteNumber)) {
            return Pitch(Int8(i))
        } else {
            return nil
        }
    }

    public mutating func update(with newMember: __owned Pitch) -> Pitch? {
        if let i = bits.update(with: Int(newMember.midiNoteNumber)) {
            return Pitch(Int8(i))
        } else {
            return nil
        }
    }

    public mutating func formUnion(_ other: __owned PitchSet) {
        bits.formUnion(other.bits)
    }

    public mutating func formIntersection(_ other: PitchSet) {
        bits.formIntersection(other.bits)
    }

    public mutating func formSymmetricDifference(_ other: __owned PitchSet) {
        bits.formSymmetricDifference(other.bits)
    }

    public typealias Element = Pitch

    public typealias ArrayLiteralElement = Pitch
}
