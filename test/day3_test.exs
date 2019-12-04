defmodule Day3Test do
  use ExUnit.Case

  describe "manhattan distance" do
    test "returns distance x for simple input" do
      assert Day3.calculate_manhattan_distance(["R8", "U5", "L5", "D3"], ["U7", "R6", "D4", "L4"]) ==
               6
    end

    test "returns distance 159 for first input" do
      assert Day3.calculate_manhattan_distance(
               ["R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"],
               ["U62", "R66", "U55", "R34", "D71", "R55", "D58", "R83"]
             ) == 159
    end

    test "example three" do
      assert Day3.calculate_manhattan_distance(
               ["R98", "U47", "R26", "D63", "R33", "U87", "L62", "D20", "R33", "U53", "R51"],
               ["U98", "R91", "D20", "R16", "D67", "R40", "U7", "R15", "U6", "R7"]
             )
    end
  end

  describe "shortest distance traveled" do
    test "returns distance 30 for simple input" do
      assert Day3.calculate_distance(["R8", "U5", "L5", "D3"], ["U7", "R6", "D4", "L4"]) == 30
    end

    test "returns distance 610 for larger input" do
      assert Day3.calculate_distance(
               ["R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"],
               ["U62", "R66", "U55", "R34", "D71", "R55", "D58", "R83"]
             ) == 610
    end

    test "returns distance 410 for second larger input" do
      assert Day3.calculate_distance(
               ["R98", "U47", "R26", "D63", "R33", "U87", "L62", "D20", "R33", "U53", "R51"],
               ["U98", "R91", "D20", "R16", "D67", "R40", "U7", "R15", "U6", "R7"]
             ) == 410
    end
  end
end
