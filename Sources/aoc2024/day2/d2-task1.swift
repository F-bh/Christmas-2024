enum sortOrientation {
    case increasing
    case decreasing
}

public func isSteep(input: [Int]) -> Bool {
    var lastItem = input[0]
    var sort: sortOrientation? = nil

    for item in input[1...] {
        let diff = item - lastItem
        lastItem = item
        if diff == 0 {
            return true
        }

        if sort == nil {
            sort = diff < 0 ? .decreasing : .increasing
        }

        switch sort! {
        case .increasing:
            if diff > 3  || diff < 0 {
                return true
            }
        case .decreasing:
            if diff < -3 || diff > 0 {
                return true
            }
        }
    }

    return false
}
