
import Foundation

public struct Chord2: Equatable {

    public let root: NoteClass
    public let type: ChordType
    public let inversion: Int

    public init(_ root: NoteClass, type: ChordType, inversion: Int = 0) {
        self.root = root
        self.type = type
        self.inversion = inversion
    }

    public init?(noteSet: NoteSet) {
        var r = NoteSet()
        noteSet.forEachNote { note in
            r.add(note: note.noteClass.canonicalNote)
        }

        if let info = ChordTable.shared.triads[r.hashValue] {
            self.root = info.root
            self.type = info.type.chordType
            if let firstNote = noteSet.notes.first {
                self.inversion = info.noteClasses.firstIndex(of: firstNote.noteClass) ?? 0
            } else {
                self.inversion = 0
            }
        } else {
            return nil
        }
    }

    public var noteClasses: NoteClassSet {
        let canonicalRoot = root.canonicalNote
        var result = NoteClassSet()

        for interval in type.intervals {
            result.add(noteClass: canonicalRoot.shiftUp(interval)!.noteClass)
        }

        return result
    }

    var isTriad: Bool {
        type.intervals.count == 2
    }

    func romanNumeralNotation(in key: Key) -> String? {
        let capitalRomanNumerals = ["I", "II", "III", "IV", "V", "VI", "VII"]
        if let index = key.chords2.firstIndex(where: { $0 == self }) {
            let romanNumeral = capitalRomanNumerals[index]
            switch type {
            case .majorTriad: return romanNumeral
            case .minorTriad: return romanNumeral.lowercased()
            case .diminishedTriad: return "\(romanNumeral.lowercased())°"
            case .augmentedTriad: return "\(romanNumeral)⁺"
            default: return nil
            }
        }
        return nil
    }

    /// Try to give this chord a name
    public var description: String {

        switch type {
        case .majorTriad: return "\(root)"
        case .minorTriad: return "\(root)m"
        case .diminishedTriad: return "\(root)°"
        case .augmentedTriad: return "\(root)⁺"
        default:
            return "unknown chord"
        }

    }

}
