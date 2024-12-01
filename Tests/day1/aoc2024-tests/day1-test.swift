import Testing
@testable import aoc2024

@Test("test day 1 task 1 combine", arguments: zip(
    [([1,2,3], [4,5,6]), ([4,5,6], [1,2,3])],
    [[
        combination(left: 1, right: 4, distance: 3),
        combination(left: 2, right: 5, distance: 3),
        combination(left: 3, right: 6, distance: 3)
    ],
    [
        combination(left: 4, right: 1, distance: 3),
        combination(left: 5, right: 2, distance: 3),
        combination(left: 6, right: 3, distance: 3)
    ]]
))
func combine(input: (left: [Int], right: [Int]), expect: [combination]) async throws {

    let got = try combine(left: input.left, right: input.right)

    #expect(expect == got)
}


@Test("test day 1 task 2 calc", arguments: zip(
    [([3,4,2,1,3,3], [4,3,5,3,9,3])],
    [
        31
    ]
))
func calc(input: (left: [Int], right: [Int]), expect: Int) async throws {

    let got = try calc(left: input.left, right: input.right)

    #expect(expect == got)
}
