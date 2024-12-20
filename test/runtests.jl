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

@testset "Day06" begin
    part1, part2 = AdventOfCode2024.Day06.day06()
    @testset "part1" begin
        @test part1 == 4903
    end
    @testset "part2" begin
        @test part2 == 1911
    end
end

@testset "Day07" begin
    part1, part2 = AdventOfCode2024.Day07.day07()
    @testset "part1" begin
        @test part1 == 5837374519342
    end
    @testset "part2" begin
        @test part2 == 492383931650959
    end
end

@testset "Day08" begin
    part1, part2 = AdventOfCode2024.Day08.day08()
    @testset "part1" begin
        @test part1 == 285
    end
    @testset "part2" begin
        @test part2 == 944
    end
end

@testset "Day09" begin
    part1, part2 = AdventOfCode2024.Day09.day09()
    @testset "part1" begin
        @test part1 == 6337921897505
    end
    @testset "part2" begin
        @test part2 == 6362722604045
    end
end
