module Day03

function capture_mul(segment)
    ans = 0
    mul_matches = eachmatch(r"mul\((\d+),(\d+)\)", segment)
    for m ∈ mul_matches
        x, y = m.captures
        ans += parse(Int, x) * parse(Int, y)
    end
    ans
end

part1(memory) = capture_mul(memory)

function part2(memory)
    ans = 0
    # Split the text by "don't()"
    segments = split(memory, "don't()")

    # Process the first segment separately
    first_segment = segments[1]
    ans += capture_mul(first_segment)

    # Process the remaining segments
    for i in 2:length(segments)
        segment = segments[i]
        # Check if there is a "do()" in the segment
        if occursin(r"do\(\)", segment)
            # Capture all "mul(x,y)" after the last "do()"
            do_segments = split(segment, "do()")
            for j in 2:length(do_segments)
                ans += capture_mul(do_segments[j])
            end
        end
    end
    ans
end

function day03()
    memory = join(readlines(joinpath(@__DIR__, "..", "data", "day03.txt")))
    (part1(memory), part2(memory))
end

end
