import Foundation

let input: String
do {
	input = try String(
		contentsOfFile: "day2_input",
		encoding: .utf8
	)
} catch {
	fatalError("malformed input: \(error)")
}

// MARK: Common
let lines = input
	.split(separator: "\n")
	.map(String.init)

func accumulate(
	_ lookup: [String: Int]
) -> ((Int, String) -> Int) {
	{ $0 + lookup[$1, default: 0] }
}

// MARK: Part One
let scoreLookup = [
		"A X": 4,
		"A Y": 8,
		"A Z": 3,
		"B X": 1,
		"B Y": 5,
		"B Z": 9,
		"C X": 7,
		"C Y": 2,
		"C Z": 6
]

let partOne = lines
	.reduce(0, accumulate(scoreLookup))
print("Part One", partOne)

// MARK: Part Two
let scoreLookupPartTwo = [
		"A X": 3,
		"A Y": 4,
		"A Z": 8,
		"B X": 1,
		"B Y": 5,
		"B Z": 9,
		"C X": 2,
		"C Y": 6,
		"C Z": 7
]

let partTwo = lines
	.reduce(0, accumulate(scoreLookupPartTwo))
print("Part Two", partTwo)

