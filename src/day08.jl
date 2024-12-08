module Day08

function find_antinodes(map, antennae)
    antinodes1 = Set{CartesianIndex{2}}()
    antinodes2 = Set{CartesianIndex{2}}()
    for i ∈ eachindex(antennae), j ∈ 1:i - 1
        antenna1, antenna2 = antennae[i], antennae[j]
        frequency1, frequency2 = map[antenna1], map[antenna2]
        if frequency1 == frequency2
            dist = antenna2 - antenna1
            antinode1 = antenna2 + dist
            checkbounds(Bool, map, antinode1) && push!(antinodes1, antinode1)
            antinode2 = antenna1 - dist
            checkbounds(Bool, map, antinode2) && push!(antinodes1, antinode2)

            antinode1 = antenna2
            while checkbounds(Bool, map, antinode1)
                push!(antinodes2, antinode1)
                antinode1 += dist
            end
            antinode2 = antenna1
            while checkbounds(Bool, map, antinode2)
                push!(antinodes2, antinode2)
                antinode2 -= dist
            end
        end
    end
    antinodes1, antinodes2
end

function day08()
    map = stack(readlines(joinpath(@__DIR__, "..", "data", "day08.txt")))
    antennae = findall(i -> i != '.', map)
    antinodes1, antinodes2 = find_antinodes(map, antennae)
    (length(antinodes1), length(antinodes2))
end

end
