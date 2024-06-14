import Foundation

// Run-length encoding (RLE) is a form of lossless data compression in which runs of data
// (consecutive occurrences of the same data value) are stored as a single occurrence of
// that data value and a count of its consecutive occurrences, rather than as the original
// run.As an imaginary example of the concept, when encoding an image built up from colored
// dots, the sequence "green green green green green green green green green" is shortened
// to "green x 9".This is most efficient on data that contains many such runs, for example,
// simple graphic images such as icons, line drawings, games, and animations.
// For files that do not have many runs, encoding them with RLE could increase the file size.

func encode(_ value: String) -> String {
    var result = ""
    var lastChar: Character?
    var charCount = 0

    for char in value {
        if let saveChar = lastChar {
            if lastChar == char {
                charCount += 1
            } else {
                result += "\(charCount)\(saveChar)"
                lastChar = char
                charCount = 1
            }
        } else {
            lastChar = char
            charCount += 1
        }
    }

    guard let lastChar else { return "" }
    result += "\(charCount)\(lastChar)"

    return result
}

func decode(_ value: [Character]) -> [Character] {
    var result: [Character] = []

    for index in stride(from: 0, to: value.count, by: 2) {
        // There should be zero allocations in any scenario
        // for Character -> String since that will at worst be a retain. So it's okay :)
        guard let number = Int(String(value[index])) else { return result }
        let character = value[index + 1]
        let decoded = Array(repeating: character, count: number)
        result.append(contentsOf: decoded)
    }

    return result
}
