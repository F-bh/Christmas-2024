import Testing
@testable import aoc2024

@Test("day 3 test Instruction parsing ok", arguments: zip(
    [
        "mul(1,2)",
        "98d1%mul(9,7)",
        "mul(2,1)&_ xw+m"
    ],
    [
        Instruction.mul(1, 2),
        Instruction.mul(9, 7),
        Instruction.mul(2, 1)
    ]
    ))
func instructionParseOk(input: String, expected: Instruction) async throws {
    let ins = try Instruction(input: input)
    #expect(ins == expected)
}

@Test("day 3 test Instruction parsingFails", arguments: zip(
    [
        "mut(1,2)",
        "",
        "mul((2,1))&_ xw+m"
    ],
    [
        Day3Error.IllegalInstruction,
        Day3Error.IllegalInput,
        Day3Error.IllegalInput
    ]
    ))
func instructionParseErr(input: String, expected: Day3Error) async throws {
    do {
        let _ = try Instruction(input: input)
    } catch {
        #expect(error as? Day3Error == expected)
    }
}


@Test("day 3 test parsing", arguments: zip(
    [
        "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    ],
    [
        [
            Instruction.mul(2,4),
            Instruction.deactivate,
            Instruction.mul(5,5),
            Instruction.mul(11,8),
            Instruction.activate,
            Instruction.mul(8,5),
        ]
    ]
    ))
func instructionParseAll(input: String, expected: [Instruction]) async throws {
   let got = try parse_instructions(input: input)
   #expect(got == expected)
}


@Test("day 3 test instruction calc", arguments: zip(
    [
        [
            Instruction.mul(2,4),
            Instruction.mul(5,5),
            Instruction.mul(11,8),
            Instruction.mul(8,5)
        ]
    ],
    [
        161
    ]
))
func calc(input: [Instruction], expected: Int) async throws{
    let got = input.reduce(0) { acc, val in
         acc + (val.calc() ?? 0)
    }

    #expect(got == expected)
}