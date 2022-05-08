import Foundation

/// A scale with a root note (tonic).
public struct Key: Equatable {
    public let root: NoteClass
    public let scale: Scale
    public let noteSet: NoteSet

    /// All the chords in the key (v2)
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

        for (_, info) in table.chords where info.noteSet.isSubset(of: noteSet) && info.type != .suspendedTriad {
            chords.append(Chord(info.root, type: info.type))
        }

        let chordsStartingWithC = chords.sorted(by: {$0.root.letter < $1.root.letter})
        let rootPosition2 = chordsStartingWithC.firstIndex(where: { $0.root == root }) ?? 0
        self.chords = Array(chordsStartingWithC.rotatingLeft(positions: rootPosition2))

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
