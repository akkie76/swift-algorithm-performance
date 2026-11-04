---
name: swift-algorithm-performance
description: Helps implement, review, and improve Swift data-processing code where input size or repeated collection operations may affect performance. Use for algorithm and collection choices in search, filtering, deduplication, grouping, aggregation, or sorting.
---

# Swift Algorithm Performance

Use this skill when implementing, reviewing, or improving Swift data-processing code where input size or repeated collection operations may affect performance. Focus on algorithm choice, repeated work, and collection operations. Do not use it for low-level type representation changes such as converting a `struct` to a `class`, SwiftUI rendering, app launch, or general profiling tasks.

Choose improvements by checking the required output, traversal count, behavior constraints such as ordering and duplicates, time and memory costs, and measurements.

## Workflow

1. Understand the required behavior and data shape. Use surrounding code and tests to estimate typical and maximum input sizes, operation frequency, and whether a lookup structure can be reused. Check ordering, duplicates, mutation, and call context. If the recommendation could change with unclear workload details, ask for approximate typical and maximum counts and the relevant call context before benchmarking. Do not ask when code or tests establish the bounds. In non-interactive runs, or when an answer is unavailable, state assumptions, use representative sizes, and keep the recommendation conditional.
2. Find the work that grows with input size. Look for repeated scans, nested loops, repeated filtering or sorting, and temporary collections on the relevant path.
3. Compare a small number of suitable algorithms or data structures. Explain time complexity and added memory in terms of the actual operation pattern. Check the concrete collection type and its documented complexity; do not assume every `Collection` has constant-time indexing or `count`.
4. Preserve observable behavior, including output order, duplicate handling, tie behavior, and mutation. Prefer the smallest change that addresses the costly work.
5. Verify performance claims before recommending a change as an improvement.
   - Check candidate correctness with relevant cases in a normal build. Keep correctness checks separate from optimized timing because Swift `assert` checks may be disabled in optimized builds; use `precondition` for example checks that must remain active.
   - Benchmark only when measurement could change the decision. If source-level complexity and a clear small upper bound show that a performance gain would be immaterial, recommend keeping the simpler current implementation without benchmarking. Do not present that source-level decision as a measured result.
   - For a benchmark, use the input sizes and call context from step 1. Match the data distribution, operation frequency, and reuse pattern; include setup costs such as building a `Set` or preparing another data structure, amortized only when the real code reuses it.
   - Ensure the timed work contributes to a consumed or validated result so the optimizer cannot remove it. Run several trials and report a representative statistic, such as the median, or the measured range. Test smaller or larger cases when the benefit may change with input size.
   - Report where the candidate helps and where it does not. Call a measured difference negligible when its absolute impact is negligible; do not let a ratio alone imply a meaningful win. Recommend a verified improvement only when behavior is preserved and measurements show a meaningful benefit for the target workload.
   - If measurement is unavailable, label the change as an unverified candidate and do not claim it is faster.
6. When the user asks for a code improvement, include the minimal relevant replacement code or diff for the candidate that was checked. For analysis-only requests, report the finding and trade-offs without changing files.

## Swift-specific checks

- Repeated `Array.contains` or `first(where:)` calls may create quadratic work; consider a `Set` or `Dictionary` when its equality, hashing, ordering, and memory trade-offs fit.
- Avoid repeated transformations or sorting when one pass or a reusable lookup structure can preserve the required result.
- Account for intermediate arrays when they are on the relevant path.
- For clearly small, bounded inputs, source-level analysis may be enough to keep a simpler implementation without benchmarking; state that this is not a measured result.
- In code review, evaluate changes on performance grounds when the suggestion is performance-motivated. Do not reject a `Set` chosen for a semantic reason such as expressing uniqueness.
- Check maximum counts as well as typical counts, especially for inputs that can grow over time, such as paginated lists.
- If benchmark code is needed, keep it outside the user's repository, state where it was placed, and remove the temporary files you created after the check unless the user asks to keep them.

## Report

State the bottleneck, the proposed change, the old and new complexity when it can be established, the input sizes or ranges where the change helps and where it is slower (if measured), relevant memory or behavior trade-offs, and how the result was checked. Clearly distinguish a verified improvement from an unverified candidate, and distinguish measured results from source-level analysis and expectations.
