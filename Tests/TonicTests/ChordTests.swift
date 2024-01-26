import Tonic
import XCTest

class ChordTests: XCTestCase {
    func testChords() {
        XCTAssertTrue(Chord.C.isTriad)
        XCTAssertEqual(Chord.Cs.description, "C♯")
        XCTAssertEqual(Chord.Db.description, "D♭")
        XCTAssertEqual(Chord.Asm.description, "A♯m")
        XCTAssertEqual(Chord.Bbm.description, "B♭m")

        XCTAssertEqual(Chord.Adim.description, "A°")
        XCTAssertEqual(Chord.Bdim.description, "B°")

        XCTAssertEqual(Chord.Caug.description, "C⁺")
        XCTAssertEqual(Chord.Aaug.description, "A⁺")
        XCTAssertEqual(Chord(.Db, type: .augmentedTriad).description, "D♭⁺")

        XCTAssertEqual(Chord.Asus4.description, "Asus4")
        XCTAssertEqual(Chord.Bsus4.description, "Bsus4")

        XCTAssertEqual(Chord.Asus2.description, "Asus2")
        XCTAssertEqual(Chord.Bsus2.description, "Bsus2")
    }

    func testRomanNumerals() {
        XCTAssertEqual(Key.C.primaryTriads.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["I", "ii", "iii", "IV", "V", "vi", "vii°"])
        XCTAssertEqual(Key.C.primaryTriads.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["III", "iv", "v", "VI", "VII", "i", "ii°"])
        XCTAssertEqual(Key.C.primaryTriads.map { $0.romanNumeralNotation(in: Key.G) ?? "" },
                       ["IV", "", "vi", "", "I", "ii", ""])
        XCTAssertEqual(Key.Am.primaryTriads.map { $0.romanNumeralNotation(in: Key.Am) ?? "" },
                       ["i", "ii°", "III", "iv", "v", "VI", "VII"])
        XCTAssertEqual(Key.Am.primaryTriads.map { $0.romanNumeralNotation(in: Key.C) ?? "" },
                       ["vi", "vii°", "I", "ii", "iii", "IV", "V"])
    }

    func testTriadNaming() {
        let Cs = Chord(notes: [.Cs, .Es, .Gs])
        XCTAssertEqual(Cs?.description, "C♯")

        let Csm = Chord(notes: [.Cs, .E, .Gs])
        XCTAssertEqual(Csm?.description, "C♯m")

        let Db = Chord(notes: [.Db, .F, .Ab])
        XCTAssertEqual(Db?.description, "D♭")
    }

    func testSixthNaming() {
        let noteSet6 = NoteSet(notes: [.C, .E, .G, .A])
        let chords = ChordTable.shared.getAllChordsForNoteSet(noteSet6)
        XCTAssertTrue(chords.contains(where: { $0.description == "C6" }))
    }

    func testSeventhNaming() {
        let Am7 = Chord(notes: [.C, .E, .G, .A])
        XCTAssertEqual(Am7?.description, "Am7")

        let C7 = Chord(notes: [.C, .E, .G, .Bb])
        XCTAssertEqual(C7?.description, "C7")

        let Cmaj7 = Chord(notes: [.C, .E, .G, .B])
        XCTAssertEqual(Cmaj7?.description, "Cmaj7")

        let ChalfDim7 = Chord(notes: [.C, .Eb, .Gb, .Bb])
        XCTAssertEqual(ChalfDim7?.description, "C(1/2)°7")

        let Adim7 = Chord(notes: [.A, .C, .Eb, .Gb])
        XCTAssertEqual(Adim7?.description, "A°7")
    }

    func testNinthNaming() {
        let Cadd9 = Chord(notes: [.C, .E, .G, .D])
        XCTAssertEqual(Cadd9?.description, "Cadd9")

        let C69 = Chord(notes: [.C, .E, .G, .A, .D])
        XCTAssertEqual(C69?.description, "C6/9")
    }

