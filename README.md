# Tonic

Swift library for music theory.

Tonic answers musical questions, such as:

- Is this set of notes a chord?
- If so, what's the name of the chord?
- What chords are in this key?
- What chords in this key contain this note?
- What chords do these keys have in common?

## Goals

- Correctness. Try to be as correct with respect to music theory as possible.
- Strong typing. Use types to prevent errors (e.g. `Pitch` instead of `UInt8`).
- Good performance. Tonic uses bit sets to represent pitch sets and note sets.

## Install

Install using Swift Package Manager.
