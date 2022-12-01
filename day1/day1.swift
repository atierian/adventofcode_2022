import Foundation

let input: String
do {
	input = try String(
		contentsOfFile: "day1_input",
		encoding: .utf8
	)
} catch {
	fatalError("malformed input: \(error)")
}

let elvesCalories = input
	.split(separator: "\n\n")
	.map {
		$0
			.split(separator: "\n")
			.compactMap { Int($0) }
			.reduce(0, +)
	}
	.sorted(by: >)

let partOne = elvesCalories[0]
print("partOne", partOne)

let partTwo = elvesCalories[0...2]
	.reduce(0, +)
print("partTwo", partTwo)
