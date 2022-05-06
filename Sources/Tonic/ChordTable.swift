import Foundation

/// A table of note sets so we can look up chord names.
public class ChordTable {

    static let shared = ChordTable()

    static func hashPitchClasses(notes: [Note]) -> Int {
        var r = NoteSet()
        for note in notes {
            r.add(note: note.noteClass)
        }
        return r.hashValue
    }

    static func generateTriads(third: Interval, fifth: Interval, type: TriadType, _ r: inout [Int: TriadInfo]) {
        let accidentals: [Accidental] = [.flat, .natural, .sharp]
        for accidental in accidentals {
            for letter in Letter.allCases {
                let root = Note(letter, accidental: accidental)
                let notes = [root, root.shiftUp(third), root.shiftUp(fifth)].compactMap { $0 }
                if notes.count == 3 {
                    r[ChordTable.hashPitchClasses(notes: notes)] = TriadInfo(root: root,
                                                                             type: type,
                                                                             notes: NoteSet(notes: notes))
                }
            }
        }
    }

    static func generateAllTriads() -> [Int: TriadInfo] {
        var r: [Int: TriadInfo] = [:]

        ChordTable.generateTriads(third: .M3, fifth: .P5, type: .major, &r)
        ChordTable.generateTriads(third: .m3, fifth: .P5, type: .minor, &r)
        ChordTable.generateTriads(third: .m3, fifth: .d5, type: .diminished, &r)
        ChordTable.generateTriads(third: .M3, fifth: .A5, type: .augmented, &r)

        print("generated \(r.count) triads")

        return r
    }

    lazy var triads: [Int: TriadInfo] = ChordTable.generateAllTriads()
}

