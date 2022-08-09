import Foundation

/// A table of note sets so we can look up chord names.
class ChordTable {
    static let shared = ChordTable()

    static func hash(_ noteClasses: [NoteClass]) -> Int {
        var r = NoteSet()
        for noteClass in noteClasses {
            r.add(noteClass.canonicalNote)
        }
        return r.hashValue
    }

    static func generateChords(type: ChordType, _ r: inout [Int: Chord]) {
        let accidentals: [Accidental] = [.flat, .natural, .sharp]
        for accidental in accidentals {
            for letter in Letter.allCases {
                let root = NoteClass(letter, accidental: accidental)
                let chord = Chord(root, type: type)
                if chord.noteClasses.count <= chord.type.intervals.count {
                    // chord is not valid
                    continue
                }

                r[ChordTable.hash(chord.noteClasses)] = chord
            }
        }
    }

    static func generateAllChords() -> [Int: Chord] {
        var r: [Int: Chord] = [:]

        for chordType in ChordType.allCases {
            ChordTable.generateChords(type: chordType, &r)
        }
        print("generated \(r.count) chords")
        return r
    }

    lazy var chords: [Int: Chord] = ChordTable.generateAllChords()
}
