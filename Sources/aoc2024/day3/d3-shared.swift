import Foundation

func run_day_3(){
  let path = Bundle.module.path(forResource: "d3-task", ofType: "txt", inDirectory: "inputs")
  let input: String = try! String(contentsOfFile: path!, encoding: .utf8)
  let instructions = try! parse_instructions(input: input)
  let result = instructions.reduce(0) { acc, val in
    acc + val.calc()
  }
  print("day 3 task 1: \(result)")
}