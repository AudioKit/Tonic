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

    func text(pitch: Pitch) -> String {
        if let chord = chordIdentifier.chord {
            print(chordIdentifier.pitchSet.array, pitch)
            if chordIdentifier.pitchSet.array.map({ $0.midiNoteNumber % 12 }).contains(pitch.midiNoteNumber % 12) {
                var note = pitch.note(in: Key(root: chord.root)).noteClass.canonicalNote
                let root = chord.root.canonicalNote
                if root.noteNumber > note.noteNumber {
                    note = Note(note.letter, accidental: note.accidental, octave: note.octave + 1)
                }
                
                let interval = Interval.betweenNotes(root, note)
                return interval?.abbreviation ?? "R"
                
            }
        }
        return ""
    }

    var body: some View {
        VStack {
            VStack() {
                Text(chordIdentifier.result).font(.largeTitle)
                PianoKeyboard(pitchRange: Note(.C, octave: -1).pitch ... Note(.B, octave: 0).pitch,
                              latching: true,
                              noteOn: chordIdentifier.noteOn,
                              noteOff: chordIdentifier.noteOff) { pitch, model in
                    KeyboardKey(pitch: pitch,
                                model: model,
                                text: text(pitch: pitch),
                                color: KeyboardColors.newtonian[Int(pitch.intValue) % 12],
                                isActivatedExternally: chordIdentifier.pitchSet.array.map({ $0.midiNoteNumber % 12}).contains(pitch.midiNoteNumber % 12))
                }
            }.padding(50)

            IsomorphicKeyboard(pitchRange: Note(.E, octave: 2).pitch ... Note(.E, octave: 6).pitch,
                          latching: true,
                          noteOn: chordIdentifier.noteOn,
                          noteOff: chordIdentifier.noteOff) { pitch, model in
                KeyboardKey(pitch: pitch,
                            model: model,
                            text: chordIdentifier.pitchSet.contains(pitch) ? pitch.note(in: .C).description : (pitch.note(in: .C).noteClass.description == "C" ? "C\(pitch.note(in: .C).octave)" : ""),
                            color: KeyboardColors.newtonian[Int(pitch.intValue) % 12],
                            isActivatedExternally: chordIdentifier.pitchSet.contains(pitch))
            }
                          .frame(height: 100)
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
