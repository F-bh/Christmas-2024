struct combination: Equatable, Sendable {
    var left: Int
    var right : Int
    var distance: Int
}

func combine(left: [Int], right: [Int]) throws -> [combination] {
    let left = left.sorted()
    let right = right.sorted()

    guard left.count == right.count else {
        throw Panics.missmatchedLists
    }

    return left.enumerated().map { (index, l) in
        let r = right[index]
        let distance = l > r ? l - r : r - l
        return combination(left: l, right: r, distance: distance)
    }
}