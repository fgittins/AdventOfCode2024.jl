module Day04

function part1(word_search)
    ans = 0
    X_pos = findall(x -> x=='X', word_search)
    for X ∈ X_pos
        for i ∈ CartesianIndex(-1, -1):CartesianIndex(1, 1)
            if checkbounds(Bool, word_search, X + 3*i) && word_search[X + i] == 'M' && word_search[X + 2*i] == 'A' && word_search[X + 3*i] == 'S'
                ans += 1
            end
        end
    end
    ans
end

function part2(word_search)
    ans = 0
    A_pos = findall(x -> x=='A', word_search)
    for A ∈ A_pos
        SE = A + CartesianIndex(1, 1)
        SW = A + CartesianIndex(1, -1)
        NW = A + CartesianIndex(-1, -1)
        NE = A + CartesianIndex(-1, 1)
        if checkbounds(Bool, word_search, [SE, SW, NW, NE]) && ((word_search[NW] == 'M' && word_search[SE] == 'S') || (word_search[NW] == 'S' && word_search[SE] == 'M')) && ((word_search[NE] == 'S' && word_search[SW] == 'M') || (word_search[NE] == 'M' && word_search[SW] == 'S'))
            ans += 1
        end
    end
    ans
end

function day04()
    word_search = reduce(vcat, (permutedims(collect(s)) for s ∈ readlines(joinpath(@__DIR__, "..", "data", "day04.txt"))))
    (part1(word_search), part2(word_search))
end

end
