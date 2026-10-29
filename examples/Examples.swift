// Run with: swift examples/Examples.swift

struct Sale {
    let category: String
    let amount: Int
}

struct Task {
    let name: String
    let priority: Int
}

// Search: preserve values order and duplicates while avoiding a repeated scan
// of selected for every value.
func matchingNaive(_ values: [Int], selected: [Int]) -> [Int] {
    values.filter { selected.contains($0) }
}

func matchingWithSet(_ values: [Int], selected: [Int]) -> [Int] {
    let selectedSet = Set(selected)
    return values.filter { selectedSet.contains($0) }
}

let values = [5, 2, 5, 8, 3]
let selected = [5, 3, 5]
assert(matchingNaive(values, selected: selected) == [5, 5, 3])
assert(matchingWithSet(values, selected: selected) == [5, 5, 3])

// Deduplication: preserve the first occurrence of each value.
func uniqueNaive(_ values: [Int]) -> [Int] {
    values.reduce(into: []) { result, value in
        if !result.contains(value) {
            result.append(value)
        }
    }
}

func uniqueWithSet(_ values: [Int]) -> [Int] {
    var seen = Set<Int>()
    var result: [Int] = []
    for value in values where seen.insert(value).inserted {
        result.append(value)
    }
    return result
}

let duplicateValues = [4, 2, 4, 1, 2]
assert(uniqueNaive(duplicateValues) == [4, 2, 1])
assert(uniqueWithSet(duplicateValues) == [4, 2, 1])

// Aggregation: compute a total for every category in one pass.
func totalsNaive(_ sales: [Sale]) -> [String: Int] {
    let categories = Set(sales.map(\.category))
    var totals: [String: Int] = [:]
    for category in categories {
        totals[category] = sales
            .filter { $0.category == category }
            .reduce(0) { $0 + $1.amount }
    }
    return totals
}

func totalsInOnePass(_ sales: [Sale]) -> [String: Int] {
    sales.reduce(into: [:]) { totals, sale in
        totals[sale.category, default: 0] += sale.amount
    }
}

let sales = [
    Sale(category: "books", amount: 12),
    Sale(category: "games", amount: 30),
    Sale(category: "books", amount: 8),
]
assert(totalsNaive(sales) == ["books": 20, "games": 30])
assert(totalsInOnePass(sales) == ["books": 20, "games": 30])

// Sorting: if only the highest-priority task is needed, scan once instead of
// sorting the entire input. Keep the first task when priorities tie.
func bestTaskBySorting(_ tasks: [Task]) -> Task? {
    tasks.enumerated()
        .sorted {
            if $0.element.priority != $1.element.priority {
                return $0.element.priority > $1.element.priority
            }
            return $0.offset < $1.offset
        }
        .first?.element
}

func bestTaskByScanning(_ tasks: [Task]) -> Task? {
    guard var best = tasks.first else { return nil }
    for task in tasks.dropFirst() where task.priority > best.priority {
        best = task
    }
    return best
}

let tasks = [
    Task(name: "first", priority: 3),
    Task(name: "highest", priority: 5),
    Task(name: "also-highest", priority: 5),
]
assert(bestTaskBySorting(tasks)?.name == "highest")
assert(bestTaskByScanning(tasks)?.name == "highest")
assert(bestTaskBySorting([]) == nil)
assert(bestTaskByScanning([]) == nil)

print("All algorithm examples passed.")
