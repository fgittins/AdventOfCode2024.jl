module Day07

function is_true(test_value, curr, num_remaining; concat=false)
    if isempty(num_remaining) && curr != test_value
        return false
    elseif isempty(num_remaining) && curr == test_value
        return true
    elseif curr > test_value
        return false
    end
    if concat
        return is_true(test_value, curr + num_remaining[1], @view num_remaining[2:end]; concat=concat) || is_true(test_value, curr * num_remaining[1], @view num_remaining[2:end]; concat=concat) || is_true(test_value, concatenate(curr, num_remaining[1]), @view num_remaining[2:end]; concat=concat)
    end
    is_true(test_value, curr + num_remaining[1], @view num_remaining[2:end]) || is_true(test_value, curr * num_remaining[1], @view num_remaining[2:end])
end

concatenate(x, y) = x*10^length(digits(y)) + y

function day07()
    test_values = Vector{Int}()
    nums = Vector{Vector{Int}}()
    for line ∈ readlines(joinpath(@__DIR__, "..", "data", "day07.txt"))
        line = split(line)
        push!(test_values, parse(Int, split(line[1], ':')[1]))
        push!(nums, parse.(Int, line[2:end]))
    end

    total_calibration_result1 = total_calibration_result2 = 0
    for (test_value, num) ∈ zip(test_values, nums)
        if is_true(test_value, num[1], @view num[2:end])
            total_calibration_result1 += test_value
        elseif is_true(test_value, num[1], @view num[2:end]; concat=true)
            total_calibration_result2 += test_value
        end
    end
    (total_calibration_result1, total_calibration_result1 + total_calibration_result2)
end

end
