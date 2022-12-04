import Foundation

// MARK: Setup
let input: String
do {
	input = try String(
		contentsOfFile: "day3_input",
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

func priority(_ char: Character) -> Int {
	char.isLowercase
	? ascii(char) - ascii("a") + 1
	: ascii(char) - ascii("A") + 27
}

func prioritize(
	result: Int,
	_ sets: (Set<Character>, Set<Character>)
) -> Int {
	let (compartmentOne, compartmentTwo) = sets
	let shared = compartmentOne
		.intersection(compartmentTwo)
		.first!
	let priority = priority(shared)
	return result + priority
}

func splitCompartments(
	_ substring: Substring
) -> (Set<Character>, Set<Character>) {
	let splitIndex = substring.count / 2
	let one = substring.prefix(splitIndex)
	let two = substring.suffix(splitIndex)
	return (Set(one), Set(two))
}

// MARK: Part One
let partOne = lines
	.map(splitCompartments)
	.reduce(0, prioritize)

print("Part One", partOne)

// MARK: Part Two
func commonElements(_ components: [String]) -> [Character] {
	guard components.count >= 2 else { return [] }
	let sets = components.map(Set.init)
	let common = sets.reduce(into: sets[0]) {
		$0.formIntersection($1)
	}
	return Array(common)
}

let partTwo = lines
	.map(String.init)
	.chunked(into: 3)
	.map { commonElements($0).first! }
	.map(priority)
	.reduce(0, +)
	
print("Part Two", partTwo)

extension Array {
	func chunked(into size: Int) -> [[Element]] {
			stride(from: 0, to: count, by: size).map {
				Array(self[$0..<Swift.min($0 + size, count)])
			}
	}
}
