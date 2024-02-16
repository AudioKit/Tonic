// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// A table of note sets so we can look up chord names.
public class ChordTable {
    public static let shared = ChordTable()

    static func hash(_ noteClasses: [NoteClass]) -> Int {
        var r = NoteSet()
        for noteClass in noteClasses {
            r.add(noteClass.canonicalNote)
        }
        return r.hashValue
    }

    static func generateChords(type: ChordType, _ r: inout [Int: Chord]) {
        let accidentals: [Accidental] = [.doubleFlat, .flat, .natural, .sharp, .doubleSharp]
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
        //print("generated \(r.count) chords")
        return r
    }

    lazy var chords: [Int: Chord] = ChordTable.generateAllChords()

    static func generateAllChordsIncludingEnharmonic() -> [Chord] {
        var returnChords: [Chord] = []

        let accidentals: [Accidental] = [.doubleFlat, .flat, .natural, .sharp, .doubleSharp]
        for chordType in ChordType.allCases {
            for accidental in accidentals {
                for letter in Letter.allCases {
                    let root = NoteClass(letter, accidental: accidental)
                    let chord = Chord(root, type: chordType)

                    if chord.noteClasses.count <= chord.type.intervals.count {
                        // chord is not valid
                        continue
                    }

                    returnChords.append(chord)
                }
            }
        }
        //print("generated \(returnChords.count) chords")
        return returnChords
    }

    /// All chords include enharmonic (same NoteSet) - Use "chords" alternative when enharmonic chords are not needed
    lazy var chordsIncludingEnharmonic: [Chord] = ChordTable.generateAllChordsIncludingEnharmonic()

    /// Returns all of the chord options (enharmonic chords) for a set a notes (slow but effective)
    ///
    /// - Parameter noteSet: Array of chord notes in a chosen order
    /// - Returns: array of enharmonic chords that could describe the NoteSet
    public func getAllChordsForNoteSet(_ noteSet: NoteSet) -> [Chord] {
        var returnedChords = [Chord]()
        for chord in chordsIncludingEnharmonic {
            if noteSet.noteClassSet.hashValue == chord.noteClassSet.hashValue {
                // chord comes in as root position, so we still need the inversion value
                let inversion = Chord.getInversion(noteSet: noteSet, noteClasses: chord.noteClasses)
                let chordWithInversion = Chord(chord.root, type: chord.type, inversion: inversion)
                returnedChords.append(chordWithInversion)
            }
        }
        return returnedChords
    }
}
