// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// A way to describe modification to a ``Note`` or ``NoteClass``
///
/// A semitone offset applied to a note that does not change the letter of the note, just the pitch.
public enum Accidental: Int8, CaseIterable, Equatable, Hashable, Codable {
    static var count: Int { Accidental.allCases.count }
    static var naturalIndex: Int { count / 2 }

    /// A double flat represented as "𝄫" lowers the note by a whole tone, or two semitones.
    case doubleFlat = -2

    /// A single flat "♭" lowers the note by a semitone
    case flat = -1

    /// Natural means there is no semitone deviation from the base Note
    case natural = 0

    /// A single sharp "♯" raises the note by a semitone
    case sharp = 1

    /// A double sharp represented as "𝄪" raises the note by a whole tone, or two semitones.
    case doubleSharp = 2
}

extension Accidental: CustomStringConvertible {
    /// Proper characters to describe the accidental in a String.
    public var description: String {
        ["𝄫", "♭", "", "♯", "𝄪"][Int(rawValue) + Accidental.naturalIndex]
    }
    
    /// Name of Accidental using specialized Chord Symbol Fonts Norfolk or Pori from
    /// NotationExpress: https://www.notationcentral.com/product/norfolk-fonts-for-sibelius/
    public var chordFontDescription: String {
        ["¬", "b", "", "#", "«"][Int(rawValue) + Accidental.naturalIndex]
    }
}

extension Accidental: Comparable {
    public static func < (lhs: Accidental, rhs: Accidental) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
