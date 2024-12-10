module Day09

function convert(disk_map)
    blocks = Vector{Int}()
    ID = 0
    for (i, digit) ∈ enumerate(disk_map)
        if i % 2 == 1
            for j ∈ 1:digit
                push!(blocks, ID)
            end
            ID += 1
        elseif i % 2 == 0
            for j ∈ 1:digit
                push!(blocks, -1)   # free space
            end
        end
    end
    blocks
end

function part1(blocks)
    blocks_copy = copy(blocks)
    checksum = 0
    for (i, ID) ∈ enumerate(blocks_copy)
        if ID == -1
            while blocks_copy[end] == -1
                pop!(blocks_copy)
            end
            checksum += (i - 1)*blocks_copy[end]
            pop!(blocks_copy)
        else
            checksum += (i - 1)*ID
        end
    end
    checksum
end

function part2(blocks)
    blocks_copy = copy(blocks)

    ID_prev = blocks_copy[end]
    file = [ID_prev]
    for (i, ID) ∈ enumerate(blocks_copy[end-1:-1:1])
        if ID != ID_prev

            if !isempty(file)
                ID2_prev = blocks_copy[1]
                count = 1
                for (j, ID2) ∈ enumerate(blocks_copy[2:end])
                    if ID2 == ID2_prev
                        count += 1
                    elseif ID2 != ID2_prev
                        count = 1
                    end
                    if length(blocks_copy) - (i - 1) ≤ j + 1
                        break
                    end
                    if count ≥ length(file) && ID2 == -1
                        for k ∈ 1:count
                            blocks_copy[j + 1 - count + k] = file[k]
                            blocks_copy[end - i + k] = -1
                        end
                        break
                    end
                    ID2_prev = ID2
                end
            end

            if ID != -1
                file = [ID]
            elseif ID == -1
                file = Vector{Int}()
            end
        elseif ID == ID_prev
            if ID != -1
                push!(file, ID)
            end
        end
        ID_prev = ID
    end

    checksum = sum(ID != -1 ? (i - 1)*ID : 0 for (i, ID) ∈ enumerate(blocks_copy))
    checksum
end

function day09()
    disk_map = [parse(Int, char) for char in readline(joinpath(@__DIR__, "..", "data", "day09.txt"))]
    blocks = convert(disk_map)
    (part1(blocks), part2(blocks))
end

end
