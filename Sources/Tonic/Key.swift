// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// The key is the set of notes that are played in a composition, or portion of a composition.
///
/// A key is composed of a Root ``Note``, and a ``Scale``.
public struct Key: Equatable, Codable {
    /// The primary note class of the key, also known as the tonic
    public let root: NoteClass

    /// The intervallic relations from the root note to all other notes in the key
    public let scale: Scale

    /// A note set containing all the notes in the key
    public let noteSet: NoteSet

    /// All the traditional triads representable root, third, and fifth from each note in the key
    public let primaryTriads: [Chord]

    /// All chords that fit in the key
    public let chords: [Chord]

    /// Initialize the key
    /// - Parameters:
    ///   - root: The primary note class of the key, also known as the tonic
    ///   - scale: The intervallic relations from the root note to all other notes in the key
    public init(root: NoteClass, scale: Scale = .major) {
        self.root = root
        self.scale = scale

        var r: [Note] = []
        for interval in scale.intervals {
            if let noteClass = root.canonicalNote.shiftUp(interval)?.noteClass {
                r.append(noteClass.canonicalNote)
            }
        }
        noteSet = NoteSet(notes: r)

        let table = ChordTable.shared

        var chords: [Chord] = []
        var primaryTriads: [Chord] = []

        let allowablePrimaryTriads: [ChordType] = [.majorTriad, .minorTriad, .diminishedTriad, .augmentedTriad]

        for (_, chord) in table.chords where chord.noteClassSet.isSubset(of: noteSet.noteClassSet) {
            chords.append(Chord(chord.root, type: chord.type))
            if allowablePrimaryTriads.contains(chord.type) {
                primaryTriads.append(Chord(chord.root, type: chord.type))
            }
        }

        let primaryTriadsStartingWithC = primaryTriads.sorted(by: { $0.root.letter < $1.root.letter })
        let rootPosition = primaryTriadsStartingWithC.firstIndex(where: { $0.root == root }) ?? 0
        self.primaryTriads = Array(primaryTriadsStartingWithC.rotatingLeft(positions: rootPosition))

        self.chords = chords
    }

    /// The type of accidental to use in this key
    public var preferredAccidental: Accidental {
        if root.accidental == .sharp {
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
