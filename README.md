# AdventOfCode2024.jl
My attempts at the [Advent of Code 2024](https://adventofcode.com/2024) in the [Julia](https://julialang.org/) programming language.

Note that this package will not work on your local machine unless you have downloaded your puzzle input directly from the [website](https://adventofcode.com/2024). For a Day `XX`, you may put the relevant puzzle input into a directory `data` with the name `dayXX.txt`. For example, if you wanted to solve Day 9, place the puzzle input into `data/day09.txt`.

## Benchmarks

| Day | Time | Allocated memory | Source |
|----:|-----:|-----------------:|:------:|
| [1](https://adventofcode.com/2024/day/1) | 625.916 μs | 8.29 MiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day01.jl) |
| [2](https://adventofcode.com/2024/day/2) | 680.083 μs | 2.87 MiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day02.jl) |
| [3](https://adventofcode.com/2024/day/3) | 175.958 μs | 395.29 KiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day03.jl) |
| [4](https://adventofcode.com/2024/day/4) | 691.291 μs | 6.00 MiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day04.jl) |
| [5](https://adventofcode.com/2024/day/5) | 276.584 μs | 720.56 KiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day05.jl) |
| [6](https://adventofcode.com/2024/day/6) | 831.847 ms | 3.92 GiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day06.jl) |
| [7](https://adventofcode.com/2024/day/7) | 60.374 ms | 141.73 MiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day07.jl) |
| [8](https://adventofcode.com/2024/day/8) | 47.542 μs | 135.27 KiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day08.jl) |
| [9](https://adventofcode.com/2024/day/9) | 488.649 ms | 7.10 GiB | [:white_check_mark:](https://github.com/fgittins/AdventOfCode2024.jl/blob/main/src/day09.jl) |

System info:

```julia-repl
julia> versioninfo()
Julia Version 1.11.1
Commit 8f5b7ca12ad (2024-10-16 10:53 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: macOS (arm64-apple-darwin22.4.0)
  CPU: 8 × Apple M3
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, apple-m3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```
