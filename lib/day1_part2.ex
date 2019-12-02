defmodule Day1Part2 do

  def day1Part2() do
    FileUtil.read_file_to_int_array("./day1_part2.txt")
    |> calculate_fuel()
  end

  def calculate_fuel(mass_list) when is_list(mass_list) do
    Enum.reduce(mass_list, 0, fn x, acc -> acc + calculate_fuel(x) end )
  end

  def calculate_fuel(mass) do
    fuel_mass = Integer.floor_div(mass, 3) - 2
    if(fuel_mass > 0) do
      fuel_mass + calculate_fuel(fuel_mass)
    else
      0
    end
  end
end
