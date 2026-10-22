import Tonic
import XCTest

class ChordTests: XCTestCase {
    
    // MARK: - Helper Functions
    func assertChord(_ notes: [Note], expectedType: ChordType, expectedRoot: NoteClass, file: StaticString = #file, line: UInt = #line) {
        let chord = Chord(notes: notes)
        XCTAssertNotNil(chord, "Chord should not be nil", file: file, line: line)
        XCTAssertEqual(chord?.type, expectedType, "Chord type should match", file: file, line: line)
        XCTAssertEqual(chord?.root, expectedRoot, "Chord root should match", file: file, line: line)
    }
    
    func assertChordDescription(_ notes: [Note], expected: String, file: StaticString = #file, line: UInt = #line) {
        let chord = Chord(notes: notes)
        XCTAssertEqual(chord?.description, expected, "Chord description should match", file: file, line: line)
    }
    
    func assertRankedChord(_ pitches: [Int8], expectedDescriptions: [String], file: StaticString = #file, line: UInt = #line) {
        let pitchSet = PitchSet(pitches: pitches.map { Pitch($0) })
        let chords = Chord.getRankedChords(from: pitchSet)
        let descriptions = chords.map { $0.slashDescription }
        XCTAssertEqual(descriptions, expectedDescriptions, "Ranked chord descriptions should match", file: file, line: line)
    }
    
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
        XCTAssertEqual(Chord(.Db, type: .aug).description, "D♭⁺")

        XCTAssertEqual(Chord.Asus4.description, "Asus4")
        XCTAssertEqual(Chord.Bsus4.description, "Bsus4")

        XCTAssertEqual(Chord.Asus2.description, "Asus2")
        XCTAssertEqual(Chord.Bsus2.description, "Bsus2")

