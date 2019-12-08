defmodule Day6Test do
  use ExUnit.Case

  test "properly calculates a single orbit" do
    assert Day6.total_orbits(["COM)BAD"]) == 1
  end

  test "properly calculates a direct and an indirect orbit" do
    assert Day6.total_orbits(["COM)ABC", "ABC)DEF", "COM)GHI", "DEF)JKL"]) == 7
    #
    #   COM ---- ABC ---- DEF ---- JKL
    #    I
    #   GHI
  end

  test "returns 42 for the test input" do
    assert Day6.total_orbits([
             "COM)B",
             "B)C",
             "C)D",
             "D)E",
             "E)F",
             "B)G",
             "G)H",
             "D)I",
             "E)J",
             "J)K",
             "K)L"
           ]) == 42
  end

  describe "part 2 stuff" do
    test "makes a nice hierarchical map" do
      assert Day6.orbit_map_redux(%{
               "B" => ["G", "C"],
               "C" => ["D"],
               "COM" => ["B", "R", "S"],
               "D" => ["E"],
               "E" => ["F"],
               "G" => ["H"],
               "R" => ["YOU"],
               "S" => ["SAN"]
             }) ==
               %{
                 "COM" => %{
                   "B" => %{"G" => %{"H" => %{}}, "C" => %{"D" => %{"E" => %{"F" => %{}}}}},
                   "R" => %{"YOU" => %{}},
                   "S" => %{"SAN" => %{}}
                 }
               }
    end

    test "see orbital map for example" do
      assert Day6.transfers_to_santa([
               "COM)B",
               "B)C",
               "C)D",
               "D)E",
               "E)F",
               "B)G",
               "G)H",
               "D)I",
               "E)J",
               "J)K",
               "K)L",
               "K)YOU",
               "I)SAN"
             ]) == 4
    end
  end
end
