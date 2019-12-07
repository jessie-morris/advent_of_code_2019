defmodule Day6 do
  def day6() do
    FileUtil.get_lines("day6.txt")
    |> total_orbits()
  end
  def total_orbits(orbit_list) do
    orbit_map =
      Enum.reduce(orbit_list, %{}, fn orbit, acc ->
        [orbitee | [orbiter | _rest]] = String.split(orbit, ")")
        Map.update(acc, orbitee, [orbiter], fn x -> [orbiter | x] end)
      end)
      |> IO.inspect(label: "Orbit Map")

    initial_orbiters = orbit_map["COM"] |> IO.inspect()

    Enum.reduce(initial_orbiters, 0, fn planet, acc ->
      acc + count_child_orbiters(orbit_map, planet, 1)
    end)
  end

  def count_child_orbiters(orbit_map, planet, depth) do
    children = Map.get(orbit_map, planet, [])

    depth +
      Enum.reduce(children, 0, fn child_planet, acc ->
        acc + count_child_orbiters(orbit_map, child_planet, depth + 1)
      end)
  end
end
