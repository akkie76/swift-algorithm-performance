---
name: swift-algorithm-performance
description: Helps implement, review, and improve Swift data-processing code where input size or repeated collection operations may affect performance. Use for algorithm and collection choices in search, filtering, deduplication, grouping, aggregation, or sorting.
---

# Swift Algorithm Performance

Use this skill when implementing, reviewing, or improving Swift data-processing code where input size or repeated collection operations may affect performance. Focus on algorithm choice, repeated work, and collection operations. Do not use it for low-level type representation changes such as converting a `struct` to a `class`, SwiftUI rendering, app launch, or general profiling tasks.

Choose improvements by checking the required output, traversal count, behavior constraints such as ordering and duplicates, time and memory costs, and measurements.

## Workflow

1. Understand the required behavior and the data shape. Check input size, ordering, duplicates, lookup frequency, and whether the collection changes.
2. Find the work that grows with input size. Look for repeated scans, nested loops, repeated filtering or sorting, and temporary collections on the relevant path.
3. Compare a small number of suitable algorithms or data structures. Explain time complexity and added memory in terms of the actual operation pattern. Check the concrete collection type and its documented complexity; do not assume every `Collection` has constant-time indexing or `count`.
4. Preserve observable behavior, including output order, duplicate handling, tie behavior, and mutation. Prefer the smallest change that addresses the costly work.
5. Verify a candidate before recommending it as a performance improvement. Check correctness with relevant cases, then compare the old and new implementations in an optimized build with representative inputs at the sizes relevant to the user's workload, including small and large cases when the benefit may vary. Use the same conditions and include setup costs such as building a `Set`. Ensure the timed work contributes to a consumed or validated result so the optimizer cannot remove it. Run several trials and report a representative statistic, such as the median, or the measured range. Report where the candidate helps and where it does not; do not make a blanket recommendation when results depend on input size. Recommend it as a verified improvement only when behavior is preserved and measurements show a meaningful benefit for the target workload. If the target input range is unknown, explain the trade-off and make the recommendation conditional. If measurement is unavailable, label it as an unverified candidate and do not claim it is faster.
6. When the user asks for a code improvement, include the minimal relevant replacement code or diff for the candidate that was checked. For analysis-only requests, report the finding and trade-offs without changing files.

## Swift-specific checks

- Repeated `Array.contains` or `first(where:)` calls may create quadratic work; consider a `Set` or `Dictionary` when its equality, hashing, ordering, and memory trade-offs fit.
- Avoid repeated transformations or sorting when one pass or a reusable lookup structure can preserve the required result.
- Account for intermediate arrays when they are on the relevant path.
- Do not recommend a more complex data structure for small inputs or infrequent operations without a meaningful benefit.
- If benchmark code is needed, keep it outside the user's repository, state where it was placed, and remove the temporary files you created after the check unless the user asks to keep them.

## Report

State the bottleneck, the proposed change, the old and new complexity when it can be established, the input sizes or ranges where the change helps and where it is slower (if measured), relevant memory or behavior trade-offs, and how the result was checked. Clearly distinguish a verified improvement from an unverified candidate, and distinguish measured results from source-level analysis and expectations.
