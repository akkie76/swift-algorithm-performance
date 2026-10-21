# Swift algorithm examples

[日本語](README.ja.md)

Run the correctness checks with:

```sh
swift examples/Examples.swift
```

The examples compare a straightforward implementation with an alternative for a specific output requirement. Complexity notes are source-level analysis, not benchmark results. Actual gains depend on input sizes, element types, and workload; benchmark representative data before calling an alternative faster.

| Operation | Requirement and alternative | Expected cost | Behavior and trade-offs |
| --- | --- | --- | --- |
| Search | Match `values` against `selected`; build a `Set` once instead of scanning `selected` for every value. | Repeated array lookup: O(n × m). Set-backed lookup: O(m + n) expected, plus O(m) memory. | Output order and duplicates come from `values`. Set lookup requires compatible `Hashable` equality and adds setup and memory costs. |
| Deduplication | Keep the first occurrence of each value; track seen values in a `Set`. | Repeated output scan: O(n²). Set-backed: O(n) expected, plus O(u) memory. | Appending while traversing preserves first-seen order. |
| Aggregation | Sum values by category; update a dictionary during one traversal. | Repeated filtering: O(n × k). One pass: O(n) expected, plus O(k) result storage. | Totals are preserved. Dictionary iteration order is not a presentation order. |
| Sorting | Return only the highest-priority task; scan once instead of sorting all tasks. | Full sort: O(n log n), with a new result array. Scan: O(n), O(1) extra storage. | Both examples keep the first task on a priority tie. If the caller needs every task in sorted order, sorting is still required. |

The assertions compare results, including order, duplicates, ties, and empty input where relevant. They do not measure runtime. These examples show when a different algorithm can fit the requested output; they do not establish a universal performance win.
