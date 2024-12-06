using AdventOfCode2024
using Test

@testset "Day01" begin
    part1, part2 = AdventOfCode2024.Day01.day01()
    @testset "part1" begin
        @test part1 == 2580760
    end
    @testset "part2" begin
       @test part2 == 25358365 
    end
end

@testset "Day02" begin
    part1, part2 = AdventOfCode2024.Day02.day02()
    @testset "part1" begin
        @test part1 == 218
    end
    @testset "part2" begin
        @test part2 == 290
    end
end

@testset "Day03" begin
    part1, part2 = AdventOfCode2024.Day03.day03()
    @testset "part1" begin
        @test part1 == 166357705
    end
    @testset "part2" begin
        @test part2 == 88811886
    end
end

@testset "Day04" begin
    part1, part2 = AdventOfCode2024.Day04.day04()
    @testset "part1" begin
        @test part1 == 2642
    end
    @testset "part2" begin
        @test part2 == 1974
    end
end

@testset "Day05" begin
    part1, part2 = AdventOfCode2024.Day05.day05()
    @testset "part1" begin
        @test part1 == 5964
    end
    @testset "part2" begin
        @test part2 == 4719
    end
end
