import Foundation

/// A scale with a root note (tonic).
public struct Key: Equatable {
    public let root: NoteClass
    public let scale: Scale
    public let noteSet: NoteSet

    /// All the chords in the key.
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
        var chordInfos: [TriadInfo] = []

        for (_, info) in table.triads {
            if info.noteSet.isSubset(of: noteSet) {
                chordInfos.append(info)
            }
        }
        let chordsInfosStartingWithC = chordInfos.sorted(by: {$0.root.letter < $1.root.letter})
        let rootPosition = chordsInfosStartingWithC.firstIndex(where: { $0.root == root }) ?? 0
        chords = Array(chordsInfosStartingWithC.map { Chord(noteSet: $0.noteSet) }.rotatingLeft(positions: rootPosition))
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
