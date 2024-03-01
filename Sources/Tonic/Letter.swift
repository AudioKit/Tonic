// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// The alphabet used to spell all traditional music notes.
///
/// These letters can be modified by adding an ``Accidental`` to describe any ``NoteClass``.
/// And by specificying an octave, you can create any ``Note``.
public enum Letter: Int, CaseIterable, Equatable, Hashable, Codable {
    case C, D, E, F, G, A, B

    var baseNote: UInt8 {
        return [0, 2, 4, 5, 7, 9, 11][rawValue]
    }
}

extension Letter: CustomStringConvertible {
    public var description: String {
        switch self {
            case .C:
                return "C"
            case .D:
                return "D"
            case .E:
                return "E"
            case .F:
                return "F"
            case .G:
                return "G"
            case .A:
                return "A"
            case .B:
                return "B"
        }
    }
}

extension Letter: Comparable {
    public static func < (lhs: Letter, rhs: Letter) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
