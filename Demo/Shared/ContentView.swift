import SwiftUI
import Keyboard

struct ContentView: View {
    @StateObject var chordIdentifier = ChordIdentifier()
    var midiController = MIDIController()
    var keyboard = Keyboard(model: KeyboardModel(noteRange: 40...60))
    var body: some View {
        VStack {
            Text("\(chordIdentifier.chord?.description ?? "") \(chordIdentifier.inversionText)")
            keyboard
        }
        .padding()
        .onAppear {
            midiController.eventHandlers.append( chordIdentifier.eventHandler)
            midiController.eventHandlers.append(
                keyboard.eventHandler)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
