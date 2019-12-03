defmodule Day1 do
  def day1() do
    FileUtil.read_file_to_int_array("./day1.txt")
    |> calculate_fuel()
  end

  def calculate_fuel(mass_list) when is_list(mass_list) do
    Enum.reduce(mass_list, 0, fn x, acc -> acc + calculate_fuel(x) end)
  end

  def calculate_fuel(mass) do
    Integer.floor_div(mass, 3) - 2
  end
end
