import SwiftUI
import PianoKeyboard

public struct PianoKeyboardView: UIViewRepresentable {
    public typealias UIViewType = PianoKeyboard
    public var delegate: PianoKeyboardDelegate

    public func makeUIView(context: Context) -> PianoKeyboard {
        let view = PianoKeyboard(frame: CGRect.zero)
        view.delegate = delegate
        view.numberOfKeys = 24
        view.octave = 0
        view.toggleLatch()
        return view
    }
    public func updateUIView(_ uiView: PianoKeyboard, context: Context) {
        uiView.setNeedsDisplay()
    }

    public init(delegate: PianoKeyboardDelegate) {
        self.delegate = delegate
    }
}
