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
            Text(chordIdentifier.result).font(.largeTitle)
            PianoKeyboard(pitchRange: Note(.C, accidental: .sharp, octave: 2).pitch ... Note(.C, accidental: .sharp, octave: 5).pitch,
                          latching: true,
                          noteOn: chordIdentifier.noteOn,
                          noteOff: chordIdentifier.noteOff) { pitch, model in
                KeyboardKey(pitch: pitch,
                            model: model,
                            text: pitch.note(in: .C).description,
                            color: KeyboardColors.newtonian[Int(pitch.intValue) % 12],
                            isActivatedExternally: chordIdentifier.pitchSet.contains(pitch))
            }
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
