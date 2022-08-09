import Foundation
import MIDIKit

class MIDIController {
    let midiManager = MIDI.IO.Manager(clientName: "TonicDemoMIDIManager",
                                      model: "TonicDemo",
                                      manufacturer: "AudioKit")

    var eventHandlers: [([MIDI.Event]) -> Void] = []

    init() {
        do {
            MIDI.IO.setNetworkSession(policy: .anyone)
            try midiManager.start()
            try midiManager.addInputConnection(toOutputs: .currentInputs(),
                                               tag: "inputConnections",
                                               receiveHandler: .events { [weak self] events in
                                                   DispatchQueue.main.async { [weak self] in
                                                       for eventHandler in self!.eventHandlers {
                                                           eventHandler(events)
                                                       }
                                                   }
                                               })

        } catch {
            print("MIDI did not start. Error: \(error)")
        }
    }
}
