import SwiftUI

struct ContentView: View {
    @StateObject var chordIdentifier = ChordIdentifier()
    var midiController = MIDIController()
    var body: some View {
        VStack {
            Text("\(chordIdentifier.chord?.description ?? "") \(chordIdentifier.inversionText)")
            PianoKeyboardView(delegate: chordIdentifier)
        }
        .padding()
        .onAppear {
            midiController.eventHandler = chordIdentifier.eventHandler
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
