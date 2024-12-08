module Day08

function find_antinodes(map; part2=false)
    antennae = findall(i -> i != '.', map)
    antinodes = Set{CartesianIndex{2}}()
    for i ∈ eachindex(antennae), j ∈ 1:i - 1
        antenna1, antenna2 = antennae[i], antennae[j]
        frequency1, frequency2 = map[antenna1], map[antenna2]
        if frequency1 == frequency2
            dist = antenna2 - antenna1
            if !part2
                antinode1, antinode2 = antenna2 + dist, antenna1 - dist
                if checkbounds(Bool, map, antinode1)
                    push!(antinodes, antinode1)
                end
                if checkbounds(Bool, map, antinode2)
                    push!(antinodes, antinode2)
                end
            elseif part2
                antinode1, antinode2 = antenna2, antenna1
                while checkbounds(Bool, map, antinode1)
                    push!(antinodes, antinode1)
                    antinode1 += dist
                end
                while checkbounds(Bool, map, antinode2)
                    push!(antinodes, antinode2)
                    antinode2 -= dist
                end
            end
        end
    end
    antinodes
end

function day08()
    map = stack(readlines(joinpath(@__DIR__, "..", "data", "day08.txt")))
    antinodes1 = find_antinodes(map)
    antinodes2 = find_antinodes(map; part2=true)
    (length(antinodes1), length(antinodes2))
end

end
