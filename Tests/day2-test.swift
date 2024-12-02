import Testing
@testable import aoc2024

@Test("test day 2 task 1 isSteep", arguments: zip(
    [
        [7, 6, 4, 2, 1],
        [1, 2, 7, 8, 9],
        [9, 7, 6, 2, 1],
        [1, 3, 2, 4, 5],
        [8, 6, 4, 4, 1],
        [1, 3, 6, 7, 9],
    ],
    [
        false,
        true,
        true,
        true,
        true,
        false
]
))
func t_isSteep(input: [Int], expect: Bool) async throws {
    #expect(isSteep(input: input) == expect)
}

@Test("test day 2 task 2 isSteepDampned", arguments: zip(
    [
        [7, 6, 4, 2, 1],
        [1, 2, 7, 8, 9],
        [9, 7, 6, 2, 1],
        [1, 3, 2, 4, 5],
        [8, 6, 4, 4, 1],
        [1, 3, 6, 7, 9],
    ],
    [
        false,
        true,
        true,
        false,
        false,
        false
]
))
func t_isSteepDampned(input: [Int], expect: Bool) async throws {
    #expect(isSteepDampned(input: input) == expect)
}