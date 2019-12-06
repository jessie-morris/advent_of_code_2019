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
    end
  end
  test "program writes input (1337) to mem[0] and outputs the input" do
    assert Day5.execute(["3","0","4","0","99"], "1337") ==  ["1337","0","4","0","99"]
  end
  test "writes 99 to index 4 using multiplication" do
    assert Day5.execute(["1002","4","3","4","33"], "1337") == ["1002", "4", "3", "4", "99"]
  end
  test "writes 99 to index 4 using addition" do
    assert Day5.execute(["1001","4","66","4","33"], "1337") == ["1001", "4", "3", "4", "99"]
  end

end
