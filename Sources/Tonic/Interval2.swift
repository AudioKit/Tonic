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
    public var semitones: Int? {
        guard degree <= 15 else { return nil }
        switch quality {
        case .diminished:
            return [nil, -1, 0, 2, 4, 6, 7, 9, 11, 12, 14, 16, 18, 19, 21, 23][degree]
        case .perfect:
            return [nil, 0, nil, nil, 5, 7, nil, nil, 12, nil, nil, 17, 19, nil, nil, 24][degree]
        case .minor:
            return [nil, nil, 1, 3, nil, nil, 8, 10, nil, 13, 15, nil, nil, 20, 22, nil, nil][degree]
        case .major:
            return [nil, nil, 2, 4, nil, nil, 9, 11, nil, 14, 16, nil, nil, 21, 23, nil, nil][degree]
        case .augmented:
            return [nil, 1, 3, 5, 6, 8, 10, 12, 13, 15, 17, 18, 20, 22, 24, 25, nil][degree]
        }
    }

    /// Initilizes the interval with its quality, degree and semitones.
    ///
    /// - Parameters:
    ///   - quality: Quality of the interval.
    ///   - degree: Degree of the interval.
    public init(quality: Quality, degree: Int) {
        self.quality = quality
        self.degree = degree
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


