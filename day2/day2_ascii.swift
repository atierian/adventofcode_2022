import Foundation

// MARK: Setup
let input: String
do {
	input = try String(
		contentsOfFile: "day2_input",
		encoding: .utf8
	)
} catch {
	fatalError("malformed input: \(error)")
}

let lines = input
	.split(separator: "\n")
	
// MARK: Common
func ascii(_ char: Character) -> Int {
	Int(char.asciiValue!)
}

func asciiize(_ substring: Substring) -> (Int, Int) {
	let asciiValues = substring
		.map(ascii)
	return (asciiValues[0], asciiValues[2])
}

func normalize(_ asciiValues: (Int, Int)) -> (Int, Int) {
	let (left, right) = asciiValues
	return (left - ascii("B"), right - ascii("Y"))
}

func score(
	signs: [Int] = [1, 2, 3], // rock, paper, scissors
	outcomes: [Int] = [0, 3, 6], // loss, draw, win
	rules: @escaping (Int, Int) -> (Int, Int)
) -> ((Int, Int) -> Int) {
	return {
		let (sign, outcome) = rules($0, $1)
		let index = { ($0 + 4) % 3 }
		return signs[index(sign)]
		+ outcomes[index(outcome)]
	}
}

let normalizedInput = input
	.split(separator: "\n")
	.map(asciiize)
	.map(normalize)

let partOneRules: (Int, Int) -> (Int, Int) = { left, right in
	(right, right - left)
}

let partOne = normalizedInput
	.map(score(rules: partOneRules))
	.reduce(0, +)

print("Part One", partOne)

let partTwoRules: (Int, Int) -> (Int, Int) = { left, right in
	(left + right, right)
}

let partTwo = normalizedInput
	.map(score(rules: partTwoRules))
	.reduce(0, +)

print("Part Two", partTwo)
