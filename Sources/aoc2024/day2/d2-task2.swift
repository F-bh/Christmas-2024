public func isSteepDampned(input: [Int]) -> Bool {
  if !isSteep(input: input) {
    return false
  }

  for (index, _) in input.enumerated() {
    var copy = input
    copy.remove(at: index)

    if !isSteep(input: copy) {
      return false
    }
  }

  return true
}
