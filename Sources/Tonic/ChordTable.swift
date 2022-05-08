import Foundation

/// A table of note sets so we can look up chord names.
public class ChordTable {

    static let shared = ChordTable()

    static func hash(_ noteClasses: [NoteClass]) -> Int {
        var r = NoteSet()
        for noteClass in noteClasses {
            r.add(note: noteClass.canonicalNote)
        }
        return r.hashValue
    }

    static func generateChords(type: ChordType, _ r: inout [Int: ChordInfo]) {
        let accidentals: [Accidental] = [.flat, .natural, .sharp]
        for accidental in accidentals {
            for letter in Letter.allCases {
                let root = NoteClass(letter, accidental: accidental)
                let chord = Chord(root, type: type)
                if chord.noteClasses.count <= chord.type.intervals.count {
                    // chord is not valid
                    continue
                }

                r[ChordTable.hash(chord.noteClasses)] = ChordInfo(root: root,
                                                                  type: type,
                                                                  noteClasses: chord.noteClasses)
            }
        }
    }

    static func generateAllChords() -> [Int: ChordInfo] {
        var r: [Int: ChordInfo] = [:]

        ChordTable.generateChords(type: .majorTriad, &r)
        ChordTable.generateChords(type: .minorTriad, &r)
        ChordTable.generateChords(type: .diminishedTriad, &r)
        ChordTable.generateChords(type: .augmentedTriad, &r)
        ChordTable.generateChords(type: .suspendedTriad, &r)

        print("generated \(r.count) triads")

        return r
    }

    lazy var chords: [Int: ChordInfo] = ChordTable.generateAllChords()
}

