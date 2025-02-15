import Tonic
import XCTest

final class ReadMeTests: XCTestCase {
    // What's the note for this pitch in this key?
    func testNoteForPitchInKey() {
        let midiNoteNumber: Int8 = 61
        XCTAssertEqual(Note(pitch: Pitch(midiNoteNumber), key: .Bb), Note.Db)
    }

    // What's the name of a chord?
    func testNameOfChord() {
        let notes: [Note] = [.C, .Eb, .Gb]
        XCTAssertEqual(Chord(notes: notes)!.description, "C°")
    }

    // What chords are in this key?
    func testChordsInKey() {
        XCTAssertEqual(Key.Cm.chords.count, 60)
    }

    // What chords in this key contain this note?
    func testChordsInKeyContainNote() {
        XCTAssertEqual(Key.C.chords.filter { $0.noteClasses.contains(.C) }.count, 36)
    }

    // What notes do these keys have in common?
    func testCommonNotesInKeys() {
        let commonNoteSet = Key.C.noteSet.intersection(Key.Cm.noteSet)
        let answer: [Note] = [.C, .D, .F, .G]
        XCTAssertEqual(commonNoteSet.array.sorted(), answer)
    }

    // What notes don't these keys have in common?
    func testDifferentNotesInKeys() {
        let differentNoteSet = Key.C.noteSet.symmetricDifference(Key.Cm.noteSet)
        let answer: [Note] = [.Eb, .E, .Ab, .A, .Bb, .B]
        XCTAssertEqual(differentNoteSet.array.sorted(), answer)
    }
}
