import Foundation

func run_day_3() {
  let path = Bundle.module.path(forResource: "d3-task", ofType: "txt", inDirectory: "inputs")
  let input: String = try! String(contentsOfFile: path!, encoding: .utf8)
  let instructions = try! parse_instructions(input: input)
  let result = instructions.reduce(0) { acc, val in
    acc + (val.calc() ?? 0)
  }

  let result2 = instructions.reduce((0, true)) { acc, val in
    switch val {
    case let .mul(x, y):
      if acc.1 {
        return (acc.0 + val.calc()!, acc.1)
      }
      return (acc.0, acc.1)
    case .activate:
      return (acc.0, true)
    case .deactivate:
      return (acc.0, false)
    }
  }

  print("day 3 task 1: \(result)")
  print("day 3 task 2: \(result2)")
}
