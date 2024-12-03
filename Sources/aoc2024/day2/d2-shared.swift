import Foundation

func run_day_2() {
  let path = Bundle.module.path(forResource: "d2-task1", ofType: "txt", inDirectory: "inputs")
  let input: String = try! String(contentsOfFile: path!, encoding: .utf8)

  let lines = input.split(separator: "\n")

  let t1 = lines.map {
    line in
    let report = line.split(separator: " ").map { sub in
      Int(sub)!
    }
    return isSteep(input: report)
  }.count { x in
    !x
  }

  let t2 = lines.map {
    line in
    let report = line.split(separator: " ").map { sub in
      Int(sub)!
    }
    return isSteepDampned(input: report)
  }.count { x in
    !x
  }

  print("day 2 task 1: \(t1)", terminator: "\n")
  print("day 2 task 2: \(t2)", terminator: "\n")
}
