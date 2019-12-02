defmodule Day1Part2 do

  def day1Part2() do
    File.stream!("./day1.txt")
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.to_integer(&1))
    |> calculate_fuel()
  end

  def calculate_fuel(mass_list) when is_list(mass_list) do
    Enum.reduce(mass_list, 0, fn x, acc -> acc + calculate_fuel(x) end )
  end

  # Fuel should equal floor(mass/3) - 2
  def calculate_fuel(mass) do
    fuel_mass = Integer.floor_div(mass, 3) - 2 |> IO.inspect()
    fuel_mass + calculate_fuel_fuel(fuel_mass)
  end

  def calculate_fuel_fuel(mass) when mass <= 0 do
    0
  end

  def calculate_fuel_fuel(mass) do
    fuel_mass = Integer.floor_div(mass, 3) - 2
    if(fuel_mass > 0) do
      fuel_mass + calculate_fuel_fuel(fuel_mass)
    else
      0
    end
  end
end
