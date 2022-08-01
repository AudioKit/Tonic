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
    
    @Published var pitchSet: PitchSet = PitchSet()
    
    var detectedKey: Key {
        let keys: [Key] = [.C, .G, .F, .D, .Bb, .A, .Eb, .E, .Ab, .B, .Db]
        for key in keys {
            if pitchSet.chord(in: key) != nil {
                return key
            }
        }
        return .C
    }
    
    var chord: Chord? {
        let keys: [Key] = [.C, .G, .F, .D, .Bb, .A, .Eb, .E, .Ab, .B, .Db]
        for key in keys {
            if let c = pitchSet.chord(in: key) {
                return c
            }
        }
        return nil
    }
    
    var chordName: String {
        
        if pitchSet.count == 0 {
            return " "
        }
        if pitchSet.count == 1 {
            return "Single Note: " + pitchSet.first!.note(in: .C).description
        }

        if pitchSet.count == 2 {
            let note1 = pitchSet.array[0].note(in: .C)
            let note2 = pitchSet.array[1].note(in: .C)
            var intervalString = ""
            if let interval = Interval.betweenNotes(note1, note2) {
                intervalString = interval.description
            }
            return "Two Notes: " + intervalString + " " + note1 .description + ", " + note2.description
        }

        let keys: [Key] = [.C, .G, .F, .D, .Bb, .A, .Eb, .E, .Ab, .B, .Db]
        for key in keys {
            if let c = pitchSet.chord(in: key) {
                return "Known Chord: \(c.description) \(c.inversionText)"
            }
        }
        
        // Failed to detect a chord
        return "Notes: " + pitchSet.array.map { $0.note(in: .C).description }.joined(separator: ", ")
    }
}

extension Chord {
    var inversionText: String {
        return ["Root Position", "1st Inversion", "2nd Inversion", "3rd Inversion", "4th Inversion", "5th Inversion"][inversion]
    }
}


