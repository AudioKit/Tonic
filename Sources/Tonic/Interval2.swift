//  Modified version of Cem Olcay's Interval.swift here:
//  https://github.com/cemolcay/MusicTheory

import Foundation

/// Defines the interval between two `Note`s 
public struct Interval2: Codable {
    /// Quality type of the interval.
    public enum Quality: Int, Codable, Hashable, CaseIterable, CustomStringConvertible {
        /// Diminished
        case diminished
        /// Perfect
        case perfect
        /// Minor.
        case minor
        /// Major.
        case major
        /// Augmented.
        case augmented

        // MARK: CustomStringConvertible

        /// Returns the notation of the interval quality.
        public var notation: String {
            switch self {
            case .diminished: return "d"
            case .perfect: return "P"
            case .minor: return "m"
            case .major: return "M"
            case .augmented: return "A"
            }
        }

        /// Returns the name of the interval quality.
        public var description: String {
            switch self {
            case .diminished: return "Diminished"
            case .perfect: return "Perfect"
            case .minor: return "Minor"
            case .major: return "Major"
            case .augmented: return "Augmented"
            }
        }
    }

    /// Quality of the interval.
    public var quality: Quality
    /// Degree of the interval.
    public var degree: Int
    /// Semitones interval affect on a pitch.
    public var semitones: Int

    /// Initilizes the interval with its quality, degree and semitones.
    ///
    /// - Parameters:
    ///   - quality: Quality of the interval.
    ///   - degree: Degree of the interval.
    ///   - semitones: Semitones of the interval.
    public init(quality: Quality, degree: Int, semitones: Int) {
        self.quality = quality
        self.degree = degree
        self.semitones = semitones
    }



    /// Returns the notation of the interval.
    public var notation: String {
        return "\(quality.notation)\(degree)"
    }
}

extension Interval2: CustomStringConvertible {
    /// Returns the name of the interval.
    public var description: String {
        var formattedDegree = "\(degree)"

        if #available(OSX 10.11, iOS 9.0, *) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .ordinal
            formattedDegree = formatter.string(from: NSNumber(integerLiteral: degree)) ?? formattedDegree
        }

        return "\(quality) \(formattedDegree)"
    }
}

extension Interval2: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(quality)
        hasher.combine(degree)
        hasher.combine(semitones)
    }
}


