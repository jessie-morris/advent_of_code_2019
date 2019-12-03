defmodule Day1Part2 do
  def day1Part2() do
    FileUtil.read_file_to_int_array("./day1_part2.txt")
    |> calculate_fuel()
  end

  def calculate_fuel(mass_list) when is_list(mass_list) do
    Enum.reduce(mass_list, 0, fn x, acc -> acc + calculate_fuel(x) end)
  end

  def calculate_fuel(mass) do
    case fuel_cost(mass) do
      fuel_mass when fuel_mass > 0 -> fuel_mass + calculate_fuel(fuel_mass)
      _ -> 0
    end
  end

  # def calculate_fuel(mass) do
  #   with fuel_mass when fuel_mass > 0 <- fuel_cost(mass) do
  #     fuel_mass + calculate_fuel(fuel_mass) 
  #   else
  #     _ -> 0
  #   end
  # end

  def fuel_cost(mass) do
    Integer.floor_div(mass, 3) - 2
  end
end
