import Foundation

/// A chord is a set of simultaneous notes.
///
/// A representation of a chord as a set of note classes, with a root note class,
/// and an inversion defined by the lowest note in the chord.
public struct Chord: Equatable {
    /// Root note class of the chord
    public let root: NoteClass

    /// The flavor of the chord (connoting which notes are played alongside the root, in some octave)
    public let type: ChordType

    /// Which note in terms of degrees from the root appears as the lowest note.
    /// Third in the bottom => 1st Inversion, Fifth => 2nd Inversion, Seventh, 3rd Inversion, etc.
    public let inversion: Int

    /// Create a chord
    /// - Parameters:
    ///   - root: Root note class of the chord
    ///   - type: The flavor of the chord (connoting which notes are played alongside the root, in some octave)
    ///   - inversion: What inversion of the chord determins which note is the lowest note of the chord
    public init(_ root: NoteClass, type: ChordType, inversion: Int = 0) {
        self.root = root
        self.type = type
        self.inversion = inversion
    }

    /// Try to initialize a chord from an array of notes.
    ///
    /// If the array does not fit into a known chord type, this initialier will fail.
    /// - Parameter notes: Note array
    public init?(notes: [Note]) {
        var set = NoteSet()
        for n in notes {
            set.add(n)
        }
        self.init(noteSet: set)
    }

    /// Try to initialize a chord from a set of notes.
    ///
    /// If the set does not fit into a known chord type, this initialier will fail.
    /// - Parameter noteSet: The set of notes
    public init?(noteSet: NoteSet) {
        var r = NoteSet()
        noteSet.forEach { r.add($0.noteClass.canonicalNote) }

        if let info = ChordTable.shared.chords[r.hashValue] {
            root = info.root
            type = info.type
            if let firstNote = noteSet.array.first {
                inversion = info.noteClasses.firstIndex(of: firstNote.noteClass) ?? 0
            } else {
                inversion = 0
            }
        } else {
            return nil
        }
    }

    /// All of the note classes that appear in this chord as a set
    public var noteClassSet: NoteClassSet {
        let canonicalRoot = root.canonicalNote
        var result = NoteClassSet()

        result.add(canonicalRoot.noteClass)
        for interval in type.intervals {
            result.add(canonicalRoot.shiftUp(interval)!.noteClass)
        }

        return result
    }

    /// All of the note classes that appear in this chord as an array
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

    /// Is this chord made up of three notes?
    public var isTriad: Bool {
        type.intervals.count == 2
    }

    /// The Roman Numeral notation for a chord, given a key.
    ///
    /// This initializer will fail if the chord does not appear in the given key.
    /// - Parameter key: Key to try to find the chord withing
    /// - Returns: Roman Numeral notation
    public func romanNumeralNotation(in key: Key) -> String? {
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
}

extension Chord: CustomStringConvertible {
    /// Name of chord in concise notation
    public var description: String {
        return "\(root)\(type)"
    }
}
