# ``Tonic``

Swift library for music theory, currently focused on chords/harmony.

## Overview

Code is hosted on Github: [](https://github.com/AudioKit/Tonic/)

![Demo Screenshot](demo)

Tonic answers musical questions, such as:

- What's the note for this pitch in this key? 

    `Note(pitch: Pitch(midiNoteNumber), key: .Bb)`

- What's the name of a chord? 

    `Chord(notes: notes).description`

- What chords are in this key? 

    `Key.Cm.chords`

- What chords in this key contain this note? 

    `Key.C.chords.filter { $0.noteClasses.contains(.C) }`

- What notes do these keys have in common?  

    `Key.C.noteSet.intersection(Key.Cm.noteSet)`

- What notes don't these keys have in common? 

    `Key.C.noteSet.symmetricDifference(Key.Cm.noteSet)`

These questions are all tested in our unit tests explicitly.

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
