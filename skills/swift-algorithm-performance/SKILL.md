---
name: swift-algorithm-performance
description: Reviews and improves performance-sensitive Swift data-processing code by choosing suitable algorithms and collection operations. Use for slow search, filtering, deduplication, grouping, aggregation, or sorting.
---

# Swift Algorithm Performance

Use this skill when the user wants to find or improve costly work in Swift data-processing code. Focus on algorithm choice, repeated work, and collection operations. Do not use it for low-level type representation changes such as converting a `struct` to a `class`, SwiftUI rendering, app launch, or general profiling tasks.

Choose improvements by checking the required output, traversal count, behavior constraints such as ordering and duplicates, time and memory costs, and measurements.

## Workflow

1. Understand the required behavior and the data shape. Check input size, ordering, duplicates, lookup frequency, and whether the collection changes.
2. Find the work that grows with input size. Look for repeated scans, nested loops, repeated filtering or sorting, and temporary collections on the relevant path.
3. Compare a small number of suitable algorithms or data structures. Explain time complexity and added memory in terms of the actual operation pattern. Check the concrete collection type and its documented complexity; do not assume every `Collection` has constant-time indexing or `count`.
4. Preserve observable behavior, including output order, duplicate handling, tie behavior, and mutation. Prefer the smallest change that addresses the costly work.
5. Verify a candidate before recommending it as a performance improvement. Check correctness with relevant cases, then compare the old and new implementations in an optimized build with representative inputs and the same conditions, including setup costs such as building a `Set`. Recommend it as a verified improvement only when behavior is preserved and measurements show a meaningful benefit for the target workload. If measurement is unavailable, label it as an unverified candidate and do not claim it is faster.
6. When the user asks for a code improvement, include the minimal relevant replacement code or diff for the candidate that was checked. For analysis-only requests, report the finding and trade-offs without changing files.

## Swift-specific checks

- Repeated `Array.contains` or `first(where:)` calls may create quadratic work; consider a `Set` or `Dictionary` when its equality, hashing, ordering, and memory trade-offs fit.
- Avoid repeated transformations or sorting when one pass or a reusable lookup structure can preserve the required result.
- Account for intermediate arrays when they are on the relevant path.
- Do not recommend a more complex data structure for small inputs or infrequent operations without a meaningful benefit.

## Report

State the bottleneck, the proposed change, the old and new complexity when it can be established, relevant memory or behavior trade-offs, and how the result was checked. Clearly distinguish a verified improvement from an unverified candidate, and distinguish measured results from source-level analysis and expectations.
