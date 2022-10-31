import Keyboard
import MIDIKit
import SwiftUI
import Tonic

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    @StateObject var chordIdentifier = ChordIdentifier()
    var midiController = MIDIController()

    func eventHandler(events: [MIDIEvent]) {
        for event in events {
            switch event {
            case let .noteOn(payload):
                chordIdentifier.noteOn(pitch: Pitch(Int8(payload.note.number)))
            case let .noteOff(payload):
                chordIdentifier.noteOff(pitch: Pitch(Int8(payload.note.number)))
            default:
                break
            }
        }
    }

    func text(pitch: Pitch) -> String {
        if let chord = chordIdentifier.chord {
            if chordIdentifier.pitchSet.array.map({ $0.midiNoteNumber }).contains(pitch.midiNoteNumber) {
                var note = pitch.note(in: chordIdentifier.detectedKey).noteClass.canonicalNote
                let root = chord.root.canonicalNote
                if root.noteNumber > note.noteNumber {
                    note = Note(note.letter, accidental: note.accidental, octave: note.octave + 1)
                }

                let interval = Interval.betweenNotes(root, note)
                return interval?.description ?? "R"
            }
        }
        return ""
    }

    var body: some View {
        VStack {
            VStack {
                Text(chordIdentifier.chordName).font(.largeTitle)
                Keyboard(layout: .piano(pitchRange: Note(.C, octave: -1).pitch ... Note(.B, octave: 0).pitch),
                         latching: true,
                         noteOn: chordIdentifier.noteOn,
                         noteOff: chordIdentifier.noteOff) { pitch, isActivated in
                    KeyboardKey(pitch: pitch,
                                isActivated: isActivated,
                                text: text(pitch: pitch),
                                pressedColor: Color(PitchColor.newtonian[Int(pitch.pitchClass)]),
                                isActivatedExternally: chordIdentifier.pitchSet.contains(pitch))
                }
            }.padding(50)
        }
        .padding()
        .background(colorScheme == .dark ? Color.black : Color.gray)
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
