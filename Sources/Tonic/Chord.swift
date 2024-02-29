// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// A chord is a set of simultaneous notes.
///
/// A representation of a chord as a set of note classes, with a root note class,
/// and an inversion defined by the lowest note in the chord.
public struct Chord: Equatable, Codable {
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
            inversion = Chord.getInversion(noteSet: noteSet, noteClasses: info.noteClasses)
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

    /// Chord Inversion value - compares the array of noteClasses with a noteSet
    ///
    /// - Parameter noteSet: Array of chord notes in a chosen order
    /// - Parameter noteClasses: Array of noteClasses for a given chord
    /// - Returns: inversion integer value
    static func getInversion(noteSet: NoteSet, noteClasses: [NoteClass]) -> Int {
        if let firstNote = noteSet.array.first {
            return noteClasses.firstIndex(of: firstNote.noteClass) ?? 0
        } else {
            return 0
        }
    }
}

extension Chord: CustomStringConvertible {
    /// Name of chord in concise notation
    public var description: String {
        return "\(root)\(type)"
    }
    
    /// Name of chord using slash chords
    public var slashDescription: String {
        if inversion > 0 {
            return "\(root)\(type)/\(bassNote)"
        } else {
            return description
        }
    }
    
    /// Name of chord using specialized Chord Symbol Fonts Norfolk or Pori from
    /// NotationExpress: https://www.notationcentral.com/product/norfolk-fonts-for-sibelius/
    public var chordFontDescription: String {
        return "\(root.chordFontDescription)\(type.chordFontDescription)"
    }
    
    /// Name of chord with slash notation using specialized Chord Symbol Fonts Norfolk or Pori from
    /// NotationExpress: https://www.notationcentral.com/product/norfolk-fonts-for-sibelius/
    public var slashChordFontDescription: String {
        if inversion > 0 {
            return "\(root.chordFontDescription)\(type.chordFontDescription)?\(bassNote.chordFontDescription)"
        } else {
            return chordFontDescription
        }
    }
    
    /// Bass Note computed from inversion and root note
    /// Useful for custom rendering of slash notation
    public var bassNote: NoteClass {
        switch inversion {
            case 1...4:
                if let bass = root.canonicalNote.shiftUp(type.intervals[inversion - 1]) {
                    return bass.noteClass
                }
            default:
                break
        }
        return root.canonicalNote.noteClass
    }
}

extension Chord {

    public var accidentalCount: Int {
        var count = 0
        for note in self.noteClasses {
            switch note.accidental {
                case .natural:
                    break
                case .flat, .sharp:
                    count += 1
                case .doubleFlat, .doubleSharp:
                    count += 2
            }
        }
        return count
    }

    /// Get chords that match a set of pitches, ranking by least number of accidentals
    public static func getRankedChords(from pitchSet: PitchSet) -> [Chord] {
        var noteArrays: Set<[Note]> = []
        var returnArray: [Chord] = []
        
        for key in Key.circleOfFifths {
            noteArrays.insert(pitchSet.array.map { Note(pitch: $0, key: key) })
        }
        
        for key in Key.circleOfFourths {
            noteArrays.insert(pitchSet.array.map { Note(pitch: $0, key: key) })
        }
        
        for noteArray in noteArrays {
            returnArray.append(contentsOf: Chord.getRankedChords(from: noteArray))
        }
        
        // Sorts anti-alphabetical, but the net effect is to pefer flats to sharps
        returnArray.sort { $0.root.letter > $1.root.letter }

        // order the array by least number of accidentals
        returnArray.sort { $0.accidentalCount < $1.accidentalCount }

        // order the array preferring root position
        returnArray.sort { $0.inversion < ($1.inversion > 0 ? 1 : 0) }

        // prefer root notes not being uncommon enharmonics
        returnArray.sort { ($0.root.canonicalNote.isUncommonEnharmonic ? 1 : 0) < ($1.root.canonicalNote.isUncommonEnharmonic ? 1 : 0) }


        return returnArray
    }
    /// Get chords from actual notes (spelling matters, C# F G# will not return a C# major)
    /// Use pitch set version of this function for all enharmonic chords
    /// The ranking is based on how low the root note of the chord appears, for example we
    /// want to list the notes C, E, G, A as C6 if the C is in the bass
    public static func getRankedChords(from notes: [Note]) -> [Chord] {
        let potentialChords = ChordTable.shared.getAllChordsForNoteSet(NoteSet(notes: notes))
        let orderedNotes = notes.sorted(by: { f, s in  f.noteNumber < s.noteNumber })
        var ranks: [(Int, Chord)] = []
        for chord in potentialChords {
            let rank = orderedNotes.firstIndex(where: { $0.noteClass == chord.root })
            ranks.append((rank ?? 0, chord))
        }
        let sortedRanks = ranks.sorted(by: { $0.0 < $1.0 })
            
        return sortedRanks.map({ $0.1 })
    }
}

extension Chord {
    /// Returns all Pitches of a certain chord, taking into account the inversion, starting at the given octave
    /// - Parameter octave: octave of the chord for inversion 0
    /// - Returns: All pitches in that Chord
    public func pitches(octave: Int) -> [Pitch] {
        return notes(octave: octave).map { $0.pitch }
    }

    /// Returns all Notes of a certain chord, taking into account the inversion, starting at the given octave
    /// - Parameter octave: initial octave of the chord for inversion 0
    /// - Returns: All notes in that chord
    public func notes(octave: Int) -> [Note] {
        // This array will store all the notes with the correct octaves
        var notes: [Note] = []
        // Convert the root note class to a note object
        let rootNote = Note(root.letter, accidental: root.accidental, octave: octave)
        // append the note to the array of our notes
        notes.append(rootNote)

        // Iterate over all intervals
        for interval in self.type.intervals {
            // Create the next note by using the shiftup function
            if let shifted = rootNote.shiftUp(interval) {
                notes.append(shifted)
            }
        }

        // Stores all shifted notes 
        var shiftedNotes: [Note] = []

        // Iterate over all inversion steps
        for step in 0..<inversion {
            // increase the right index of the base chord depending on the inversion
            let index = step % notes.count
            notes[index].octave += 1

            // if the last note still is higher increase by one again
            // This usually happens if a chord is longer than 2 Octaves
            if let last = shiftedNotes.last ?? notes.last {
                if notes[index].intValue < last.intValue {
                    notes[index].octave += 1
                }
            }
            // Append the note with the right octave to a new array to we have a properly
            // sorted array in the end
            shiftedNotes.append(notes[index])
        }

        return notes.sorted()
    }
}
