// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// A chord is a set of simultaneous notes.
///
/// A representation of a chord as a set of note classes, with a root note class,
/// and an inversion defined by the lowest note in the chord.
public struct Chord: Sendable, Equatable, Hashable, Codable {
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
    /// If the array does not fit into a known chord type, this initializer will fail.
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
            case .major: return romanNumeral
            case .minor: return romanNumeral.lowercased()
            case .dim: return "\(romanNumeral.lowercased())°"
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
            case 1...type.intervals.count:
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
    
    /// Get chords from a PitchSet, ranked by simplicity of notation
    /// - Parameters:
    ///   - pitchSet: Pitches to be analyzed
    ///   - allowTheoreticalChords: This algorithim will provide chords with double flats, double sharps, and inergonomic root notes like E# and Cb
    public static func getRankedChords(from pitchSet: PitchSet, allowTheoreticalChords: Bool = false) -> [Chord] {
        var enharmonicNoteArrays: [[Note]] = []
        var returnArray: [Chord] = []
        for pitch in pitchSet.array {
            let octave = pitch.note(in: .C).octave
            var noteArray: [Note] = []
            for letter in Letter.allCases {
                for accidental in Accidental.allCases {
                    var intValue = Int(letter.baseNote) + Int(accidental.rawValue)
                    if intValue > 11 {
                        intValue -= 12
                    }
                    if intValue < 0 {
                        intValue += 12
                    }
                    if pitch.midiNoteNumber % 12 == intValue {
                        noteArray.append(Note(letter, accidental: accidental, octave: octave))
                    }
                }
            }
            noteArray.sort { n1, n2 in
                abs(n1.accidental.rawValue) < abs(n2.accidental.rawValue)
            }
            enharmonicNoteArrays.append(noteArray)
        }
        let chordSearchIntervalArray: [[Interval]] =
        [[.M3, .m3], [.P5, .d5], [.M7, .m7], [.M9, .m9, .A9], [.P11, .A11], [.M13, .m13, .A13]]
        
        var foundNoteArrays: [[Note]] = []
        for enharmonicNoteArray in enharmonicNoteArrays {
            for rootNote in enharmonicNoteArray {
                var usedNoteArrays: [[Note]] = [enharmonicNoteArray]
                var foundNotes: [Note] = []
                foundNotes.append(rootNote)
                for nextIntervals in chordSearchIntervalArray {
                    var foundNote = false
                    for nextInterval in nextIntervals {
                        if foundNote { continue }
                        guard let searchNoteClass = rootNote.shiftUp(nextInterval)?.noteClass else { continue }
                        for noteArray in enharmonicNoteArrays where !usedNoteArrays.contains(noteArray) {
                            if noteArray.map({$0.noteClass}).contains(searchNoteClass) {
                                guard let matchedNote = noteArray.first(where: {$0.noteClass == searchNoteClass}) else { continue }
                                foundNotes.append(matchedNote)
                                usedNoteArrays.append(noteArray)
                                foundNote = true
                            }
                        }
                    }
                    if foundNotes.count == pitchSet.count {
                        foundNoteArrays.append(foundNotes)
                    }
                }
            }
        }
        
        for foundNoteArray in foundNoteArrays {
            let chords = Chord.getRankedChords(from: foundNoteArray)
            for chord in chords {
                if !returnArray.contains(chord) {
                    returnArray.append(chord)
                }
            }
        }
        
        // Sorts anti-alphabetical, but the net effect is to prefer flats to sharps
        returnArray.sort { $0.root.letter > $1.root.letter }

        // order the array by least number of accidentals
        returnArray.sort { $0.accidentalCount < $1.accidentalCount }

        // prefer root notes not being uncommon enharmonics
        returnArray.sort { ($0.root.canonicalNote.isUncommonEnharmonic ? 1 : 0) < ($1.root.canonicalNote.isUncommonEnharmonic ? 1 : 0) }
        
        if !allowTheoreticalChords {
            returnArray = returnArray.filter { chord in
                !chord.root.accidental.isDouble
            }
            returnArray = returnArray.filter { chord in
                !chord.root.canonicalNote.isUncommonEnharmonic
            }
            returnArray = returnArray.filter { chord in
                !chord.bassNote.canonicalNote.isUncommonEnharmonic
            }
            returnArray = returnArray.filter { chord in
                !chord.bassNote.accidental.isDouble
            }
        }
        
        // prefer fewer number of characters (favor less complex chords in ranking)
        returnArray.sort { $0.slashDescription.count < $1.slashDescription.count }
        
        // order the array preferring root position
        returnArray.sort { $0.inversion < ($1.inversion > 0 ? 1 : 0) }
        
        return returnArray
    }

    /// Get chords from actual notes (spelling matters, C# F G# will not return a C# major)
    /// Use pitch set version of this function for all enharmonic chords
    /// The ranking is based on how low the root note of the chord appears, for example we
    /// want to list the notes C, E, G, A as C6 if the C is in the bass
    public static func getRankedChords(from notes: [Note]) -> [Chord] {
        let potentialChords = ChordTable.shared.getAllChordsForNoteSet(NoteSet(notes: notes))
        if potentialChords.isEmpty { return [] }
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
