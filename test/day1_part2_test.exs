defmodule Day1Part2Test do
  use ExUnit.Case

  # Fuel should equal floor(mass/3) - 2
  describe "calculate_fuel/1" do
    test "calculates 2 fuel for mass of 12" do
      assert Day1Part2.calculate_fuel(12) == 2
    end

    test "calculates 2 fuel for mass of 14" do
      assert Day1Part2.calculate_fuel(14) == 2
    end

    test "mass of 1969 requires 966 fuel" do
      assert Day1Part2.calculate_fuel(1969) == 966
    end
  end
end
