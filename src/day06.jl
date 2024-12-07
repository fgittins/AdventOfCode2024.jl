module Day06

function turn_right(direction)
    if direction == CartesianIndex(-1, 0)
        direction = CartesianIndex(0, 1)
    elseif direction == CartesianIndex(0, 1)
        direction = CartesianIndex(1, 0)
    elseif direction == CartesianIndex(1, 0)
        direction = CartesianIndex(0, -1)
    elseif direction == CartesianIndex(0, -1)
        direction = CartesianIndex(-1, 0)
    end
    direction
end

const directions = Dict('^' => CartesianIndex(-1, 0),
                        '>' => CartesianIndex(0, 1),
                        'v' => CartesianIndex(1, 0),
                        '<' => CartesianIndex(0, -1))

function part1(map)
    position = start = findfirst(i -> i == '^', map)
    direction = directions[map[start]]
    positions = Set([start])
    while true
        position_new = position + direction
        !checkbounds(Bool, map, position_new) && break
        if map[position_new] == '#'
            direction = turn_right(direction)
            continue
        end
        position = position_new
        push!(positions, position)
    end
    length(positions), delete!(positions, start)
end

function is_in_loop(map, position_obstacle)
    position = findfirst(i -> i == '^', map)
    direction = directions[map[position]]
    positions_directions = Set([(position, direction)])
    while true
        position_new = position + direction
        !checkbounds(Bool, map, position_new) && return false
        if map[position_new] == '#' || position_new == position_obstacle
            direction = turn_right(direction)
            continue
        end
        position = position_new
        position_direction = (position, direction)
        position_direction ∈ positions_directions && return true
        push!(positions_directions, position_direction)
    end
end

function part2(map, positions)
    ans = 0
    for position_direction ∈ positions
        if is_in_loop(map, position_direction)
            ans += 1
        end
    end
    ans
end

function day06()
    map = reduce(vcat, (permutedims(collect(s)) for s ∈ readlines(joinpath(@__DIR__, "..", "data", "day06.txt"))))
    ans1, positions = part1(map)
    ans2 = part2(map, positions)
    (ans1, ans2)
end

end
