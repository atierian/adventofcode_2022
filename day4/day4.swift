import Foundation

// MARK: Setup
let input: String
do {
	input = try String(
		contentsOfFile: "day4_input",
		encoding: .utf8
	)
} catch {
	fatalError("malformed input: \(error)")
}

let lines = input
	.split(separator: "\n")

// MARK: Common
let sets = lines
	.map {
		$0
			.split(separator: ",")
			.map {
				let ints = $0
				.split(separator: "-")
				.map(String.init)
				.compactMap(Int.init)
				return Set(ints[0]...ints[1])
			}
	}

// MARK: Part One
let partOne = sets
	.reduce(0) { partialResult, pair in
		pair[0].isSubset(of: pair[1]) || pair[0].isSuperset(of: pair[1])
		? partialResult + 1
		: partialResult
	}

print("partOne", partOne)

// MARK: Part Two
let partTwo = sets
	.reduce(0) { partialResult, pair in
		pair[0].isDisjoint(with: pair[1])
		? partialResult
		: partialResult + 1
	}

print("partTwo", partTwo)

extension Array {
	func chunked(into size: Int) -> [[Element]] {
			stride(from: 0, to: count, by: size).map {
				Array(self[$0..<Swift.min($0 + size, count)])
			}
	}
}
