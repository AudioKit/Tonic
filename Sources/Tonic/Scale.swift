
import Foundation

struct Scale {
    var bits: UInt16

    var intervals: [Interval] {

        var result: [Interval] = []
        for i in 0..<11 {
            if (bits >> i) & 1 != 0 {
                result.append(Interval(rawValue: UInt8(i))!)
            }
        }
        return result
    }
}
