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

    var body: some View {
        VStack {
            ChordTextView(chord: $chordIdentifier.chord,
                          potentialChords: chordIdentifier.potentialChords,
                          genericPitchSetDescription: chordIdentifier.genericPitchSetDescription)

            Keyboard(layout: .piano(pitchRange: Note(.C, octave: -1).pitch ... Note(.B, octave: 0).pitch),
                     latching: true,
                     noteOn: chordIdentifier.noteOn,
                     noteOff: chordIdentifier.noteOff) { pitch, isActivated in
                KeyboardKey(pitch: pitch,
                            isActivated: isActivated,
                            text: chordIdentifier.text(pitch: pitch),
                            pressedColor: Color(PitchColor.newtonian[Int(pitch.pitchClass)]),
                            isActivatedExternally: chordIdentifier.pitchSet.closedVoicing.transposedBassNoteTo(octave: -1).contains(pitch))
            }
        }
        .padding(50)
        .background(colorScheme == .dark ? Color.black : Color.gray)
        .onAppear {
            midiController.eventHandlers.append(eventHandler)
        }
    }

    struct ChordTextView: View {
        @Binding var chord: Chord?
        let potentialChords: [Chord]
        let genericPitchSetDescription: String

        var body: some View {
            Group {
                if potentialChords.count == 0 {
                    Text(genericPitchSetDescription).font(.largeTitle)
                        .padding(5)
                } else if potentialChords.count == 1 {
                    if let chord = chord {
                        Text("Chord: \(chord.description + " " + chord.inversionText)").font(.largeTitle)
                            .padding(5)
                    }
                } else {
                    HStack {
                        Text("Potential Chords:").font(.largeTitle)
                            .padding(5)
                        ForEach(potentialChords, id: \.description) { chord in
                            Text(chord.description + " " + chord.inversionText).font(.title)
                                .padding(5)
                                .background(self.chord?.description == chord.description ? Color.blue : Color.clear)
                                .cornerRadius(20)
                                .contentShape(Rectangle())
                                .onTapGesture { self.chord = chord }
                        }
                    }
                }
            }
            .padding(.bottom, 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
