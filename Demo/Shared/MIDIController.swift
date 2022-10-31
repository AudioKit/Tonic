import Foundation
import MIDIKit

class MIDIController {
    let midiManager = MIDIManager(clientName: "TonicDemoMIDIManager",
                                  model: "TonicDemo",
                                  manufacturer: "AudioKit")

    var eventHandlers: [([MIDIEvent]) -> Void] = []

    init() {
        do {
            setMIDINetworkSession(policy: .anyone)
            try midiManager.start()
            try midiManager.addInputConnection(toOutputs: [],
                                               tag: "inputConnections",
                                               mode: .allEndpoints,
                                               filter: .owned(),
                                               receiver: .events { [weak self] events in
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
