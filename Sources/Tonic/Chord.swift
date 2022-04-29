
import Foundation

let m1: UInt64 = 0x5555555555555555 // binary: 0101...
let m2: UInt64 = 0x3333333333333333 // binary: 00110011..
let m4: UInt64 = 0x0f0f0f0f0f0f0f0f // binary:  4 zeros,  4 ones ...

// See https://en.wikipedia.org/wiki/Hamming_weight
// This uses fewer arithmetic operations than any other known
// implementation on machines with slow multiplication.
// This algorithm uses 17 arithmetic operations.
func popcount64b(_ xx: UInt64) -> UInt64
{
    var x = xx
    x -= (x >> 1) & m1;             //put count of each 2 bits into those 2 bits
    x = (x & m2) + ((x >> 2) & m2); //put count of each 4 bits into those 4 bits
    x = (x + (x >> 4)) & m4;        //put count of each 8 bits into those 8 bits
    x += x >>  8;  //put count of each 16 bits into their lowest 8 bits
    x += x >> 16;  //put count of each 32 bits into their lowest 8 bits
    x += x >> 32;  //put count of each 64 bits into their lowest 8 bits
    return x & 0x7f;
}

struct Chord {

    // Since we don't have a UInt128
    var highNotes: UInt64
    var lowNotes: UInt64

    var isTriad: Bool {
        popcount64b(lowNotes) + popcount64b(highNotes) == 3
    }
}
