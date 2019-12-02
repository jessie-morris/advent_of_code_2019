defmodule Day1Test do
  use ExUnit.Case

  # Fuel should equal floor(mass/3) - 2
  describe "calculate_fuel/1" do
    test "calculates 2 fuel for mass of 12" do
      assert Day1.calculate_fuel(12) == 2
    end
    test "calculates 2 fuel for mass of 14" do
      assert Day1.calculate_fuel(14) == 2
    end
    test "calculates 654 fuel for mass 1969" do
      assert Day1.calculate_fuel(1969) == 654
    end
    test "calculates 33583 fuel for mass of 100756" do
      assert Day1.calculate_fuel(100756) == 33583
    end
  end
  describe "calculate_fuel/1 when is list" do
    test "calculates 4 fuel for list [12, 14]" do
      assert Day1.calculate_fuel([12,14]) == 4
    end
  end
end
