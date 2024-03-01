// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// The distance between two notes.
///
/// An interval distance is measured in degree (number of letters away) and
/// quality of the interval (essentialy number of semitones away).
/// Some Intervals refer to the same difference in pitch.
public enum Interval: Int, CaseIterable, Codable {
    /// Perfect Unison
    case P1

    /// Augmented Unison
    case A1

    /// Minor Second
    case m2

    /// Major Second
    case M2

    /// Minor Third
    case m3

    /// Major Third
    case M3

    /// Diminished Fourth
    case d4

    /// Perfect Fourth
    case P4

    /// Augmented Fourth
    case A4

    /// Diminished Fifth
    case d5

    /// Perfect Fifth
    case P5

    /// Augmented Fifth
    case A5

    /// Minor Sixth
    case m6

    /// Major Sixth
    case M6

    /// Augmented Sixth
    case A6

    /// Diminished Seventh
    case d7

    /// Minor Seventh
    case m7

    /// Major Seventh
    case M7

    /// Diminished Octave
    case d8

    /// Perfect Octave
    case P8

    /// AugmentedOctave
    case A8

    /// Minor Ninth
    case m9

    /// Major Ninth
    case M9

    /// Augmented Ninth
    case A9

    /// Diminished Eleventh
    case d11

    /// Perfect Eleventh
    case P11

    /// Augmented Eleventh
    case A11

    /// Perfect Thirteenth
    case P13

    /// Diminished Thirteenth
    case d13

    /// Number of semitones the interval spans
    public var semitones: Int {
        switch self {
        case .P1: return 0
        case .A1: return 1
        case .m2: return 1
        case .M2: return 2
        case .m3: return 3
        case .M3: return 4
        case .d4: return 4
        case .P4: return 5
        case .A4: return 6
        case .d5: return 6
        case .P5: return 7
        case .A5: return 8
        case .m6: return 8
        case .d7: return 9
        case .M6: return 9
        case .A6: return 10
        case .m7: return 10
        case .M7: return 11
        case .d8: return 11
        case .P8: return 12
        case .A8: return 13
        case .m9: return 13
        case .M9: return 14
        case .A9: return 15
        case .d11: return 16
        case .P11: return 17
        case .A11: return 18
        case .d13: return 20
        case .P13: return 21
        }
    }

    /// Number of letters the interval spans
    var degree: Int {
        switch self {
        case .P1: return 1
        case .A1: return 1
        case .m2: return 2
        case .M2: return 2
        case .m3: return 3
        case .M3: return 3
        case .d4: return 4
        case .P4: return 4
        case .A4: return 4
        case .d5: return 5
        case .P5: return 5
        case .A5: return 5
        case .m6: return 6
        case .M6: return 6
        case .A6: return 6
        case .d7: return 7
        case .m7: return 7
        case .M7: return 7
        case .d8: return 8
        case .P8: return 8
        case .A8: return 8
        case .m9: return 9
        case .M9: return 9
        case .A9: return 9
        case .d11: return 11
        case .P11: return 11
        case .A11: return 11
        case .d13: return 13
        case .P13: return 13
        }
    }

    /// Calculate the interval between two notes.
    ///
    /// Interval is currently only a positive distance, so it doesn't matter which is the lower note.
    /// - Parameters:
    ///   - note1: First Note
    ///   - note2: Second Note
    /// - Returns: Interval
    public static func betweenNotes(_ note1: Note, _ note2: Note) -> Interval? {
        var n1 = note1
        var n2 = note2
        if note2.pitch < note1.pitch {
            n2 = note1
            n1 = note2
        }
        var degree = n2.letter.rawValue - n1.letter.rawValue
        if degree < 0 { degree += Letter.allCases.count }
        degree += 1
        for interval in Interval.allCases where interval.semitones == n1.semitones(to: n2) {
            if let n1Exists = n1.shiftUp(interval), n1Exists == n2 {
                return interval
            }
        }
        return nil
    }
}

extension Interval: CustomStringConvertible {
    /// Short version of the interval name
    public var description: String {
        switch self {
        case .P1: return "P1"
        case .A1: return "A1"
        case .m2: return "m2"
        case .M2: return "M2"
        case .m3: return "m3"
        case .M3: return "M3"
        case .d4: return "d4"
        case .P4: return "P4"
        case .A4: return "A4"
        case .d5: return "d5"
        case .P5: return "P5"
        case .A5: return "A5"
        case .m6: return "m6"
        case .M6: return "M6"
        case .A6: return "A6"
        case .d7: return "d7"
        case .m7: return "m7"
        case .M7: return "M7"
        case .d8: return "d8"
        case .P8: return "P8"
        case .A8: return "A8"
        case .m9: return "m9"
        case .M9: return "M9"
        case .A9: return "A9"
        case .d11: return "d11"
        case .P11: return "P11"
        case .A11: return "A11"
        case .d13: return "d13"
        case .P13: return "P13"
        }
    }

    /// Longer Description of the Interval name
    public var longDescription: String {
        switch self {
        case .P1: return "Perfect Unison"
        case .A1: return "Augmented Unison"
        case .m2: return "Minor Second"
        case .M2: return "Major Second"
        case .m3: return "Minor Third"
        case .M3: return "Major Third"
        case .d4: return "Diminished Fourth"
        case .P4: return "Perfect Fourth"
        case .A4: return "Augmented Fourth"
        case .d5: return "Diminished Fifth"
        case .P5: return "Perfect Fifth"
        case .A5: return "Augmented Fifth"
        case .m6: return "Minor Sixth"
        case .M6: return "Major Sixth"
        case .A6: return "Augmented Sixth"
        case .d7: return "Diminished Seventh"
        case .m7: return "Minor Seventh"
        case .M7: return "Major Seventh"
        case .d8: return "Diminished Octave"
        case .P8: return "Perfect Octave"
        case .A8: return "Augmented Octave"
        case .m9: return "Minor Ninth"
        case .M9: return "Major Ninth"
        case .A9: return "Augmented Ninth"
        case .d11: return "Diminished Eleventh"
        case .P11: return "Perfect Eleventh"
        case .A11: return "Augmented Eleventh"
        case .d13: return "Diminished Thirteenth"
        case .P13: return "Perfect Thirteenth"
        }
    }
}
