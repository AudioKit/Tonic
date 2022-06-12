import Foundation

extension Interval2: CaseIterable {
    /// All pre-defined intervals in a static array. You can filter it out with qualities, degrees or semitones.
    public static var allCases: [Interval2] {
        [.P1, .P4, .P5, .P8, .P11, .P12, .P15,
        .m2, .m3, .m6, .m7, .m9, .m10, .m13, .m14,
        .M2, .M3, .M6, .M7, .M9, .M10, .M13, .M14,
        .d1, .d2, .d3, .d4, .d5, .d6, .d7, .d8, .d9, .d10, .d11, .d12, .d13, .d14, .d15,
        .A1, .A2, .A3, .A4, .A5, .A6, .A7, .A8, .A9, .A10, .A11, .A12, .A13, .A14, .A15]
    }
}

public extension Interval2 {
    /// Unison.
    static let P1 = Interval2(quality: .perfect, degree: 1)

    /// Perfect fourth.
    static let P4 = Interval2(quality: .perfect, degree: 4)

    /// Perfect fifth.
    static let P5 = Interval2(quality: .perfect, degree: 5)

    /// Octave.
    static let P8 = Interval2(quality: .perfect, degree: 8)

    /// Perfect eleventh.
    static let P11 = Interval2(quality: .perfect, degree: 11)

    /// Perfect twelfth.
    static let P12 = Interval2(quality: .perfect, degree: 12)

    /// Perfect fifteenth, double octave.
    static let P15 = Interval2(quality: .perfect, degree: 15)

    /// Minor second.
    static let m2 = Interval2(quality: .minor, degree: 2)

    /// Minor third.
    static let m3 = Interval2(quality: .minor, degree: 3)

    /// Minor sixth.
    static let m6 = Interval2(quality: .minor, degree: 6)

    /// Minor seventh.
    static let m7 = Interval2(quality: .minor, degree: 7)

    /// Minor ninth.
    static let m9 = Interval2(quality: .minor, degree: 9)

    /// Minor tenth.
    static let m10 = Interval2(quality: .minor, degree: 10)

    /// Minor thirteenth.
    static let m13 = Interval2(quality: .minor, degree: 13)

    /// Minor fourteenth.
    static let m14 = Interval2(quality: .minor, degree: 14)

    /// Major second.
    static let M2 = Interval2(quality: .major, degree: 2)

    /// Major third.
    static let M3 = Interval2(quality: .major, degree: 3)

    /// Major sixth.
    static let M6 = Interval2(quality: .major, degree: 6)

    /// Major seventh.
    static let M7 = Interval2(quality: .major, degree: 7)

    /// Major ninth.
    static let M9 = Interval2(quality: .major, degree: 9)

    /// Major tenth.
    static let M10 = Interval2(quality: .major, degree: 10)

    /// Major thirteenth.
    static let M13 = Interval2(quality: .major, degree: 13)

    /// Major fourteenth.
    static let M14 = Interval2(quality: .major, degree: 14)

    /// Diminished first.
    static let d1 = Interval2(quality: .diminished, degree: 1)

    /// Diminished second.
    static let d2 = Interval2(quality: .diminished, degree: 2)

    /// Diminished third.
    static let d3 = Interval2(quality: .diminished, degree: 3)

    /// Diminished fourth.
    static let d4 = Interval2(quality: .diminished, degree: 4)

    /// Diminished fifth.
    static let d5 = Interval2(quality: .diminished, degree: 5)

    /// Diminished sixth.
    static let d6 = Interval2(quality: .diminished, degree: 6)

    /// Diminished seventh.
    static let d7 = Interval2(quality: .diminished, degree: 7)

    /// Diminished eighth.
    static let d8 = Interval2(quality: .diminished, degree: 8)

    /// Diminished ninth.
    static let d9 = Interval2(quality: .diminished, degree: 9)

    /// Diminished tenth.
    static let d10 = Interval2(quality: .diminished, degree: 10)

    /// Diminished eleventh.
    static let d11 = Interval2(quality: .diminished, degree: 11)

    /// Diminished twelfth.
    static let d12 = Interval2(quality: .diminished, degree: 12)

    /// Diminished thirteenth.
    static let d13 = Interval2(quality: .diminished, degree: 13)

    /// Diminished fourteenth.
    static let d14 = Interval2(quality: .diminished, degree: 14)

    /// Diminished fifteenth.
    static let d15 = Interval2(quality: .diminished, degree: 15)


    /// Augmented first.
    static let A1 = Interval2(quality: .augmented, degree: 1)

    /// Augmented second.
    static let A2 = Interval2(quality: .augmented, degree: 2)

    /// Augmented third.
    static let A3 = Interval2(quality: .augmented, degree: 3)

    /// Augmented fourth.
    static let A4 = Interval2(quality: .augmented, degree: 4)

    /// Augmented fifth.
    static let A5 = Interval2(quality: .augmented, degree: 5)

    /// Augmented sixth.
    static let A6 = Interval2(quality: .augmented, degree: 6)

    /// Augmented seventh.
    static let A7 = Interval2(quality: .augmented, degree: 7)

    /// Augmented octave.
    static let A8 = Interval2(quality: .augmented, degree: 8)

    /// Augmented ninth.
    static let A9 = Interval2(quality: .augmented, degree: 9)

    /// Augmented tenth.
    static let A10 = Interval2(quality: .augmented, degree: 10)

    /// Augmented eleventh.
    static let A11 = Interval2(quality: .augmented, degree: 11)

    /// Augmented twelfth.
    static let A12 = Interval2(quality: .augmented, degree: 12)

    /// Augmented thirteenth.
    static let A13 = Interval2(quality: .augmented, degree: 13)

    /// Augmented fourteenth.
    static let A14 = Interval2(quality: .augmented, degree: 14)

    /// Augmented fifteenth.
    static let A15 = Interval2(quality: .augmented, degree: 15)

}
