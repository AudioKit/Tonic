
enum Letter {
    case a, b, c, d, e, f, g
}

enum Accidental {
    case flat, natural, sharp
}

struct Tonic {
    var letter: Letter
    var accidental: Accidental
}
