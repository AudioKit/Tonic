
import Foundation

struct Scale: OptionSet {
    let rawValue: Int

    var intervals: [Interval] {

        var result: [Interval] = []
        for i in 0..<11 {
            if (rawValue >> i) & 1 != 0 {
                result.append(Interval(rawValue: i)!)
            }
        }
        return result
    }

    static let pentatonicMinor: Scale = Scale(rawValue: 0b1001010100)
    static let blues: Scale = Scale(rawValue: 0b1001110100)
    static let minor: Scale = Scale(rawValue: 0b1011010110)
    static let chromatic = Scale(rawValue: 0b11111111111)
}
