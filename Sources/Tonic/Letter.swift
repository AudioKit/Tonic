// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/Tonic/

import Foundation

/// The alphabet used to spell all traditional music notes.
///
/// These letters can be modified by adding an ``Accidental`` to describe any ``NoteClass``.
/// And by specificying an octave, you can create any ``Note``.
public enum Letter: Int, CaseIterable, Equatable, Hashable, Codable {
    case C, D, E, F, G, A, B

    var baseNote: UInt8 {
        switch self {
            case .C:
                0
            case .D:
                2
            case .E:
                4
            case .F:
                5
            case .G:
                7
            case .A:
                9
            case .B:
                11
        }
    }
}

extension Letter: Comparable {
    public static func < (lhs: Letter, rhs: Letter) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
