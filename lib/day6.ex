defmodule Day6 do
  def day6_part1() do
    FileUtil.get_lines("day6.txt")
    |> total_orbits()
  end

  def day6_part2() do
    FileUtil.get_lines("day6.txt")
    |> transfers_to_santa()
  end

  def total_orbits(orbit_list) do
    orbit_map = orbit_map(orbit_list)
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

  def orbit_map(orbit_list) do
    Enum.reduce(orbit_list, %{}, fn orbit, acc ->
      [orbitee | [orbiter | _rest]] = String.split(orbit, ")")
      Map.update(acc, orbitee, [orbiter], fn x -> [orbiter | x] end)
    end)
    |> IO.inspect(label: "Orbit Map")
  end

  def orbit_map_redux(orbit_map, current_planet) do
  end

  def transfers_to_santa(orbit_list) do
    orbit_map = orbit_map(orbit_list)

    {santas_orbit, _} =
      Enum.find(orbit_map, fn {orbitee, orbiters} ->
        Enum.any?(orbiters, fn orbiter -> orbiter == "SAN" end)
      end)

    distance_to_santa = find_santa(orbit_map, santas_orbit, 0)
  end

  def find_santa(orbit_map, planet, distance_traveled) do
    {parent, leaves} =
      Enum.filter(orbit_map, fn {orbitee, orbiters} ->
        Enum.any?(orbiters, fn orbiter -> orbiter == planet end)
      end)
      |> IO.inspect()

    siblings = Enum.reject(leaves, fn leaf -> leaf == planet end)

    if(parent == "YOU") do
      distance_traveled + 1
    else
    end
  end
end
