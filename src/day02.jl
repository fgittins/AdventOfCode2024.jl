module Day02

is_safe(report) = all(((levelᵢ < levelᵢ₊₁ && report[1] < report[2]) || (levelᵢ > levelᵢ₊₁ && report[1] > report[2])) && abs(levelᵢ - levelᵢ₊₁) ≤ 3 && abs(report[1] - report[2]) ≤ 3 for (levelᵢ, levelᵢ₊₁) ∈ zip(report[2:end], report[3:end]))
part1(reports) = sum(is_safe(report) for report ∈ reports)
part2(reports) = sum(is_safe(report) || any(is_safe(vcat(report[1:i - 1], report[i + 1:end])) for i ∈ eachindex(report)) ? 1 : 0 for report ∈ reports)

function day02()
    reports = [parse.(Int, split(line)) for line ∈ readlines(joinpath(@__DIR__, "..", "data", "day02.txt"))]
    (part1(reports), part2(reports))
end

end