    func testEleventhNaming() {
        let Cmaj11 = Chord(notes: [.C, .E, .G, .B, .D, .F])
        XCTAssertEqual(Cmaj11?.description, "Cmaj11")

        let G11 = Chord(notes: [.G, .B, .D, .F, .A, .C])
        XCTAssertEqual(G11?.description, "G11")

        let BhalfDiminished11NoteSet = NoteSet(notes: [.B, .D, .F, .A, .C, .E])
        let chords = ChordTable.shared.getAllChordsForNoteSet(BhalfDiminished11NoteSet)
        XCTAssertTrue(chords.contains(where: { $0.description == "B(1/2)°11" }))
    }

    func testThirteenthNaming() {
        let noteSet13 = NoteSet(notes: [.D, .F, .A, .C, .E, .G, .B])
        let chords = ChordTable.shared.getAllChordsForNoteSet(noteSet13)
        XCTAssertTrue(chords.contains(where: { $0.description == "Cmaj13" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Dm13" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Em♭13♭9" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Fmaj13♯11" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Am11♭13" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "B(1/2)°♭13" }))
    }

    func testInversions() {
        let chord = Chord(notes: [.C, .E, .G])!
        XCTAssertEqual(chord.inversion, 0)
        XCTAssertTrue(chord.isTriad)

        let firstInversion = Chord(notes: [.C, .E, Note(.A, octave: 6)])!
        XCTAssertEqual(firstInversion.inversion, 1)
        XCTAssertEqual(firstInversion.description, "Am")

        let secondInversion = Chord(notes: [Note(.E, octave: 1), .A, .C])!
        XCTAssertEqual(secondInversion.inversion, 2)
        XCTAssertEqual(secondInversion.description, "Am")
    }

    func testTriadsWithRedundantNotes() {
        let chord = Chord(notes: [.C, .E, .G, Note(.C, octave: 5)])!
        XCTAssertEqual(chord.description, "C")
    }
    
    func testEnharmonicSuspensions() {
        // Here we show how it is problematic to use a chord initializer if you worry about
        // enharmonic chords
        
        let cSus2 = Chord(notes: [.C, .D, .G])!
        let gSus4 = Chord(notes: [.C, .D, Note(.G, octave: 3)])!
        
        // See how both of these are returning the same chord
        XCTAssertEqual(cSus2.description, "Gsus4")
        XCTAssertEqual(gSus4.description, "Gsus4")
        
        // To deal with this, you have to tell Tonic that you want an array of potential chords
        let gChords = Chord.getRankedChords(from: [.C, .D, Note(.G, octave: 3)])
        
        // What we want is for this to list "Gsus4 first and Csus2 second whereas
        let cChords = Chord.getRankedChords(from: [.C, .D, .G])
        
        // should return the same array, in reversed order
        XCTAssertEqual(gChords.map { $0.description }, ["Gsus4", "Csus2"])
        XCTAssertEqual(cChords.map { $0.description }, ["Csus2", "Gsus4"])
    }

    func testPitchesWithNoInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 0)
        let expectedPitches = [Note(.C, octave: 0), Note(.E, octave: 0), Note(.G, octave: 0)].map { $0.pitch }

        // Act
        let pitches = chord.pitches(octave: 0)

        // Assert
        XCTAssertEqual(pitches, expectedPitches, "Pitches should match expected pitches for no inversion")
    }

    func testPitchesWithInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 1)
        let expectedPitches = [Note(.E, octave: 4), Note(.G, octave: 4), Note(.C, octave: 5)].map { $0.pitch }


        // Act
        let pitches = chord.pitches(octave: 4)

        // Assert
        XCTAssertEqual(pitches.sorted(), expectedPitches.sorted(), "Pitches should match expected pitches for 1st inversion")
    }

    func testNotesWithNoInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 0)
        let expectedNotes = [Note(.C, octave: 4), Note(.E, octave: 4), Note(.G, octave: 4)]

        // Act
        let notes = chord.notes(octave: 4)

        // Assert
        XCTAssertEqual(notes, expectedNotes, "Notes should match expected notes for no inversion")
    }

    func testNotesWithInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 1)
        let expectedNotes = [Note(.E, octave: 4), Note(.G, octave: 4), Note(.C, octave: 5)].sorted()

        // Act
        let notes = chord.notes(octave: 4)

        // Assert
        XCTAssertEqual(notes.sorted(), expectedNotes.sorted(), "Notes should match expected notes for 1st inversion")
    }
}
