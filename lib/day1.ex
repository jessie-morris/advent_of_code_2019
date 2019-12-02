defmodule Day1 do

  def day1() do
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
    Integer.floor_div(mass, 3) - 2
  end
end
