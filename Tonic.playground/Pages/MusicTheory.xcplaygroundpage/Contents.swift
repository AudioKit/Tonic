//: ## Comparison to the MusicTheory Library by Cem Olcay
//:
//: This playground compares MusicTheory's playground examples
//: to the equivalents in Tonic, pointing out important differences.
//:
//: In MusicTheory you have:
//:
//: `let p: Pitch = "cb2"`
//:
//: We avoid this sort of string based initialization in Tonic because
//: it can easily lead to problems. For instance
//:
//: `let p: Pitch = "aure"`
//:
//: does not crash, it just gives a pitch of 0.
//:
//: In Tonic, a pitch has no real notion of how it is spelled as a note,
//: so pitches are created from the MIDI note number, or they can
//: be derived from a note.

import Tonic

let pFromMIDI: Pitch = Pitch(35)
let b2 = Note(.B, octave: 2)
let cb2 = Note(.C, accidental: .flat, octave: 2)
let pFromNote: Pitch = cb2.pitch


//: In MusicTheory you have:
//:
//: `let b: Key = "b"`
//:
//: `Key` is like `Pitch` except it does not have an octave. We find this
//: to be very confusing because in music, "key" usually refers to the set
//: of notes used in a composition. This gets even more confusing because
//: lowercase is often used to mean minor keys, so this line looks like it
//: it should be defining a set of notes called "B Minor", but it is not
//: that at all.
//:
//: In Tonic, we have `NoteClass` instead:
let b: NoteClass = .B
let cSharp = NoteClass(.C, accidental: .sharp)
//: Next in MusicTheory's playground Cem shows how key and pitch are related:
//: `p.key == b` and in Tonic this is done by checking the pitches of notes
b2 == cb2
b2.pitch == cb2.pitch
//: In MusicTheory's next example:
//:
//: ```
//: let ds: Key = "d#"
//: let eb: Key = "eb"
//: ds == eb
//: ds === eb
//: ```
//: In Tonic, we don't use `==` and `===` as it can be confusing, instead:
let ds = Note(.D, accidental: .sharp)
let eb = Note(.E, accidental: .flat)
ds.pitch == eb.pitch
ds == eb

//: Next we have note shifting by interval
//:```
//: Pitch(key: Key(type: .e, accidental: .natural), octave: 0) - .A5
//: Pitch(key: Key(type: .e, accidental: .natural), octave: 0) - .d5
//: Pitch(key: Key(type: .e, accidental: .natural), octave: 0) + .A5
//: Pitch(key: Key(type: .e, accidental: .natural), octave: 0) + .d5
//: Pitch(key: Key(type: .c, accidental: .sharp), octave: 0) + .M7
//: Pitch(key: Key(type: .b, accidental: .natural), octave: 1) - .M7
//: ```

Note(.E, octave: 0).shiftDown(.A5)
Note(.E, octave: 0).shiftDown(.d5)
Note(.E, octave: 0).shiftUp(.A5)
Note(.E, octave: 0).shiftUp(.d5)
Note(.C, accidental: .sharp, octave: 0).shiftUp(.M7)
Note(.B, octave: 1).shiftDown(.M7)

//: Note, that in MusicTheory B#1 is B1 sharped, wheras in Tonic, it is
//: the "B#" found in octave 1.

//: Next we have Scale, which Tonic again takes a differentnomenclature opinion.
//: In MusicTheory a scale is type and key.
//:
//: `let aminP = Scale(type: .pentatonicMinor, key: "a")`
//:
//: In Tonic, a scale has no notion of its root note, but a `Key` does and here
//: a key is like musicians use it as root note and a type:
let aminP = Key(root: .A, scale: .pentatonicMinor)

//: TODO - something MusicTheory has that we don't:
//let aminPtriad = aminP.harmonicField(for: .thirteenth)
//print(aminPtriad)
//let cSharpHarmonicMinor = Scale(type: .harmonicMinor, key: Key(type: .c, accidental: .sharp))
//let progression = ChordProgression.i_ii_vi_iv
//let cSharpHarmonicMinorTriadsProgression = progression.chords(
//  for: cSharpHarmonicMinor,
//  harmonicField: .triad,
//  inversion: 0
//)

//: Next we have Chord types, in MusicTheory chords are built up from intervals as follows:
//: ```
//: let cdim7 = Chord(type: ChordType(third: .major, fifth: .diminished, seventh: .diminished), key: Key(type: .c))
//: cdim7.notation
//: cdim7.keys
//: ```

//: ```
//: let c13 = Chord(
//:   type: ChordType(
//:     third: .major,
//:     fifth: .perfect,
//:     sixth: nil,
//:     seventh: .dominant,
//:     suspended: nil,
//:     extensions: [
//:       ChordExtensionType(type: .thirteenth, accidental: .natural),
//:     ]
//:   ),
//:   key: Key(
//:     type: .c,
//:     accidental: .natural
//:   )
//: )
//:
//: In Tonic, we build up chords as note collections:

