import Foundation

// Run-length encoding (RLE) is a form of lossless data compression in which runs of data
// (consecutive occurrences of the same data value) are stored as a single occurrence of
// that data value and a count of its consecutive occurrences, rather than as the original
// run.As an imaginary example of the concept, when encoding an image built up from colored
// dots, the sequence "green green green green green green green green green" is shortened
// to "green x 9".This is most efficient on data that contains many such runs, for example,
// simple graphic images such as icons, line drawings, games, and animations.
// For files that do not have many runs, encoding them with RLE could increase the file size.
// Inspired to write by Prime's video: https://www.youtube.com/watch?v=3f9tbqSIm-E

/// Encodes a sequence of characters using run-length encoding.
///
/// Run-length encoding (RLE) is a simple form of data compression where sequences of the same data value (characters, in this case)
/// are stored as a single data value and a count.
///
/// - Parameter value: An array of characters to encode.
/// - Returns: An array of characters representing the run-length encoded version of the input.
///
/// The encoded format consists of numbers (indicating the count of consecutive characters) followed by the character itself.
///
/// Example:
/// ```
/// let input: [Character] = ["a", "a", "b", "b", "b", "c"]
/// let encoded = encode(input)
/// print(String(encoded)) // Output: "2a3b1c"
/// ```
func encode(_ value: [Character]) -> [Character] {
    var result: [Character] = []
    var index = 0

    while index < value.count {
        var count = 1

        while index + 1 < value.count, value[index] == value[index + 1] {
            index += 1
            count += 1
        }

        result.append(contentsOf: Array("\(count)\(value[index])"))
        index += 1
    }

    return result
}

/// Decodes a run-length encoded sequence of characters.
///
/// This function takes an array of characters encoded with run-length encoding and restores the original sequence.
///
/// - Parameter value: An array of characters representing the run-length encoded sequence.
/// - Returns: An array of characters that is the decoded version of the input.
///
/// The decoded format converts the encoded numbers and characters back into their original repeated sequence.
///
/// Example:
/// ```
/// let encoded: [Character] = ["2", "a", "3", "b", "1", "c"]
/// let decoded = decode(encoded)
/// print(String(decoded)) // Output: "aabbbbc"
/// ```
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
