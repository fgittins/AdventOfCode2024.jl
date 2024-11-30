module Day01

using DelimitedFiles

function part1(list1, list2)
    distances = 0
    for (num1, num2) ∈ zip(sort(list1), sort(list2))
        distances += abs(num1 - num2)
    end
    distances
end

function part2(list1, list2)
    counts = Dict{Int, Int}()
    for num2 ∈ list2
        if num2 ∈ keys(counts)
            counts[num2] += 1
        else
            counts[num2] = 1
        end
    end
    similarity_score = 0
    for num1 ∈ list1
        if num1 ∈ keys(counts)
            similarity_score += num1*counts[num1]
        end
    end
    similarity_score
end

function day01()
    lists = readdlm(joinpath(@__DIR__, "..", "data", "day01.txt"), Int)
    list1 = @view lists[:, 1]
    list2 = @view lists[:, 2]
    (part1(list1, list2), part2(list1, list2))
end

end
