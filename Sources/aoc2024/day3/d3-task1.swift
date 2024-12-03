enum Day3Error: Error {
    case IllegalInput
    case IllegalInstruction
}

enum Instruction: Equatable {
    case mul(Int,Int)

    func calc() -> Int {
        switch self {
            case let.mul(x, y):
                return x*y
        }
    }

    init(input: String) throws {
        guard input.count(where: { c in
             c == ")"
        }) == 1 else {
            throw Day3Error.IllegalInput
        }

        guard input.count(where: { c in
             c == "("
        }) > 0 else {
            throw Day3Error.IllegalInput
        }

        guard input.count > 2 else {
            throw Day3Error.IllegalInput
        }

        let open = input.lastIndex(of: "(")!
        let openOffsetByOne = input.index(open, offsetBy: 1)
        let closed = input.firstIndex(of: ")")!

        let instructionInput = input[openOffsetByOne..<closed]
        let split = try instructionInput.split(separator: ",").map { sub in
            let i = Int(sub)
            guard let i = i else {
                throw Day3Error.IllegalInput
            }
            return i
        }

        guard split.count == 2 else {
            throw Day3Error.IllegalInput
        }

        let instructionString = input[..<open]

        if instructionString.contains("mul") {
            self = .mul(split[0], split[1])
            print("found!: \(self) in: \(input)")
            return
        }

        throw Day3Error.IllegalInstruction
    }
}

func parse_instructions(input: String) throws -> [Instruction]{
    var instructions: [Instruction] = []
    var input = input

    while true {
        let endInstructionIndex =  input.firstIndex(of: ")")

        guard var endInstructionIndex = endInstructionIndex else {
            return instructions
        }

        endInstructionIndex = input.index(after: endInstructionIndex)

        let instructionString = input[..<endInstructionIndex]
        
        do {
            let instruction = try Instruction(input: String(instructionString))
            instructions.append(instruction)
        } catch Day3Error.IllegalInstruction{
            print("failed to parse \(instructionString), invalid instruction")
        } catch Day3Error.IllegalInput{
            print("failed to parse \(instructionString), invalid input")
        }
    

        input = String(input[endInstructionIndex...])
    }
} 