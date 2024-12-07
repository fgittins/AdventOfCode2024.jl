module Day06

turn_right(direction) = CartesianIndex(direction[2], -direction[1])

function part1(map)
    position = findfirst(i -> i == '^', map)
    direction = CartesianIndex(-1, 0)
    positions = Set{CartesianIndex{2}}()
    while checkbounds(Bool, map, position + direction)
        if map[position + direction] == '#'
            direction = turn_right(direction)
            continue
        end
        position += direction
        push!(positions, position)
    end
    length(positions), positions
end

function is_in_loop(map, position_obstacle)
    position = findfirst(i -> i == '^', map)
    direction = CartesianIndex(-1, 0)
    positions_directions = Set([(position, direction)])
    while checkbounds(Bool, map, position + direction)
        position_new = position + direction
        if map[position_new] == '#' || position_new == position_obstacle
            direction = turn_right(direction)
            continue
        end
        position = position_new
        position_direction = (position, direction)
        position_direction ∈ positions_directions && return true
        push!(positions_directions, position_direction)
    end
    return false
end

part2(map, positions) = sum(is_in_loop(map, position_obstacle) for position_obstacle ∈ positions)

function day06()
    map = reduce(vcat, (permutedims(collect(s)) for s ∈ readlines(joinpath(@__DIR__, "..", "data", "day06.txt"))))
    ans, positions = part1(map)
    (ans, part2(map, positions))
end

end
