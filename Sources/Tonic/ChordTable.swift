import Foundation


public enum TriadType {
    case major, minor, diminished, augmented, suspended

    var chordType: ChordType {
        switch self {
        case .major: return .majorTriad
        case .minor: return .minorTriad
        case .diminished: return .diminishedTriad
        case .augmented: return .augmentedTriad
        case .suspended: return .suspendedTriad
        }
    }
}

public struct TriadInfo {
    var root: NoteClass
    var type: TriadType
    var noteClasses: [NoteClass]
    var noteSet: NoteSet {
        NoteSet(notes: noteClasses.map(\.canonicalNote))
    }
}



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

    static func generateTriads(third: Interval, fifth: Interval, type: TriadType, _ r: inout [Int: TriadInfo]) {
        let accidentals: [Accidental] = [.flat, .natural, .sharp]
        for accidental in accidentals {
            for letter in Letter.allCases {
                let root = NoteClass(letter, accidental: accidental)
                let noteClasses: [NoteClass] = [root,
                                                root.canonicalNote.shiftUp(third)?.noteClass,
                                                root.canonicalNote.shiftUp(fifth)?.noteClass]
                    .compactMap { $0 }
                if noteClasses.count == 3 {
                    r[ChordTable.hash(noteClasses)] = TriadInfo(root: root,
                                                                type: type,
                                                                noteClasses: noteClasses)
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
        ChordTable.generateTriads(third: .P4, fifth: .P5, type: .suspended, &r)

        print("generated \(r.count) triads")

        return r
    }

    lazy var triads: [Int: TriadInfo] = ChordTable.generateAllTriads()
}

