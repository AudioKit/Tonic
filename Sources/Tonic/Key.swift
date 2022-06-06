import Foundation

/// A scale with a root note (tonic).
public struct Key: Equatable {
    public let root: NoteClass
    public let scale: Scale
    public let noteSet: NoteSet

    /// All the traditional triads
    public let primaryTriads: [Chord]

    /// All chords that fit in the key
    public let chords: [Chord]

    public init(root: NoteClass, scale: Scale = .major) {
        self.root = root
        self.scale = scale

        var r = [root.canonicalNote]

        for interval in scale.intervals {
            if let noteClass = root.canonicalNote.shiftUp(interval)?.noteClass {
                r.append(noteClass.canonicalNote)
            }
        }
        self.noteSet = NoteSet(notes: r)

        let table = ChordTable.shared

        var chords: [Chord] = []
        var primaryTriads: [Chord] = []

        let allowablePrimaryTriads: [ChordType] = [.majorTriad, .minorTriad, .diminishedTriad]

        for (_, chord) in table.chords where chord.noteClassSet.isSubset(of: noteSet.noteClassSet) {
            chords.append(Chord(chord.root, type: chord.type))
            if allowablePrimaryTriads.contains(chord.type) {
                primaryTriads.append(Chord(chord.root, type: chord.type))
            }
        }


        let primaryTriadsStartingWithC = primaryTriads.sorted(by: {$0.root.letter < $1.root.letter})
        let rootPosition = primaryTriadsStartingWithC.firstIndex(where: { $0.root == root }) ?? 0
        self.primaryTriads = Array(primaryTriadsStartingWithC.rotatingLeft(positions: rootPosition))

        self.chords = chords

    }

    public var preferredAccidental: Accidental {
        if root.accidental == .sharp  {
            return .sharp
        }
        if root.accidental == .flat {
            return .flat
        }

        let naturalKeysWithFlats: [Key] = [.F, .d, .g, .c, .f]
        if naturalKeysWithFlats.contains(self) {
            return .flat
        }
        return .sharp
    }

}

extension RangeReplaceableCollection {
    func rotatingLeft(positions: Int) -> SubSequence {
        let index = self.index(startIndex, offsetBy: positions, limitedBy: endIndex) ?? endIndex
        return self[index...] + self[..<index]
    }
}
