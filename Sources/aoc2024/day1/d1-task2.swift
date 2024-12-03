func calc(left: [Int], right: [Int]) throws -> Int {
  guard left.count == right.count else {
    throw Panics.missmatchedLists
  }

  return left.reduce(0) { acc, val in
    acc + val
      * right.count { cmp in
        cmp == val
      }
  }
}
