import Foundation

public struct Chord: Equatable {

    public let root: NoteClass
    public let type: ChordType
    public let inversion: Int

    public init(_ root: NoteClass, type: ChordType, inversion: Int = 0) {
        self.root = root
        self.type = type
        self.inversion = inversion
    }

    public init?(notes: [Note]) {
        var set = NoteSet()
        for n in notes {
            set.add(n)
        }
        self.init(noteSet: set)
    }

    public init?(noteSet: NoteSet) {
        var r = NoteSet()
        noteSet.forEach { note in
            r.add(note.noteClass.canonicalNote)
        }

        if let info = ChordTable.shared.chords[r.hashValue] {
            self.root = info.root
            self.type = info.type
            if let firstNote = noteSet.array.first {
                self.inversion = info.noteClasses.firstIndex(of: firstNote.noteClass) ?? 0
            } else {
                self.inversion = 0
            }
        } else {
            return nil
        }
    }

    public var noteClassSet: NoteClassSet {
        let canonicalRoot = root.canonicalNote
        var result = NoteClassSet()

        result.add(canonicalRoot.noteClass)
        for interval in type.intervals {
            result.add(canonicalRoot.shiftUp(interval)!.noteClass)
        }

        return result
    }

    public var noteClasses: [NoteClass] {
        let canonicalRoot = root.canonicalNote
        var result = [canonicalRoot.noteClass]
        for interval in type.intervals {
            if let shiftedNote = canonicalRoot.shiftUp(interval) {
                result.append(shiftedNote.noteClass)
            }
        }
        return result
    }

    var isTriad: Bool {
        type.intervals.count == 2
    }

    func romanNumeralNotation(in key: Key) -> String? {
        let capitalRomanNumerals = ["I", "II", "III", "IV", "V", "VI", "VII"]
        if let index = key.primaryTriads.firstIndex(where: { $0 == self }) {
            let romanNumeral = capitalRomanNumerals[index]
            switch type {
            case .majorTriad: return romanNumeral
            case .minorTriad: return romanNumeral.lowercased()
            case .diminishedTriad: return "\(romanNumeral.lowercased())°"
            default: return nil
            }
        }
        return nil
    }

    /// Try to give this chord a name
    public var description: String {
        return "\(root)\(type)"
    }

}
