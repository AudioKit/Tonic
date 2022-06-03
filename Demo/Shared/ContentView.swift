import SwiftUI
import Keyboard
import MIDIKit
import Tonic

struct ContentView: View {

    @StateObject var chordIdentifier = ChordIdentifier()
    var midiController = MIDIController()

    func eventHandler(events: [MIDIKit.MIDI.Event]) {
        for event in events {
            if event.isChannelVoice(ofType: .noteOn) {
                chordIdentifier.noteOn(pitch: Pitch(Int8(event.midi1RawBytes[1])))
            }
            if event.isChannelVoice(ofType: .noteOff) {
                chordIdentifier.noteOff(pitch: Pitch(Int8(event.midi1RawBytes[1])))
            }
        }
    }

    var body: some View {
        VStack {
            Text(chordIdentifier.result)
            Keyboard(settings: KeyboardSettings(externalPitchSet: chordIdentifier.pitchSet),
                     noteOn: chordIdentifier.noteOn,
                     noteOff: chordIdentifier.noteOff)
        }
        .padding()
        .onAppear {
            midiController.eventHandlers.append(eventHandler)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
