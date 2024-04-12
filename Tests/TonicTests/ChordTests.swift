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

        XCTAssertEqual(Chord.Bsus2.description, "Bsus2")
    }

    func testFlatFive() {
        let notes: [Int8] = [60, 64, 66]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let cb5 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(cb5.map { $0.description }, ["C♭5"])
    }

    func test7() {
        XCTAssertEqual(Chord(.C, type: .dominantSeventh).description, "C7")
        let notes: [Int8] = [60, 67, 70, 76]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c7 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c7.map { $0.description }, ["C7"])
    }

    func test7sus2() {
        let notes: [Int8] = [60, 62, 67, 70]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c7sus2 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c7sus2.map { $0.description }, ["C7sus2"])
    }

    func test7sus4() {
        let notes: [Int8] = [60, 65, 67, 70]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c7sus4 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c7sus4.map { $0.description }, ["C7sus4", "B♭6sus2", "F9sus4"])
    }

    func test9sus4() {
        let notes: [Int8] = [60, 65, 67, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c9sus4 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c9sus4.map { $0.description }, ["C9sus4", "G7sus4", "F6sus2"])
    }

    func test6sus2() {
        let notes: [Int8] = [60, 62, 67, 69]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.description }, ["C6sus2", "G9sus4", "D7sus4"])
    }

    func test6sus4() {
        let notes: [Int8] = [60, 65, 67, 69]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.description }, ["C6sus4", "Fadd9"])
    }
    /*
     60  61  62  63  64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79  80  81
     C   C#  D   D#  E   F   F#  G   G#  A   Bb  B   C   C#  D   D#  E   F   F#  G   G#  A
     */
    
    func testMinorMajor7th() {
        let notes: [Int8] = [60, 63, 67, 71]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        let chord2 = Chord(.C, type: .minorMajorSeventh)
        XCTAssertEqual(chord2.description, "CmMaj7")
        XCTAssertEqual(chord.map { $0.description }, ["CmMaj7"])
    }
    
    func testMinorMajor9th() {
        let notes: [Int8] = [60, 63, 67, 71, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        let chord2 = Chord(.C, type: .minorMajorNinth)
        XCTAssertEqual(chord2.description, "CmMaj9")
        XCTAssertEqual(chord.map { $0.description }, ["CmMaj9"])
    }


    func testAugmentedDiminishededChordsPreferNoInversions() {
        let notes: [Int8] = [60, 64, 68]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let cAug = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(cAug.map { $0.slashDescription }.first, "C⁺")
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
        XCTAssertEqual(ChalfDim7?.description, "Cø7")

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

        let BhalfDiminished11NoteSet = NoteSet(notes: [Note(.B, octave: 1), .D, .F, .A, .C, .E])
        let chords = ChordTable.shared.getAllChordsForNoteSet(BhalfDiminished11NoteSet)
        XCTAssertTrue(chords.contains(where: { $0.description == "Bø11" }))
    }

    func testThirteenthNaming() {
        let noteSet13 = NoteSet(notes: [.D, .F, .A, .C, .E, .G, .B])
        let chords = ChordTable.shared.getAllChordsForNoteSet(noteSet13)
        XCTAssertTrue(chords.contains(where: { $0.description == "Cmaj13" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Dm13" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Em♭13♭9" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Fmaj13♯11" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Am11♭13" }))
        XCTAssertTrue(chords.contains(where: { $0.description == "Bø♭13" }))
    }

    func testInversions() {
        let chord = Chord(notes: [.C, .E, .G])!
        XCTAssertEqual(chord.inversion, 0)
        XCTAssertTrue(chord.isTriad)

        var firstInversion = Chord(notes: [.C, .E, Note(.A, octave: 6)])!
        XCTAssertEqual(firstInversion.inversion, 1)
        XCTAssertEqual(firstInversion.slashDescription, "Am/C")

        let secondInversion = Chord(notes: [Note(.E, octave: 1), .A, .C])!
        XCTAssertEqual(secondInversion.inversion, 2)
        XCTAssertEqual(secondInversion.slashDescription, "Am/E")

        let thirdInversion = Chord(.C, type: .dominantSeventh, inversion: 3)

        XCTAssertEqual(thirdInversion.slashDescription, "C7/B♭")
        
        firstInversion = Chord(.Cs, type: .majorTriad, inversion: 1)
        XCTAssertEqual(firstInversion.slashDescription, "C♯/E♯")
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
    
    func testEnharmonicChords() {
        let midiNotes: [Int8] = [54, 58, 61]
        let fSharp =  PitchSet(pitches: midiNotes.map { Pitch($0) } )
        let chords = Chord.getRankedChords(from: fSharp)
        XCTAssertEqual(chords.map { $0.description }, ["G♭","F♯"])
    }

    func testDuplicateRankedChords() {
        let midiNotes: [Int8] = [60, 64, 67]
        let pitchSet = PitchSet(pitches: midiNotes.map { Pitch($0) } )
        let cChords = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(cChords.map { $0.description }, ["C"])
    }

    func testPitchesWithNoInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 0)
        let expectedPitches = [
            Note(.C, octave: 0),
            Note(.E, octave: 0),
            Note(.G, octave: 0)
        ].map { $0.pitch }

        // Act
        let pitches = chord.pitches(octave: 0)

        // Assert
        XCTAssertEqual(
            pitches,
            expectedPitches,
            "Pitches should match expected pitches for no inversion"
        )
    }

    func testPitchesWithInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 1)
        let expectedPitches = [
            Note(.E, octave: 4),
            Note(.G, octave: 4),
            Note(.C, octave: 5)
        ].map { $0.pitch }

        // Act
        let pitches = chord.pitches(octave: 4)

        // Assert
        XCTAssertEqual(
            pitches,
            expectedPitches,
            "Pitches should match expected pitches for 1st inversion"
        )
    }

    func testNotesWithNoInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 0)
        let expectedNotes = [
            Note(.C, octave: 4),
            Note(.E, octave: 4),
            Note(.G, octave: 4)
        ]

        // Act
        let notes = chord.notes(octave: 4)

        // Assert
        XCTAssertEqual(
            notes,
            expectedNotes,
            "Notes should match expected notes for no inversion"
        )
    }

    func testNotesWithInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorTriad, inversion: 1)
        let expectedNotes = [
            Note(.E, octave: 4),
            Note(.G, octave: 4),
            Note(.C, octave: 5)
        ]

        // Act
        let notes = chord.notes(octave: 4)

        // Assert
        XCTAssertEqual(
            notes,
            expectedNotes,
            "Notes should match expected notes for 1st inversion"
        )
    }

    func testNotesWithMultipleOctaveChordInversion() {
        // Arrange
        let chord = Chord(.C, type: .majorThirteenth, inversion: 1)
        let expectedNotes = [
            Note(.E, octave: 4),
            Note(.G, octave: 4),
            Note(.B, octave: 4),
            Note(.D, octave: 5),
            Note(.F, octave: 5),
            Note(.A, octave: 5),
            Note(.C, octave: 6),
        ]

        // Act
        let notes = chord.notes(octave: 4)

        // Assert
        XCTAssertEqual(
            notes,
            expectedNotes,
            "Notes should match expected notes for 1st inversion"
        )
    }
    
    func testBassNoteChords() {
        // C Major 1st inversion
        let notes: [Int8] = [4, 7, 12]
        let pitchSet = PitchSet(pitches: notes.map { Pitch($0) })
        let chords = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chords.map{$0.bassNote}, [NoteClass.E])
    }

    func assertChords(_ notes: [Int8], _ expected: [Chord]) {
        let pitchSet = PitchSet(pitches: notes.map { Pitch($0) })
        let chords = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chords.map { $0.slashDescription }, expected.map { $0.slashDescription })
    }

    func testDiatonicChords() {
        // Basic triads
        assertChords([2, 6, 9], [.D])

        // We prioritize by the number of accidentals
        assertChords([1, 5, 8], [.Db, .Cs])

        // This test shows that we are aware that A# Major triad is more compactly described as Bb
        // because of the required C## in the A# spelling
        assertChords([10, 14, 17], [.Bb])
        // F should not be reported as E#
        assertChords([5, 9, 12], [.F])
        // E could be reported as Fb, but its accidental is lower it is first
        assertChords([4, 8, 11], [.E, .Fb])
        // C should not be reported as B#
        assertChords([0, 4, 7], [.C])
        // B could be reported as Cb, but its accidental is lower it is first
        assertChords([11, 15, 18], [.B, .Cb])

        // Extensions that can be spelled only without double accidentals should be found
        assertChords([1, 5, 8, 11], [Chord(.Db, type: .dominantSeventh), Chord(.Cs, type: .dominantSeventh),])
        assertChords([1, 5, 8, 11, 14], [Chord(.Cs, type: .flatNinth)])
    }

    func testClosedVoicing() {
        let openNotes: [Int8] = [60, 64 + 12, 67 + 24, 60 + 24, 64 + 36]
        let results: [Int8] = [60, 64, 67]
        let pitchSet = PitchSet(pitches: openNotes.map { Pitch($0) })
        let resultSet = PitchSet(pitches: results.map { Pitch($0) })
        XCTAssertEqual(pitchSet.closedVoicing, resultSet)
    }

    func testLowestOctave() {
        let openNotes: [Int8] = [60, 64 + 12, 67 + 24, 60 + 24, 64 + 36]
        let results: [Int8] = [0, 4, 7] // another idea
        let pitchSet = PitchSet(pitches: openNotes.map { Pitch($0) })
        let resultSet = PitchSet(pitches: results.map { Pitch($0) })
        XCTAssertEqual(pitchSet.closedVoicing.transposedBassNoteTo(octave: -1), resultSet)
    }

    func testLowestOctave2() {
        let openNotes: [Int8] = [60, 64 + 12, 67 + 24, 60 + 24, 64 + 36]
        let results: [Int8] = [0, 4 + 12, 7 + 24, 0 + 24, 4 + 36] // another idea
        let pitchSet = PitchSet(pitches: openNotes.map { Pitch($0) })
        let resultSet = PitchSet(pitches: results.map { Pitch($0) })
        XCTAssertEqual(pitchSet.transposedBassNoteTo(octave: -1), resultSet)
    }


}
