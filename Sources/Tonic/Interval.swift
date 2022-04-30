
import Foundation

enum Interval: Int, CaseIterable {
    case m2
    case M2
    case m3
    case M3
    case P4
    case d5
    case P5
    case A5
    case m6
    case M6
    case m7
    case M7

    var semitones: Int {
        switch self {
            
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
        case .P4:
            return 4
        case .d5:
            return 5
        case .P5:
            return 5
        case .A5:
            return 6
        case .m6:
            return 6
        case .M6:
            return 6
        case .m7:
            return 7
        case .M7:
            return 7
        }
    }
}
