defmodule Day5Test do
  use ExUnit.Case

  describe "parse_opcode/1" do
    test "parses op codes" do
      assert Day5.parse_opcode("01002") == %{
               operation: :multiply,
               op_mode_1: :position,
               op_mode_2: :immediate,
               op_mode_3: :position
             }
    end

    test "parses op codes with missing op mode characters" do
      assert Day5.parse_opcode("1002") == %{
               operation: :multiply,
               op_mode_1: :position,
               op_mode_2: :immediate,
               op_mode_3: :position
             }

      assert Day5.parse_opcode("02") == %{
               operation: :multiply,
               op_mode_1: :position,
               op_mode_2: :position,
               op_mode_3: :position
             }

      assert Day5.parse_opcode("102") == %{
               operation: :multiply,
               op_mode_1: :immediate,
               op_mode_2: :position,
               op_mode_3: :position
             }
    end
  end

  test "program writes input (1337) to mem[0] and outputs the input" do
    assert Day5.execute(["3", "0", "4", "0", "99"], "1337") == ["1337", "0", "4", "0", "99"]
  end

  test "writes 99 to index 4 using multiplication" do
    assert Day5.execute(["1002", "4", "3", "4", "33"], "1337") == ["1002", "4", "3", "4", "99"]
  end

  test "writes 99 to index 4 using addition" do
    assert Day5.execute(["1001", "4", "66", "4", "33"], "1337") == ["1001", "4", "66", "4", "99"]
  end

  test "writes 2 to index 4, which then writes 4 to index 8, outputs x and exits" do
    assert Day5.execute(["1101", "2", "0", "4", "99", "1", "1", "8", "99", "0", "99"], "1") ==
             ["1101", "2", "0", "4", "2", "1", "1", "8", "4", "0", "99"]
  end

  test "equals works properly" do
    assert Day5.execute(["1108", "7", "7", "5", "4", "7", "99"], "1") ==
             ["1108", "7", "7", "5", "4", "1", "99"]
  end

  test "lessthan works properly" do
    assert Day5.execute(["1107", "7", "7", "5", "4", "7", "99"], "1") ==
             ["1107", "7", "7", "5", "4", "0", "99"]
  end

  test "returns 999 when input is below 8" do
    assert Day5.execute(
             [
               "3",
               "21",
               "1008",
               "21",
               "8",
               "20",
               "1005",
               "20",
               "22",
               "107",
               "8",
               "21",
               "20",
               "1006",
               "20",
               "31",
               "1106",
               "0",
               "36",
               "98",
               "0",
               "0",
               "1002",
               "21",
               "125",
               "20",
               "4",
               "20",
               "1105",
               "1",
               "46",
               "104",
               "999",
               "1105",
               "1",
               "46",
               "1101",
               "1000",
               "1",
               "20",
               "4",
               "20",
               "1105",
               "1",
               "46",
               "98",
               "99"
             ],
             "7"
           ) == [
             "3",
             "21",
             "1008",
             "21",
             "8",
             "20",
             "1005",
             "20",
             "22",
             "107",
             "8",
             "21",
             "20",
             "1006",
             "20",
             "31",
             "1106",
             "0",
             "36",
             "98",
             "0",
             "7",
             "1002",
             "21",
             "125",
             "20",
             "4",
             "20",
             "1105",
             "1",
             "46",
             "104",
             "999",
             "1105",
             "1",
             "46",
             "1101",
             "1000",
             "1",
             "20",
             "4",
             "20",
             "1105",
             "1",
             "46",
             "98",
             "99"
           ]
  end
end
