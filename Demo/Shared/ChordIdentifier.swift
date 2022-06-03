import Combine
import MIDIKit
import Keyboard
import Tonic

class ChordIdentifier: ObservableObject {

    var inversionText: String {
        if let c = chord {
            return ["Root Position", "1st Inversion", "2nd Inversion"][c.inversion]
        }
        return ""

    }

    @Published var chord: Chord?

    var pitchSet: PitchSet = PitchSet() {
        didSet {
            let keys: [Key] = [.C, .G, .F, .D, .Bb, .A, .Eb, .E, .Ab, .B, .Db]
            for key in keys {
                if let c = pitchSet.chord(in: key), c != chord {
                    chord = c

                    return
                }
            }
            // Failed to detect a chord
            chord = nil
        }
    }
    func eventHandler(events: [MIDIKit.MIDI.Event]) {
        for event in events {
            if event.isChannelVoice(ofType: .noteOn) {
                pitchSet.add(Pitch(Int8(event.midi1RawBytes[1])))
            }
            if event.isChannelVoice(ofType: .noteOff) {
                _ = pitchSet.remove(Pitch(Int8(event.midi1RawBytes[1])))
            }
        }
    }


}
