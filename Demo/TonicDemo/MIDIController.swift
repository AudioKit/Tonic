import MIDIKit
import Foundation

class MIDIController {

    let midiManager = MIDI.IO.Manager(clientName: "TriadGameMIDIManager",
                                      model: "Triad Game",
                                      manufacturer: "AudioKit")

    var eventHandler: (Array<MIDI.Event>)->Void = { _ in }

    init() {
        do {
            MIDI.IO.setNetworkSession(policy: .anyone)
            try midiManager.start()
            try midiManager.addInputConnection(toOutputs: .current(),
                                               tag: "inputConnections",
                                               receiveHandler: .events { [weak self] events in
                    DispatchQueue.main.async {
                        self?.eventHandler(events)
                    }
                })

        } catch {
            print("MIDI did not start. Error: \(error)")
        }
    }


}