        XCTAssertEqual(Chord.Bsus2.description, "Bsus2")
    }

    func testFlatFive() {
        let notes: [Int8] = [60, 64, 66]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["C(♭5)"])
    }
    
    func testDominantSeventhFlatFive() {
        let notes: [Int8] = [60, 64, 66, 70]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["C7(♭5)", "F♯7(♭5)/C"])
    }
    
    func testMajorSeventhFlatFive() {
        let notes: [Int8] = [60, 64, 66, 71]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["Cmaj7(♭5)", "Bsus4(add♭9)/C", "Esus2(add♭13)/C"])
    }
    
    func testMajorNinthFlatFive() {
        let notes: [Int8] = [60, 64, 66, 71, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["Cmaj9(♭5)"])
    }
    
    func testMajorNinthSharpFive() {
        let notes: [Int8] = [60, 64, 68, 71, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["Cmaj9(♯5)(♯11)",
                                                           "E7(add♭13)/C"])
    }
    
    func testDominantNinthFlatFive() {
        let notes: [Int8] = [60, 64, 66, 70, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["C9(♭5)", "D9(♯5)/C"])
    }
    
    func testDominantNinthSharpFive() {
        let notes: [Int8] = [60, 64, 68, 70, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["C9(♯5)", "B♭9(♭5)/C"])
    }

    func test7() {
        XCTAssertEqual(Chord(.C, type: .dom7).description, "C7")
        let notes: [Int8] = [60, 67, 70, 76]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c7 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c7.map { $0.slashDescription }, ["C7"])
    }
    
    func testTheortical() {
        XCTAssertEqual(Chord(.C, type: .dom7).description, "C7")
        let notes: [Int8] = [60, 67, 70, 76]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c7 = Chord.getRankedChords(from: pitchSet, allowTheoreticalChords: true)
        XCTAssertEqual(c7.map { $0.slashDescription }, ["C7", "D𝄫7", "B♯7"])
    }

    func test7sus2() {
        let notes: [Int8] = [60, 62, 67, 70]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c7sus2 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c7sus2.map { $0.slashDescription }, ["C7sus2"])
    }

    func test7sus4() {
        let notes: [Int8] = [60, 65, 67, 70]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c7sus4 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c7sus4.map { $0.slashDescription }, ["C7sus4", "Fsus4(add9)/C", "Fsus2(add11)/C", "B♭sus2(add13)/C"])
    }

    func test9sus4() {
        let notes: [Int8] = [60, 65, 67, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let c9sus4 = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(c9sus4.map { $0.slashDescription }, ["Csus4(add9)", "Csus2(add11)", "G7sus4/C", "Fsus2(add13)/C"])
    }

    func test6sus2() {
        let notes: [Int8] = [60, 62, 67, 69]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["Csus2(add13)", 
                                                           "D7sus4/C",
                                                           "Gsus4(add9)/C",
                                                           "Gsus2(add11)/C"])
    }

    func test6sus4() {
        let notes: [Int8] = [60, 65, 67, 69]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        XCTAssertEqual(chord.map { $0.slashDescription }, ["Csus4(add13)", "F(add9)/C"])
    }
    
    func testMinorMajor7th() {
        let notes: [Int8] = [60, 63, 67, 71]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        let chord2 = Chord(.C, type: .min_maj7)
        XCTAssertEqual(chord2.slashDescription, "CmMaj7")
        XCTAssertEqual(chord.map { $0.slashDescription }, ["CmMaj7"])
    }
    
    func testMinorMajor9th() {
        let notes: [Int8] = [60, 63, 67, 71, 74]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        let chord2 = Chord(.C, type: .min_maj9)
        XCTAssertEqual(chord2.slashDescription, "CmMaj9")
        XCTAssertEqual(chord.map { $0.slashDescription }, ["CmMaj9"])
    }

    func testMinorMajor7thFlat9th() {
        let notes: [Int8] = [60, 63, 67, 71, 73]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        let chord2 = Chord(.C, type: .min_maj_flat9)
        XCTAssertEqual(chord2.slashDescription, "CmMaj(♭9)")
        XCTAssertEqual(chord.map { $0.slashDescription }, ["CmMaj(♭9)"])
    }

    func testMajor7thFlatFive() {
        let notes: [Int8] = [60, 64, 66, 71]
        let pitchSet =  PitchSet(pitches: notes.map { Pitch($0) } )
        let chord = Chord.getRankedChords(from: pitchSet)
        let chord2 = Chord(.C, type: .maj7_flat5)
        XCTAssertEqual(chord2.slashDescription, "Cmaj7(♭5)")
        XCTAssertEqual(chord.map { $0.slashDescription }, ["Cmaj7(♭5)", "Bsus4(add♭9)/C", "Esus2(add♭13)/C"])
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
        let key = Key(root: .C, scale: .wholeDiminished)
        XCTAssertNoThrow(key.primaryTriads.map { $0.romanNumeralNotation(in: key) ?? "" })
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
        let Gm7 = Chord(notes: [.G, .Bb, .D, .F])
        XCTAssertEqual(Gm7?.description, "Gm7")

        let Am7 = Chord(notes: [.A, .C, .E, .G])
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
        XCTAssertEqual(Cadd9?.description, "C(add9)")

        let C69 = Chord(notes: [.C, .E, .G, .A, .D])
        XCTAssertEqual(C69?.description, "C6/9")

        let Cm69 = Chord(notes: [.C, .Eb, .G, .A, .D])
        XCTAssertEqual(Cm69?.description, "Cm(add6)(add9)")
    }

    func testEleventhNaming() {
        let Cmaj11 = Chord(notes: [.C, .E, .G, .B, .D, .F])
        XCTAssertEqual(Cmaj11?.description, "Cmaj11")

        let G11 = Chord(notes: [Note(.G, octave: 1), .B, .D, .F, .A, Note(.C, octave: 2)])
        XCTAssertEqual(G11?.slashDescription, "G11")
        
        let Gm11 = Chord(notes: [Note(.G, octave: 1), .Bb, .D, .F, .A, Note(.C, octave: 2)])
        XCTAssertEqual(Gm11?.slashDescription, "Gm11")
        
        let g_half_dim_11 = Chord(notes: [Note(.G, octave: 1), .Bb, .Db, .F, .A, Note(.C, octave: 2)])
        XCTAssertEqual(g_half_dim_11?.slashDescription, "Gø11")
        
        //TODO: - Finish
    }

    func testThirteenthNaming() {
        let maj13 = Chord(notes: [.C, .E, .G, .B, .D, .F, .A])
        XCTAssertEqual(maj13?.description, "Cmaj13")

        let dom13 = Chord(notes: [.C, .E, .G, .Bb, .D, .F, .A])
        XCTAssertEqual(dom13?.description, "Fmaj13") // Ideally this should be C13 but we ar finding maj13 first

        let min13 = Chord(notes: [.C, .Eb, .G, .Bb, .D, .F, .A])
        XCTAssertEqual(min13?.description, "B♭maj13") // Ideally this should be Cm13 but we ar finding maj13 first

        let half_dim_13 = Chord(notes: [.C, .Eb, .Gb, .Bb, .D, .F, .A])
        XCTAssertEqual(half_dim_13?.description, "Cø13")
        
        
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

        let thirdInversion = Chord(.C, type: .dom7, inversion: 3)

        XCTAssertEqual(thirdInversion.slashDescription, "C7/B♭")
        
        firstInversion = Chord(.Cs, type: .major, inversion: 1)
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
        XCTAssertEqual(cSus2.description, "Csus2")
        XCTAssertEqual(gSus4.description, "Csus2")
        
        // To deal with this, you have to tell Tonic that you want an array of potential chords
        let gChords = Chord.getRankedChords(from: [.C, .D, Note(.G, octave: 2)])

        // What we want is for this to list "Gsus4 first and Csus2 second whereas
        let cChords = Chord.getRankedChords(from: [.C, .D, .G])
        
        // should return the same array, in reversed order
        XCTAssertEqual(gChords.map { $0.description }, ["Gsus4", "Csus2"])
        XCTAssertEqual(cChords.map { $0.description }, ["Csus2", "Gsus4"])

    }
    
    func testEnharmonicChords() {
        let midiNotes: [Int8] = [54,58,61]
        let fSharp =  PitchSet(pitches: midiNotes.map { Pitch($0) } )
        let chords = Chord.getRankedChords(from: fSharp)
        XCTAssertEqual(chords.map { $0.slashDescription }, ["G♭","F♯"])
    }

    func testDuplicateRankedChords() {
        let midiNotes: [Int8] = [60, 64, 67]
        let pitchSet = PitchSet(pitches: midiNotes.map { Pitch($0) } )
        let cChords = Chord.getRankedChords(from: pitchSet, allowTheoreticalChords: true)
        XCTAssertEqual(cChords.map { $0.slashDescription }, ["C", "D𝄫", "B♯"])
    }

    func testPitchesWithNoInversion() {
        // Arrange
        let chord = Chord(.C, type: .major, inversion: 0)
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
        let chord = Chord(.C, type: .major, inversion: 1)
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
        let chord = Chord(.C, type: .major, inversion: 0)
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
        let chord = Chord(.C, type: .major, inversion: 1)
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
        let chord = Chord(.C, type: .maj13, inversion: 1)
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
        let isSubset = expected.allSatisfy {chords.contains($0) }
        XCTAssertTrue(isSubset)
    }

    func testDiatonicChords() {
        // We prioritize by the number of accidentals
        assertChords([1, 5, 8], [.Db, .Cs])
        // Basic triads
        assertChords([2, 6, 9], [.D])
        // This test shows that we are aware that A# Major triad is more compactly described as Bb
        // because of the required C## in the A# spelling
        assertChords([10, 14, 17], [.Bb])
        // F should not be reported as E#
        assertChords([5, 9, 12], [.F])
        // C should not be reported as B#
        assertChords([0, 4, 7], [.C])
        // Extensions that can be spelled only without double accidentals should be found
        assertChords([1, 5, 8, 11], [Chord(.Db, type: .dom7), Chord(.Cs, type: .dom7),])
        assertChords([1, 5, 8, 11, 14], [Chord(.Cs, type: .dom7_flat9)])
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
        let results: [Int8] = [0, 4, 7]
        let pitchSet = PitchSet(pitches: openNotes.map { Pitch($0) })
        let resultSet = PitchSet(pitches: results.map { Pitch($0) })
        XCTAssertEqual(pitchSet.closedVoicing.transposedBassNoteTo(octave: Note.MiddleCStandard.yamaha.firstOctaveOffset), resultSet)
    }

    func testLowestOctave2() {
        let openNotes: [Int8] = [60, 64 + 12, 67 + 24, 60 + 24, 64 + 36]
        let results: [Int8] = [0, 4 + 12, 7 + 24, 0 + 24, 4 + 36] // another idea
        let pitchSet = PitchSet(pitches: openNotes.map { Pitch($0) })
        let resultSet = PitchSet(pitches: results.map { Pitch($0) })
        XCTAssertEqual(pitchSet.transposedBassNoteTo(octave: Note.MiddleCStandard.yamaha.firstOctaveOffset), resultSet)
    }
	
	func testNewChords() {
		let notes: [Int8] = [0, 3, 5, 7, 10]
		let pitchSet = PitchSet(pitches: notes.map { Pitch($0) })
		let chords = Chord.getRankedChords(from: pitchSet)
		print(chords.map {$0.slashDescription})
	}
    
    // MARK: - Dyads

    func testPowerChords() {
        XCTAssertEqual(Chord(notes: [.C, .G])?.description, "C5")
        assertRankedChord([60, 67], expectedDescriptions: ["C5"])
        assertRankedChord([67, 74], expectedDescriptions: ["G5"])
        assertRankedChord([55, 60], expectedDescriptions: ["C5/G"])
    }

    // MARK: - Triads

    func testMajorTriads() {
        assertRankedChord([60, 64, 67], expectedDescriptions: ["C"])
        assertRankedChord([65, 69, 72], expectedDescriptions: ["F"])
        assertRankedChord([67, 71, 74], expectedDescriptions: ["G"])
    }
    
    func testMinorTriads() {
        assertRankedChord([57, 60, 64], expectedDescriptions: ["Am"])
        assertRankedChord([62, 65, 69], expectedDescriptions: ["Dm"])
        assertRankedChord([64, 67, 71], expectedDescriptions: ["Em"])
    }
    
    func testDiminishedTriads() {
        assertRankedChord([59, 62, 65], expectedDescriptions: ["B°"])
        assertRankedChord([62, 65, 68], expectedDescriptions: ["D°"])
    }
    
    func testAugmentedTriads() {
        assertRankedChord([60, 64, 68], expectedDescriptions: ["C⁺", "A♭⁺/C"])
        assertRankedChord([65, 69, 73], expectedDescriptions: ["F⁺", "D♭⁺/F"])
    }
    
    // MARK: - Seventh Chords
    
    func testDominantSeventhChords() {
        assertRankedChord([67, 71, 74, 77], expectedDescriptions: ["G7"])
        assertRankedChord([60, 64, 67, 70], expectedDescriptions: ["C7"])
    }
    
    func testMajorSeventhChords() {
        assertRankedChord([60, 64, 67, 71], expectedDescriptions: ["Cmaj7"])
        assertRankedChord([65, 69, 72, 76], expectedDescriptions: ["Fmaj7"])
    }
    
    func testMinorSeventhChords() {
        assertRankedChord([57, 60, 64, 67], expectedDescriptions: ["Am7", "C6/A"])
        assertRankedChord([62, 65, 69, 72], expectedDescriptions: ["Dm7", "F6/D"])
    }
    
    func testHalfDiminishedSeventhChords() {
        assertRankedChord([59, 62, 65, 69], expectedDescriptions: ["Bø7", "Dm6/B"])
        assertRankedChord([64, 67, 70, 74], expectedDescriptions: ["Eø7", "Gm6/E"])
    }
    
    func testDiminishedSeventhChords() {
        assertRankedChord([59, 62, 65, 68], expectedDescriptions: ["B°7", "G♯°7/B"])
        assertRankedChord([62, 65, 68, 71], expectedDescriptions: ["D°7", "B°7/D", "G♯°7/D"])
    }
    
    // MARK: - Extended Chords
    
    func testNinthChords() {
        assertRankedChord([60, 64, 67, 70, 74], expectedDescriptions: ["C9", "Eø7(add♭13)/C"])
        assertRankedChord([62, 65, 69, 72, 76], expectedDescriptions: ["Dm9", "Fmaj7(add13)/D"])
    }
    
    func testEleventhChords() {
        assertRankedChord([60, 64, 67, 70, 74, 77], expectedDescriptions: ["C11", "Fmaj13sus2/C", "Fmaj13sus4/C", "Gm13(add11)/C"])
        assertRankedChord([65, 69, 72, 76, 79, 82], expectedDescriptions: ["Fmaj11", "C13(add11)/F"])
    }
    
    func testThirteenthChords() {
        assertRankedChord([60, 64, 67, 70, 74, 77, 81], 
                          expectedDescriptions: ["C13",
                                                 "Gm13/C",
                                                 "Fmaj13/C",
                                                 "Dm7(♭13)/C",
                                                 "Dm11(♭13)/C",
                                                 "Am(♭13)(♭9)/C",
                                                 "B♭maj13(♯11)/C",
                                                 "Am7(♭9)(♭13)/C",
                                                 "Eø7(♭5)(♭9)(♭13)/C"])
        
        assertRankedChord([67, 71, 74, 77, 81, 84, 88], 
                          expectedDescriptions: ["G13",
                                                 "Dm13/G",
                                                 "Cmaj13/G",
                                                 "Am7(♭13)/G",
                                                 "Am11(♭13)/G",
                                                 "Fmaj13(♯11)/G",
                                                 "Em(♭13)(♭9)/G",
                                                 "Em7(♭9)(♭13)/G",
                                                 "Bø7(♭5)(♭9)(♭13)/G"])
    }
    
    // MARK: - Suspended Chords
    func testSus2Chords() {
        assertRankedChord([60, 62, 67], expectedDescriptions: ["Csus2", "Gsus4/C"])
        assertRankedChord([65, 67, 72], expectedDescriptions: ["Fsus2", "Csus4/F"])
    }
    
    func testSus4Chords() {
        assertRankedChord([60, 65, 67], expectedDescriptions: ["Csus4", "Fsus2/C"])
        assertRankedChord([67, 72, 74], expectedDescriptions: ["Gsus4", "Csus2/G"])
    }
    
    // MARK: - Add Chords
    
    func testAdd9Chords() {
        assertRankedChord([60, 64, 67, 74], expectedDescriptions: ["C(add9)", "Gsus4(add13)/C"])
        assertRankedChord([65, 69, 72, 79], expectedDescriptions: ["F(add9)", "Csus4(add13)/F"])
    }

    func testAddSharp4Chords() {
        assertRankedChord([60, 64, 66, 67], expectedDescriptions: ["C(add♯4)"])
        assertRankedChord([65, 69, 71, 72], expectedDescriptions: ["F(add♯4)"])
    }

    func testMinorSixNineChords() {
        assertRankedChord([60, 63, 67, 69, 74], expectedDescriptions: ["Cm(add6)(add9)", "Aø7(add11)/C", "D7sus4(♭9)/C"])
        assertRankedChord([62, 65, 69, 71, 76], expectedDescriptions: ["Dm(add6)(add9)", "Bø7(add11)/D", "E7sus4(♭9)/D"])
    }

    // MARK: - Altered Chords
    
    func testFlatFiveChords() {
        assertRankedChord([60, 64, 66], expectedDescriptions: ["C(♭5)"])
        assertRankedChord([67, 71, 73], expectedDescriptions: ["G(♭5)"])
    }
    
    func testSharpFiveChords() {
        assertRankedChord([60, 64, 68], expectedDescriptions: ["C⁺", "A♭⁺/C"])
        assertRankedChord([65, 69, 73], expectedDescriptions: ["F⁺", "D♭⁺/F"])
    }

    func testMajorSeventhSharpFiveAddSharpEleventhChords() {
        assertRankedChord([60, 64, 68, 71, 78], expectedDescriptions: ["Cmaj7(♯5)(add♯11)"])
        assertRankedChord([65, 69, 73, 76, 83], expectedDescriptions: ["Fmaj7(♯5)(add♯11)"])
    }

    // MARK: - Inversions
    
    func testFirstInversion() {
        assertRankedChord([64, 67, 72], expectedDescriptions: ["C/E"])
    }
    
    func testSecondInversion() {
        assertRankedChord([67, 72, 76], expectedDescriptions: ["C/G"])
    }
    
    // MARK: - Edge Cases
    
