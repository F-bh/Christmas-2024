import Foundation

enum Panics: Error {
    case missmatchedLists
}


func run_day_1(){
   let path = Bundle.module.path(forResource: "d1-task1", ofType:"txt", inDirectory: "inputs")
   let input: String = try! String(contentsOfFile: path!, encoding: .utf8)

   let lines = input.split(separator: "\n")
   let split = lines.map { x in
       let split = x.split(separator: "   ")
       let l = Int(split[0])!
       let r = Int(split[1])!
       return (l,r)
   }

   var left: [Int] = []
   var right: [Int] = []

   for (l, r) in split{
      left.append(l)
      right.append(r)
   }

   let combined = try! combine(left: left, right: right) 

   let t1 = combined.reduce(0) { acc, val  in
       acc + val.distance
   }

   let t2 = try! calc(left: left, right: right)

   print("day 1 task 1: \(t1)", terminator: "\n")
   print("day 1 task 2: \(t2)", terminator: "\n") 
}