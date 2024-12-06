module Day05

function part1(rules, updates)
    order = (x, y) -> (x, y) ∈ rules

    ans = 0
    for update ∈ updates
        if issorted(update; lt=order)
            ans += update[Int((length(update) + 1)/2)]
        end
    end
    ans
end

function part2(rules, updates)
    order = (x, y) -> (x, y) ∈ rules

    ans = 0
    for update ∈ updates
        if !issorted(update; lt=order)
            sort!(update; lt=order)
            ans += update[Int((length(update) + 1)/2)]
        end
    end
    ans
end

function day05()
    rules = Set{Tuple{Int, Int}}()
    updates = Vector{Vector{Int}}()
    for line ∈ eachline(joinpath(@__DIR__, "..", "data", "day05.txt"))
        if '|' ∈ line
            lower, upper = split(line, '|')
            push!(rules, (parse(Int, lower), parse(Int, upper)))
        elseif ',' ∈ line
            append!(updates, [parse.(Int, split(line, ','))])
        end
    end
    (part1(rules, updates), part2(rules, updates))
end

end
