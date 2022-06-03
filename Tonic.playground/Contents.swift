//: When discussing the nature of infinity people often cite that a room full of monkeys,
//: each with a piano, given infinite time, will be able to compose a Beethoven concerto.
//:
//: Let's use Tonic to test something simpler, how long should it take three monkeys to
//: discover the Axis of Awesome Four Chord Progression: I V vi IV.
//:
//: But first let's make an educated guess.
//:
//: Each monkey will choose one note simultaneously we'll give them credit once they've strung
//: together 4 correct chords. The first chord only needs to be major since it will
//: define the key but each on thereafter has 1 in 12^3 chance of being correct.
//: So, we think the chance of this happening will be 1 in 12 to the 11th power
import Foundation
let totalTries = pow(12, 11)
let probability = 1.0 / totalTries
//: About 1 in a Trillion! Now we'll use Tonic to actually see how many tries this will really take.
import Tonic

var randomPitch: Pitch {
    Pitch((0...11).randomElement()!)
}

var chords: [Chord] = []
var currentChordProgessionRomanNumerals: [String] = []
var tries = 0
var key: Key?

while currentChordProgessionRomanNumerals != ["I", "V", "vi"] {//, "IV"] {
    // Starting from scratch with one chord
    key = nil
    chords.removeAll()
    currentChordProgessionRomanNumerals.removeAll()
    var noteSet = PitchSet()
    noteSet.add(randomPitch)
    noteSet.add(randomPitch)
    noteSet.add(randomPitch)
    tries += 3

    if let chord = noteSet.chord(in: .C) {
        // Start over if we didn't get a major chordcal
            continue
        }

        // We have now defined our key
        chords.append(chord)
        key = Key(root: chord.root)
        currentChordProgessionRomanNumerals = ["I"]
    }

    guard let actualKey = key else {
        continue
    }

    // Try to match the next chords
    for target in ["V", "vi"] {//, "IV"] {

        var noteSet = PitchSet()
        noteSet.add(randomPitch)
        noteSet.add(randomPitch)
        noteSet.add(randomPitch)
        tries += 3

        if let chord = noteSet.chord(in: key!), chord.romanNumeralNotation(in: key!) == target {
            chords.append(chord)
            currentChordProgessionRomanNumerals.append(target)
            print(chords, currentChordProgessionRomanNumerals)
        } else {
            break
        }
    }
}
print(tries)
