import Combine
import Keyboard
import Tonic

class ChordIdentifier: ObservableObject {

    func noteOn(pitch: Pitch) {
        pitchSet.add(pitch)
    }

    func noteOff(pitch: Pitch) {
        pitchSet.remove(pitch)
    }

    var inversionText: String {
        if let c = chord {
            return ["Root Position", "1st Inversion", "2nd Inversion", "3rd Inversion", "4th Inversion", "5th Inversion"][c.inversion]
        }
        return ""

    }

    var chord: Chord? {
        didSet {

            if let chord = chord {
                result = "Known Chord: \(chord.description) \(inversionText)"
            } else {
                result = "Notes: " + pitchSet.array.map { $0.note(in: .C).description }.joined(separator: ", ")
            }

        }
    }

    @Published var result: String = " "

    var pitchSet: PitchSet = PitchSet() {
        didSet {
            chord = nil
            if pitchSet.count == 0 {
                result = " "
            }
            if pitchSet.count == 1 {
                result = "Single Note: " + pitchSet.first!.note(in: .C).description
                return
            }

            if pitchSet.count == 2 {
                let note1 = pitchSet.array[0].note(in: .C)
                let note2 = pitchSet.array[1].note(in: .C)
                var intervalString = ""
                if let interval = Interval.betweenNotes(note1, note2) {
                    intervalString = interval.description
                }
                result = "Two Notes: " + intervalString + " " + note1 .description + ", " + note2.description
                return
            }

            let keys: [Key] = [.C, .G, .F, .D, .Bb, .A, .Eb, .E, .Ab, .B, .Db]
            for key in keys {
                if let c = pitchSet.chord(in: key) {
                    chord = c
                    return
                }
            }
            // Failed to detect a chord
            result = " "
        }
    }



}