//    func testEnharmonicChords() {
//        assertRankedChord([54, 58, 61], expectedDescriptions: ["G♭", "F♯"])
//    }
    
    func testChordWithRedundantNotes() {
        assertRankedChord([60, 64, 67, 72], expectedDescriptions: ["C"])
    }
    
    func testUncommonChords() {
        assertRankedChord([60, 64, 67, 71, 74, 77, 81], expectedDescriptions: ["Cmaj13", "G13/C", "Dm13/C", "Am7(♭13)/C", "Am11(♭13)/C", "Fmaj13(♯11)/C", "Em(♭13)(♭9)/C", "Em7(♭9)(♭13)/C", "Bø7(♭5)(♭9)(♭13)/C"])
        assertRankedChord([60, 63, 66, 69], expectedDescriptions: ["C°7", "A°7/C", "F♯°7/C", "D♯°7/C"])
        assertRankedChord([60, 63, 67, 71], expectedDescriptions: ["CmMaj7"])
    }
    
    func testPolychordsAndAmbiguousChords() {
        assertRankedChord([65, 69, 72, 74, 79], expectedDescriptions: ["F6/9", "G9sus4/F", "G11sus2/F", "Dm7(add11)/F"])
        assertRankedChord([65, 69, 72, 76, 79], expectedDescriptions: ["Fmaj9", "Am7(add♭13)/F"])
    }

    // MARK: - Octave-Doubled Voicings
    //
    // A chord must be detected the same regardless of how many times its notes
    // are doubled at other octaves — guitar voicings routinely repeat the root,
    // third, and fifth across six strings. Detection currently breaks when
    // *every* pitch class is doubled (e.g. a full six-string D/F♯): the chord
    // search never matches a unison/octave of the root, so `foundNotes` falls
    // one short of `pitchSet.count`. The "every note doubled" cases below
    // document that bug and should pass once it is fixed.

    func testDMajorDetectedInRootPosition() {
        // D F♯ A
        assertRankedChord([50, 54, 57], expectedDescriptions: ["D"])
    }

    func testDMajorOverFSharpDetectedWithDistinctNotes() {
        // F♯ A D
        assertRankedChord([42, 45, 50], expectedDescriptions: ["D/F♯"])
    }

    func testDMajorOverFSharpDetectedWhenFifthAndOctaveDoubled() {
        // F♯ A D A D — A and D doubled; F♯ is still single so it can root the search
        assertRankedChord([42, 45, 50, 57, 62], expectedDescriptions: ["D/F♯"])
    }

    func testDMajorOverFSharpDetectedWhenEveryNoteDoubled() {
        // F♯ A D A D F♯ — full six-string voicing, every pitch class doubled
        assertRankedChord([42, 45, 50, 57, 62, 66], expectedDescriptions: ["D/F♯"])
    }

    func testCMajorDetectedWhenRootAndThirdDoubled() {
        // C E G C E — G is single so the search can root on G
        assertRankedChord([60, 64, 67, 72, 76], expectedDescriptions: ["C"])
    }

    func testCMajorDetectedWhenEveryNoteDoubled() {
        // C E G C E G — every pitch class doubled
        assertRankedChord([60, 64, 67, 72, 76, 79], expectedDescriptions: ["C"])
    }

}
