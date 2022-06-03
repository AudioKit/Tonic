import Foundation

/// A name for a distance between notes. Some Intervals refer to the same difference in pitch.
public enum Interval: Int, CaseIterable {
    case m2
    case M2
    case m3
    case M3
    case P4
    case d5
    case P5
    case m6
    case M6
    case m7
    case M7
    case d4
    case A4
    case A5
    case A6

    var semitones: Int {
        switch self {
            
        case .m2:
            return 1
        case .M2:
            return 2
        case .m3:
            return 3
        case .M3:
            return 4
        case .d4:
            return 4
        case .P4:
            return 5
        case .A4:
            return 6
        case .d5:
            return 6
        case .P5:
            return 7
        case .A5:
            return 8
        case .m6:
            return 8
        case .M6:
            return 9
        case .A6:
            return 10
        case .m7:
            return 10
        case .M7:
            return 11
        }
    }

    var degree: Int {
        switch self {

        case .m2:
            return 2
        case .M2:
            return 2
        case .m3:
            return 3
        case .M3:
            return 3
        case .d4:
            return 4
        case .P4:
            return 4
        case .A4:
            return 4
        case .d5:
            return 5
        case .P5:
            return 5
        case .A5:
            return 5
        case .m6:
            return 6
        case .M6:
            return 6
        case .A6:
            return 6
        case .m7:
            return 7
        case .M7:
            return 7
        }
    }

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
        for interval in Interval.allCases {
            if interval.degree == degree && interval.semitones == n1.semitones(to: n2) {
                return interval
            }
        }
        return nil
    }
}

extension Interval: CustomStringConvertible {
    public var description: String {
        switch self {

        case .m2:
            return "Minor Second"
        case .M2:
            return "Major Second"
        case .m3:
            return "Minor Third"
        case .M3:
            return "Major Third"
        case .d4:
            return "Diminished Fourth"
        case .P4:
            return "Perfect Fourth"
        case .A4:
            return "Augmented Fourth"
        case .d5:
            return "Diminished Fifth"
        case .P5:
            return "Perfect Fifth"
        case .A5:
            return "Augmented Fifth"
        case .m6:
            return "Minor Sixth"
        case .M6:
            return "Major Sixth"
        case .A6:
            return "Augmented Sixth"
        case .m7:
            return "Minor Seventh"
        case .M7:
            return "Major Seventh"
        }
    }


}
