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
5. Verify correctness with relevant cases. When claiming a runtime improvement, compare the old and new implementations in an optimized build with representative inputs and the same conditions. If measurement is unavailable, describe the complexity change as analysis, not as a measured speedup.

## Swift-specific checks

- Repeated `Array.contains` or `first(where:)` calls may create quadratic work; consider a `Set` or `Dictionary` when its equality, hashing, ordering, and memory trade-offs fit.
- Avoid repeated transformations or sorting when one pass or a reusable lookup structure can preserve the required result.
- Account for intermediate arrays when they are on the relevant path.
- Do not recommend a more complex data structure for small inputs or infrequent operations without a meaningful benefit.

## Report

State the bottleneck, the proposed change, the old and new complexity when it can be established, relevant memory or behavior trade-offs, and how the result was checked. Distinguish measured results from source-level analysis and unverified expectations.
